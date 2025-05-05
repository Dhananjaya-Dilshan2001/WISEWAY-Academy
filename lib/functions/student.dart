import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

List<aStudent> allStudent = [];
List<Widget> studentList = [];
List<Widget> viewStudent = [];

bool isStudentObjectNull(aStudent student) {
  if (student.name == "" ||
      student.school == "" ||
      student.grade == "" ||
      student.whatsappNo == "" ||
      student.parentNo == "" ||
      student.gender == "" ||
      student.state == "" ||
      student.curriculm == "" ||
      student.ID.length != 13) {
    return false;
  } else {
    return true;
  }
}

String genarateStudentID(BuildContext context, aStudent student) {
  String studentID = "";
  studentID += student.curriculm == "Edexcel" ? "E" : "C";
  studentID +=
      "${student.grade}-${student.birthDay.toDate().month.toString().padLeft(2, '0')}${student.birthDay.toDate().day.toString().padLeft(2, '0')}-" +
      "${student.registeredDate.toDate().month.toString().padLeft(2, '0')}${student.registeredDate.toDate().day.toString().padLeft(2, '0')}";
  return studentID;
}

Future<void> registerStudentController(
  BuildContext context,
  aStudent student,
) async {
  showPending(context);
  await addNewStudent(context, student);
  print("Student registered successfully.");
}

List<aStudent> fetchStudentByIDs(
  List<String> studentIDs,
  List<aStudent> allStudents,
) {
  return allStudents
      .where((student) => studentIDs.contains(student.ID))
      .toList();
}
