import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/classFunction.dart';
import 'package:apk/firebase/payment.dart';
import 'package:apk/functions/payment.dart';
import 'package:apk/screen/UIBuilding/classList.dart';
import 'package:apk/screen/adminPanel.dart';
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
  await getAllClass(context);
  await buildClassList(context, allClass);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => adminPanel()),
  );
}

Future<void> addStudentIntoClassController(
  BuildContext context,
  aClass object,
  String studentID,
) async {
  showPending(context);
  print("Add student into class functionality for student ID: $studentID");
  object.students.add(studentID);
  await updateClass(context, object);
  Navigator.pop(context);
  print("Student added successfully to the class.");
}

Future<void> markAttendace(
  BuildContext context,
  aClass classObject,
  aMonth month,
  int monthIndex,
  int indexOfDay,
  String studentID,
  aDay day,
) async {
  showPending(context);
  print("Marking attendance for student ID in class: ${classObject.ID}");
  print("Index of day $indexOfDay Student $studentID MonthIndex $monthIndex");
  print("Details Of Day ${day.classID} Time ${day.time} Date ${day.date}");

  day.students.add(studentID);

  month.attendance[indexOfDay] = day;

  await updatePayment(context, classObject.ID, "2025", month, monthIndex);
  Navigator.pop(context);
  print("Update Succssfully..!");
}

List<String> fetchStudentIDFromAttendanceList(List<String> list) {
  return list.map((str) => str.split(' ').first).toList();
}
