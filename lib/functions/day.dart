import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/payment.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

Future<void> addDayController(
  BuildContext context,
  aClass classObject,
  aMonth month,
  int monthIndex,
  aDay day,
  String year,
) async {
  showPending(context);
  print("Month ${month.name} Month Index--$monthIndex");
  day.classID = classObject.ID;
  month.attendance.add(day);
  await updatePayment(context, classObject.ID, year, month);
  //Navigator.pop(context);

  navigateToClassDashboard(
    context,
    classObject,
    year,
    getMonthIntFromName(month.name),
  );
}

void deleteDayFromMonth(
  BuildContext context,
  aMonth month,
  aClass classObject,
  int dayIndex,
  String year,
) async {
  showPending(context);
  month.attendance.removeAt(dayIndex);
  await updatePayment(context, classObject.ID, year, month);
  navigateToClassDashboard(
    context,
    classObject,
    year,
    getMonthIntFromName(month.name),
  );
}
