import 'package:apk/dataModel/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<aPayment> allPaymentAMonth = [];

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
    print("Add a new Payment successfully..!");
  } on FirebaseException catch (e) {
    print("Error come when save payment details $e");
  }
}

Future<void> getAllPaymentByID(BuildContext context, String docID) async {
  try {
    DocumentReference documentRef = _firestore
        .collection('All Payment')
        .doc(docID);
    DocumentSnapshot docSnapshot = await documentRef.get();
    if (docSnapshot.exists) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      final payments = data['payments'] as List<dynamic>? ?? [];
      allPaymentAMonth =
          payments
              .map((e) => aPayment.fromMap(e as Map<String, dynamic>))
              .toList();
      print("Fetched all payments successfully!");
    } else {
      allPaymentAMonth = [];
      print("No payments found for this docID.");
    }
  } on FirebaseException catch (e) {
    print("Error fetching payment details: $e");
    allPaymentAMonth = [];
  }
}
