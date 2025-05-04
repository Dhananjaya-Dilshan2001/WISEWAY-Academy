import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/classFunction.dart';
import 'package:apk/functions/payment.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

List<aClass> allClass = [];
List<Widget> classList = [];

String generateClassID(BuildContext context, aClass object) {
  String classID = "";
  classID += object.curriculm == "Edexcel" ? "E" : "C";
  classID +=
      "${object.grade}${object.registeredDate.toDate().month.toString().padLeft(2, '0')}${object.registeredDate.toDate().day.toString().padLeft(2, '0')}-";
  classID +=
      "${object.subject.split(' ').first}-${object.teacher.split(' ').first}";
  return classID;
}

bool isClassObjectNull(aClass object) {
  if (object.subject == "" ||
      object.teacher == "" ||
      object.grade == "" ||
      object.whatsappNo == "" ||
      object.note == "" ||
      object.state == "" ||
      object.curriculm == "" ||
      object.ID == "") {
    return false;
  } else {
    return true;
  }
}

Future<void> addClassController(BuildContext context, aClass object) async {
  showPending(context);
  await addNewClass(context, object);
  initilizePaymentForAllMonth(context, object.ID);
  print("Class registered successfully.");
}
