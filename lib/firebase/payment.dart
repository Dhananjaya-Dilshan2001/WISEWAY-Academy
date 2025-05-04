import 'package:apk/commonWidget/font&color.dart';
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
