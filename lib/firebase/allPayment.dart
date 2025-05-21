import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addNewPayment(
  BuildContext context,
  String docID,
  aPayment newPayment,
) async {
  List<aPayment> dummyIssue = [newPayment];
  try {
    List<Map<String, dynamic>> m =
        dummyIssue.map((dummyMember) => dummyMember.toMap()).toList();
    DocumentReference documentRef = _firestore
        .collection('All Payment')
        .doc(docID);

    DocumentSnapshot docSnapshot = await documentRef.get();

    if (docSnapshot.exists) {
      // Update existing document
      await documentRef.update({'payments': FieldValue.arrayUnion(m)});
    } else {
      // Create new document with the given docID
      await documentRef.set({'payments': m});
    }
    Navigator.pop(context);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.color5,
          content: Row(
            children: [
              Icon(Icons.check, color: AppColors.color4),
              SizedBox(width: 10),
              Text("Add a new Payment successfully..!", style: fontStyle.font3),
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
