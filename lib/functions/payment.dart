import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/payment.dart';
import 'package:flutter/material.dart';

void initilizePaymentForAllMonth(BuildContext context, String classID) async {
  print("Payment initialized for all months for class ID: $classID.");

  List<Map<String, dynamic>> year = List.generate(
    12,
    (index) => nullMonthObject().toMap(),
  );
  print("Year length is ${year.length}");

  await InitilizeFireBaseClassPayment(
    context,
    "${DateTime.now().year}",
    classID,
    year,
  );
}
