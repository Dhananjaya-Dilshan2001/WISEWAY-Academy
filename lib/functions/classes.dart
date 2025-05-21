import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/classFunction.dart';
import 'package:apk/firebase/payment.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/functions/paymentInFunction.dart';
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
  aStudent student,
) async {
  showPending(context);
  print("Add student into class functionality for student ID: ${student.ID}}");

  student.classID.add(object.ID);
  await updateStudent(context, student);

  object.students.add(student.ID);
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

int getMonthIntFromName(String monthName) {
  const months = {
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12,
  };
  return months[monthName] ?? 0;
}

String getMonthName(int monthNumber) {
  const months = [
    '', // Placeholder for 0 index
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  if (monthNumber >= 1 && monthNumber <= 12) {
    return months[monthNumber];
  }
  return '';
}

int nextBackController(int currentMonth, bool isNext) {
  if (isNext) {
    if (1 <= currentMonth && currentMonth <= 11) {
      return currentMonth + 1;
    } else {
      return currentMonth;
    }
  } else {
    if (2 <= currentMonth && currentMonth <= 12) {
      return currentMonth - 1;
    } else {
      return currentMonth;
    }
  }
}

List<aClass> fetchClassUsingID(List<aClass> allClass, List<String> classID) {
  return allClass.where((c) => classID.contains(c.ID)).toList();
}
