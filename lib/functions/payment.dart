import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/payment.dart';
import 'package:flutter/material.dart';

List<Widget> dayList = [];

void initilizePaymentForAllMonth(BuildContext context, String classID) async {
  print("Payment initialized for all months for class ID: $classID.");

  List<Map<String, dynamic>> year = List.generate(12, (index) {
    var monthObject = nullMonthObject();
    monthObject.name =
        [
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
          "August",
          "September",
          "October",
          "November",
          "December",
        ][index];
    return monthObject.toMap();
  });
  print("Year length is ${year.length}");

  await InitilizeFireBaseClassPayment(
    context,
    "${DateTime.now().year}",
    classID,
    year,
  );
}

Future<List<aMonth>?> getPaymentController(
  BuildContext context,
  String year,
  String classID,
) async {
  print("Payment controller called for year: $year and class ID: $classID.");
  List<aMonth>? paymentDetails = await getPaymentDetails(
    context,
    year,
    classID,
  );
  if (paymentDetails != null) {
    print("Retrieved payment details: yessssssssssssssssssssssss");
    print("Test : ${paymentDetails[0].classID}");
    return paymentDetails;
  } else {
    print("No payment details found.");
    return null;
  }
}
