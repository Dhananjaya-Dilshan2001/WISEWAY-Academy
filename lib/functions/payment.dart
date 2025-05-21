import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/payment.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/UIBuilding/classList.dart';
import 'package:apk/screen/UIBuilding/monthList.dart';
import 'package:apk/screen/collectPayment.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:apk/screen/popUpWindows/tapOnMonth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

Future<void> waitForCollectPaymentPage(
  BuildContext context,
  String studentID,
  int indexOflass,
) async {
  showPending(context);
  aStudent student = (await searchStudentController(context, studentID))!;

  buildClassListOnStudent(
    context,
    fetchClassUsingID(allClass, student.classID),
    0,
  );

  List<aMonth>? payment = await getPaymentController(
    context,
    "2025",
    student.classID[indexOflass],
  );
  if (payment != null && payment.isNotEmpty) {
    await buildMonthList(context, payment, studentID);
  }

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Collectpayment(student: student)),
  );
}

Future<void> waitForCollectPayment(
  BuildContext context,
  String year,
  String month,
) async {
  aPayment paymentObject = aPayment(
    year: year,
    month: month,
    classID: "",
    studentID: "",
    value: 0,
    collectedDate: Timestamp.now(),
    reason: "Class Fee",
    method: "",
  );

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return tapOnMonth(
        paymentObject: paymentObject,
      ); // Call your StatefulWidget
    },
  );
}
