import 'package:apk/commonWidget/font&color.dart';
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
    print("Retrieved payment details");
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
  int indexOfClass,
) async {
  showPending(context);
  snackBarMsg(context, AppColors.color5, "$studentID", Icons.check);
  aStudent student = (await searchStudentController(context, studentID))!;

  if (student.classID.isNotEmpty) {
    buildClassListOnStudent(
      context,
      fetchClassUsingID(allClass, student.classID),
      indexOfClass,
      studentID,
    );

    List<aMonth>? payment = await getPaymentController(
      context,
      "2025",
      student.classID[indexOfClass],
    );
    if (payment != null && payment.isNotEmpty) {
      await buildMonthList(
        context,
        payment,
        student.classID[indexOfClass],
        studentID,
        indexOfClass,
      );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Collectpayment(student: student)),
    );
  } else {
    Navigator.pop(context);
    snackBarMsg(
      context,
      AppColors.color6,
      "Student not registered any Class..!",
      Icons.warning_rounded,
    );
  }
}

Future<void> waitForCollectPayment(
  BuildContext context,
  String year,
  aMonth month,
  String classID,
  String studentID,
  int indexOfClass,
) async {
  aPayment paymentObject = aPayment(
    year: year,
    month: month.name,
    classID: classID,
    studentID: studentID,
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
        month: month,
        indexOfClass: indexOfClass,
      ); // Call your StatefulWidget
    },
  );
}

List<aPayment> fetchPaymentDetails(
  String classID,
  String studentID,
  List<aPayment> payments,
) {
  return payments
      .where(
        (payment) =>
            payment.classID == classID && payment.studentID == studentID,
      )
      .toList();
}

List<aPayment> fetchClassAllPayment(String classID, List<aPayment> payments) {
  return payments.where((payment) => payment.classID == classID).toList();
}
