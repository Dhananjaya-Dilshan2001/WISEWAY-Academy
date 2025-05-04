import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/classFunction.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

List<aClass> allClass = [];
List<Widget> classList = [];

String generateClassID(BuildContext context, aClass object) {
  String classID = "KI";
  if (object.curriculm == "Edexcel") {
    classID += "E";
  } else {
    classID += "C";
  }
  classID += "${object.grade}0";
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
  print("Class registered successfully.");
}
