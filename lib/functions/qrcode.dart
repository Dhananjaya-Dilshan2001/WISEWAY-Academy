import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:apk/screen/popUpWindows/updateStudent.dart';
import 'package:flutter/material.dart';

Future<void> catchQRScannerID(
  BuildContext context,
  String studentID,
  int purpose,
  aClass classObject,
  int indexOfDay,
  aMonth month,
  int monthIndex,
  String year,
) async {
  print("Student ID : $studentID");
  if (purpose == 0) {
    await waitForCollectPaymentPage(
      context,
      studentID,
      0,
      "${DateTime.now().year.toString()}",
    );
  } else if (purpose == 1) {
    aStudent? student = await fetchStudentByID(context, studentID);

    addStudentIntoClassController(context, classObject, student!, year);
  } else if (purpose == 2) {
    if (classObject.students.any((student) => student == studentID)) {
      aStudent? student = await fetchStudentByID(context, studentID);
      Navigator.pop(context);
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return attendStudent(
            student: student!,
            indexOfDay: indexOfDay,
            classObject: classObject,
            day: month.attendance[indexOfDay],
            monthIndex: monthIndex,
            month: month,
            year: year,
          ); // Call your StatefulWidget
        },
      );
      return;
    } else {
      snackBarMsg(
        context,
        AppColors.color6,
        "This student not registered for this class.",
        Icons.warning,
      );
      Navigator.pop(context);
      return;
    }
  } else {
    snackBarMsg(
      context,
      AppColors.color6,
      "Not a purpose of Scan QR",
      Icons.warning,
    );
  }
}
