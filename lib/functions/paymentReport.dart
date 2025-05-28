import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/allPayment.dart';
import 'package:apk/firebase/classFunction.dart';
import 'package:apk/firebase/payment.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/pdfGenarate/allClass.dart';
import 'package:apk/pdfGenarate/classPayment.dart';
import 'package:apk/screen/paymentReport.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/widgets.dart';

Future<void> pdfGenarateController(
  BuildContext context,
  aClass classObject,
  String year,
) async {
  showPending(context);
  await getAllStudent(context);
  print(
    "Index Of Payment Report Is --> $indexOfMonthOnPaymentReport Month--> ${getMonthName(indexOfMonthOnPaymentReport + 1)}",
  );
  String docID = "$year-${getMonthName(indexOfMonthOnPaymentReport + 1)}";
  await getAllPaymentByID(context, docID);

  aMonth payment = await getAMonthDetails(
    context,
    year,
    classObject.ID,
    indexOfMonthOnPaymentReport,
  );
  if (payment.name != "") {
    Navigator.pop(context);
    classMonthlyPaymentPDF(
      context,
      classObject,
      payment,
      allPaymentAMonth,
      year,
    );
  } else {
    print("Error when getting payment details..!");
    Navigator.pop(context);
  }
}

Future<void> allClassPdfGenarateController(
  BuildContext context,
  String year,
) async {
  showPending(context);
  String docID = "$year-${getMonthName(indexOfMonthOnPaymentReport + 1)}";
  await getAllPaymentByID(context, docID);
  await getAllClass(context);
  Navigator.pop(context);
  allClassMonthlyPaymentPDF(context, allClass, allPaymentAMonth, year);
}
