import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/payment.dart';
import 'package:apk/functions/payment.dart';
import 'package:apk/screen/UIBuilding/dayList.dart';
import 'package:apk/screen/classDashboard.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

Future<void> addDayController(
  BuildContext context,
  aClass classObject,
  aMonth month,
  int monthIndex,
  aDay day,
) async {
  showPending(context);
  month.attendance.add(day);
  await updatePayment(context, classObject.ID, "2025", month, monthIndex);
  //Navigator.pop(context);

  List<aMonth>? payment = await getPaymentController(
    context,
    "2025",
    classObject.ID,
  );
  if (payment != null && payment.isNotEmpty) {
    await buildDayList(
      context,
      0,
      payment[0],
      classObject,
      payment[0].attendance,
    );
  }
  Navigator.push(
    context,
    MaterialPageRoute(
      builder:
          (context) => Classdashboard(
            object: classObject,
            month: payment?[0] ?? nullMonthObject(),
          ),
    ),
  );
}
