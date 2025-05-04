import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

List<aStudent> allStudent = [];

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

Future<String> genarateStudentID(BuildContext context, aStudent student) async {
  showPending(context);
  await getAllStudent(context);

  int studentCount = allStudent.length;
  String studentID = "KI";
  if (student.curriculm == "Edexcel") {
    studentID += "E";
  } else {
    studentID += "C";
  }
  studentID += "${student.grade}$studentCount";
  Navigator.of(context).pop();
  return studentID;
}

Future<void> registerStudentController(
  BuildContext context,
  aStudent student,
) async {
  print("Ready to register student");
  print("Name: ${student.name}");
  print("School: ${student.school}");
  print("Grade: ${student.grade}");

  print("WhatsApp No: ${student.whatsappNo}");
  print("Parent No: ${student.parentNo}");
  print("Gender: ${student.gender}");
  print("State: ${student.state}");
  print("Curriculum: ${student.curriculm}");
  print("ID: ${student.ID}");

  print("Birth Day: ${student.birthDay}");
  print("Other Info: ${student.otherInfo}");
  showPending(context);
  await addNewStudent(context, student);
  print("Student registered successfully.");
}
