import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/allPayment.dart';
import 'package:apk/functions/classes.dart';
import 'package:flutter/material.dart';

Future<void> addNewPaymentController(
  BuildContext context,
  aPayment payment,
) async {
  String docID =
      "${payment.collectedDate.toDate().year}-${getMonthName(payment.collectedDate.toDate().month)}";

  print(
    "Doc Id Is: $docID -- ${payment.classID} ${payment.collectedDate} ${payment.studentID} ${payment.reason}",
  );

  await addNewPayment(context, docID, payment);
}
