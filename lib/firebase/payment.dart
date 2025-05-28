import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> InitilizeFireBaseClassPayment(
  BuildContext context,
  String year,
  String classID,
  List<Map<String, dynamic>> m,
) async {
  try {
    DocumentReference documentRef = _firestore
        .collection('Payment')
        .doc(classID);

    DocumentSnapshot documentSnapshot = await documentRef.get();
    Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;

    // Check if the year already exists
    if (data != null && data.containsKey(year)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.color6,
            content: Row(
              children: [
                Icon(Icons.info, color: AppColors.color3),
                SizedBox(width: 10),
                Text(
                  "Year '$year' already exists for this class. Initialization skipped.",
                  style: fontStyle.font3,
                ),
              ],
            ),
            duration: Duration(seconds: 4),
          ),
        );
      }
      return;
    }

    await documentRef.set({year: m}, SetOptions(merge: true));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.color5,
          content: Row(
            children: [
              Icon(Icons.check, color: AppColors.color4),
              SizedBox(width: 10),
              Text(
                "Initialised firebase for payment successfully..!",
                style: fontStyle.font3,
              ),
            ],
          ),
          duration: Duration(seconds: 4),
        ),
      );
    }
  } on FirebaseException catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.color6,
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Icon(Icons.warning_amber, color: AppColors.color3),
                SizedBox(width: 10),
                Text('Error: ${e.message}'),
              ],
            ),
          ),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}

Future<aMonth> getAMonthDetails(
  BuildContext context,
  String year,
  String classID,
  int monthIndex,
) async {
  try {
    DocumentReference documentRef = _firestore
        .collection('Payment')
        .doc(classID);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      List<Map<String, dynamic>>? paymentDetails =
          data?[year]?.cast<Map<String, dynamic>>();

      if (paymentDetails != null &&
          monthIndex >= 0 &&
          monthIndex < paymentDetails.length) {
        aMonth monthObj = aMonth.fromJson(paymentDetails[monthIndex]);
        return monthObj;
      } else {
        if (context.mounted) {
          snackBarMsg(
            context,
            AppColors.color6,
            "Invalid month index or no data found for the specified year.",
            Icons.info,
          );
        }
        return nullMonthObject();
      }
    } else {
      if (context.mounted) {
        snackBarMsg(
          context,
          AppColors.color6,
          "No data found for the specified class ID.",
          Icons.info,
        );
      }
      return nullMonthObject();
    }
  } on FirebaseException catch (e) {
    if (context.mounted) {
      snackBarMsg(
        context,
        AppColors.color6,
        "$e when get payment month",
        Icons.info,
      );
    }
    return nullMonthObject();
  }
}

Future<void> updatePayment(
  BuildContext context,
  String classID,
  String year,
  aMonth updatedMonth,
) async {
  int index =
      getMonthIntFromName(updatedMonth.name) -
      1; // Adjusting index to be zero-based
  updatedMonth.classID = classID;
  try {
    DocumentReference documentRef = _firestore
        .collection('Payment')
        .doc(classID);

    // Retrieve the existing data for the specified year
    DocumentSnapshot documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      List<Map<String, dynamic>>? paymentDetails =
          data?[year]?.cast<Map<String, dynamic>>();

      if (paymentDetails != null &&
          index >= 0 &&
          index < paymentDetails.length) {
        // Update the specific object at the given index
        paymentDetails[index] = updatedMonth.toJson();

        // Update Firestore with the modified list
        await documentRef.update({year: paymentDetails});

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.color5,
              content: Row(
                children: [
                  Icon(Icons.check, color: AppColors.color4),
                  SizedBox(width: 10),
                  Text(
                    "Payment Month Details updated successfully!",
                    style: fontStyle.font3,
                  ),
                ],
              ),
              duration: Duration(seconds: 4),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.color6,
              content: Row(
                children: [
                  Icon(Icons.info, color: AppColors.color3),
                  SizedBox(width: 10),
                  Text(
                    "Invalid index or no data found for the specified year.",
                  ),
                ],
              ),
              duration: Duration(seconds: 4),
            ),
          );
        }
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.color6,
            content: Row(
              children: [
                Icon(Icons.info, color: AppColors.color3),
                SizedBox(width: 10),
                Text("No data found for the specified class ID."),
              ],
            ),
            duration: Duration(seconds: 4),
          ),
        );
      }
    }
  } on FirebaseException catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.color6,
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Icon(Icons.warning_amber, color: AppColors.color3),
                SizedBox(width: 10),
                Text('Error: ${e.message}'),
              ],
            ),
          ),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}

Future<List<aMonth>> getAllMonthDetails(
  BuildContext context,
  String year,
  String classID,
) async {
  try {
    DocumentReference documentRef = _firestore
        .collection('Payment')
        .doc(classID);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      List<dynamic>? paymentDetails = data?[year];

      if (paymentDetails != null && paymentDetails.isNotEmpty) {
        List<aMonth> monthList =
            paymentDetails
                .map((e) => aMonth.fromJson(Map<String, dynamic>.from(e)))
                .toList();
        return monthList;
      } else {
        if (context.mounted) {
          snackBarMsg(
            context,
            AppColors.color6,
            "No month data found for the specified year.",
            Icons.info,
          );
        }
        return [];
      }
    } else {
      if (context.mounted) {
        snackBarMsg(
          context,
          AppColors.color6,
          "No data found for the specified class ID.",
          Icons.info,
        );
      }
      return [];
    }
  } on FirebaseException catch (e) {
    if (context.mounted) {
      snackBarMsg(
        context,
        AppColors.color6,
        "$e when getting all payment months",
        Icons.info,
      );
    }
    return [];
  }
}

Future<void> deleteClassDocument(BuildContext context, String classID) async {
  try {
    DocumentReference documentRef = _firestore
        .collection('Payment')
        .doc(classID);

    await documentRef.delete();
    snackBarMsg(
      context,
      AppColors.color5,
      "Class document deleted successfully.",
      Icons.check,
    );
  } on FirebaseException catch (e) {
    snackBarMsg(
      context,
      AppColors.color6,
      "Error deleting class document: ${e.message}",
      Icons.error,
    );
  }
}

Future<List<String>> getAvailableYearsAClass(
  BuildContext context,
  String classID,
) async {
  try {
    DocumentReference documentRef = _firestore
        .collection('Payment')
        .doc(classID);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        return data.keys.map((e) => e.toString()).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  } on FirebaseException {
    return [];
  }
}
