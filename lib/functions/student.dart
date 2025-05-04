import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

List<aStudent> allStudent = [];
List<Widget> studentList = [];

bool isStudentObjectNull(aStudent student) {
  if (student.name == "" ||
      student.school == "" ||
      student.grade == "" ||
      student.whatsappNo == "" ||
      student.parentNo == "" ||
      student.gender == "" ||
      student.state == "" ||
      student.curriculm == "" ||
      student.ID == "") {
    return false;
  } else {
    return true;
  }
}

String genarateStudentID(BuildContext context, aStudent student) {
  getAllStudent(context);
  int studentCount = allStudent.length;
  String studentID = "KI";
  if (student.curriculm == "Edexcel") {
    studentID += "E";
  } else {
    studentID += "C";
  }
  studentID += "${student.grade}$studentCount";
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
