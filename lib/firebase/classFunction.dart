import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addNewClass(BuildContext context, aClass object) async {
  List<aClass> dummyIssue = [object];
  try {
    List<Map<String, dynamic>> m =
        dummyIssue.map((dummyMember) => dummyMember.toMap()).toList();
    DocumentReference documentRef = _firestore
        .collection('WISEWAY Academy')
        .doc("class");
    await documentRef.update({'class': FieldValue.arrayUnion(m)});

    if (context.mounted) {
      // Navigator.of(context).pop();
      // Navigator.of(context).pop();
      // Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.color5,
          content: Row(
            children: [
              Icon(Icons.check, color: AppColors.color4),
              SizedBox(width: 10),
              Text("Add a new class successfully..!", style: fontStyle.font3),
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

Future<void> getAllClass(BuildContext context) async {
  allClass = [];
  DocumentSnapshot documentSnapshot =
      await _firestore.collection('WISEWAY Academy').doc("class").get();
  if (documentSnapshot.exists) {
    List<dynamic> customObjectsJson = documentSnapshot['class'];
    allClass = customObjectsJson.map((json) => aClass.fromJson(json)).toList();
    print('Retrieved array: ${allClass.length}');
  } else {
    print('Document does not exist');
  }
}

Future<void> updateClass(BuildContext context, aClass object) async {
  try {
    DocumentReference documentRef = _firestore
        .collection('WISEWAY Academy')
        .doc("class");

    DocumentSnapshot documentSnapshot = await documentRef.get();
    if (documentSnapshot.exists) {
      List<dynamic> classList = documentSnapshot['class'];
      int indexToUpdate = classList.indexWhere(
        (item) => item['ID'] == object.ID,
      );

      if (indexToUpdate != -1) {
        classList[indexToUpdate] = object.toMap();
        await documentRef.update({'class': classList});

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.color5,
              content: Row(
                children: [
                  Icon(Icons.check, color: AppColors.color4),
                  SizedBox(width: 10),
                  Text("Class updated successfully..!", style: fontStyle.font3),
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
                  Icon(Icons.warning_amber, color: AppColors.color3),
                  SizedBox(width: 10),
                  Text("Class not found."),
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
                Icon(Icons.warning_amber, color: AppColors.color3),
                SizedBox(width: 10),
                Text("Document does not exist."),
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
