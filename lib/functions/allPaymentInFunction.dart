import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/allPayment.dart';
import 'package:apk/firebase/payment.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

Future<void> addNewPaymentController(
  BuildContext context,
  aPayment payment,
  aMonth month,
  int indexOfClass,
  String year,
) async {
  showPending(context);
  String docID =
      "${payment.collectedDate.toDate().year}-${getMonthName(payment.collectedDate.toDate().month)}";

  print(
    "Doc Id Is: $docID -- ${payment.classID} ${payment.collectedDate} ${payment.studentID} ${payment.reason}",
  );

  await addNewPayment(context, docID, payment);

  month.paidStudents.add(
    "${payment.studentID} Paid ${payment.value}=>${payment.method}",
  );
  print("Class Id is --> ${payment.classID}");
  await updatePayment(context, payment.classID, year, month);
  Navigator.pop(context);
  await waitForCollectPaymentPage(
    context,
    payment.studentID,
    indexOfClass,
    year,
  );
}

String fetchStudenDetailsByID(
  List<aStudent> allStudent,
  String studentID,
  String value,
) {
  aStudent? student =
      allStudent.where((s) => s.ID == studentID).isNotEmpty
          ? allStudent.firstWhere((s) => s.ID == studentID)
          : null;
  if (student == null) return '';
  switch (value) {
    case 'name':
      return student.name;
    case 'grade':
      return student.grade;
    case 'curriculm':
      return student.curriculm;
    // Add more cases as needed
    default:
      return '';
  }
}

String fetchClassDetailsByID(
  List<aClass> allclass,
  String classID,
  String value,
) {
  aClass? classObject =
      allClass.where((s) => s.ID == classID).isNotEmpty
          ? allClass.firstWhere((s) => s.ID == classID)
          : null;
  if (classObject == null) return '';
  switch (value) {
    case 'subject':
      return classObject.subject;
    case 'curriculm':
      return classObject.curriculm;
    case 'grade':
      return classObject.grade;
    case '':
      return classObject.grade;
    // Add more cases as needed
    default:
      return '';
  }
}

List<aPayment> fetchClassAllPayment(
  String classID,
  List<aPayment> payments,
  String year,
) {
  return payments
      .where((payment) => payment.classID == classID && payment.year == year)
      .toList();
}

int getMonthlyPaymentAClass(
  String classID,
  List<aPayment> payments,
  String year,
) {
  List<aPayment> classAllPayment = fetchClassAllPayment(
    classID,
    payments,
    year,
  );
  int totalPayment = classAllPayment.fold(
    0,
    (sum, payment) => sum + payment.value,
  );
  return totalPayment;
}
