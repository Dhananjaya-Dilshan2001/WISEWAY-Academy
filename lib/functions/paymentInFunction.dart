import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/classFunction.dart';
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

void initilizePaymentForAllMonth(
  BuildContext context,
  String classID,
  String yearName,
) async {
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

  await InitilizeFireBaseClassPayment(context, "$yearName", classID, year);
}

Future<aMonth> getPaymentController(
  BuildContext context,
  String year,
  int indexOfMonth,
  aClass classObject,
) async {
  print(
    "Payment controller called for year: $year and class ID: ${classObject.ID}.",
  );
  aMonth monthDetails = await getAMonthDetails(
    context,
    year,
    classObject.ID,
    indexOfMonth,
  );
  return monthDetails;
}

Future<void> waitForCollectPaymentPage(
  BuildContext context,
  String studentID,
  int indexOfClass,
  String year,
) async {
  showPending(context);
  print("came to the method Student Id is --> $studentID");
  aStudent? student = (await searchStudentController(context, studentID));
  print(
    "Student Class ID Length --> ${student?.classID.length} Index of Month $indexOfClass",
  );
  if (student?.classID.length == 0) {
    Navigator.pop(context);
    snackBarMsg(
      context,
      AppColors.color6,
      "Student not registered any Class..!",
      Icons.warning_rounded,
    );
  }
  if (student == null) {
    Navigator.pop(context);
    Navigator.pop(context);
    snackBarMsg(
      context,
      AppColors.color6,
      "Student Not Found, Invalid Student ID..!",
      Icons.warning_rounded,
    );
    return;
  }

  if (student.classID.isNotEmpty) {
    buildClassListOnStudent(
      context,
      fetchClassUsingID(allClass, student.classID),
      indexOfClass,
      studentID,
    );

    List<aMonth> payment = await getAllMonthDetails(
      context,
      year,
      student.classID[indexOfClass],
    );

    await buildMonthList(
      context,
      payment,
      student.classID[indexOfClass],
      studentID,
      indexOfClass,
      year,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => Collectpayment(
              student: student,
              year: year,
              indexOfClass: indexOfClass,
            ),
      ),
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
        year: year,
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

Future<void> setFirebaseForNextYear(BuildContext context) async {
  await getAllClass(context); // Await if it's async
  String year = "${DateTime.now().year + 1}";
  print("Initializing payment for next year: $year");

  await Future.forEach(allClass, (classObj) async {
    initilizePaymentForAllMonth(context, classObj.ID, year);
  });

  snackBarMsg(
    context,
    AppColors.color5,
    "Payment initialized for next year.",
    Icons.info,
  );
}
