import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/screen/UIBuilding/studentList.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:apk/screen/studentList.dart';
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

Future<aStudent?> fetchStudentByID(
  BuildContext context,
  String studentID,
) async {
  await getAllStudent(context);
  for (var student in allStudent) {
    if (student.ID == studentID) {
      return student;
    }
  }
  snackBarMsg(
    context,
    AppColors.color6,
    "Not match student ID to Fetch Data..!",
    Icons.warning,
  );
  return null;
}

Future<aStudent?> searchStudentController(
  BuildContext context,
  String studentID,
) async {
  aStudent? student = await fetchStudentByID(context, studentID);
  if (student != null) {
    print("Student name ---> ${student.name}");
    Navigator.pop(context);
    return student;
  } else {
    print("Student Not Found");
    Navigator.pop(context);
    return null;
  }
}

String getAttendanceMarkForStudent(String student, int index, aMonth month) {
  final attendanceStudents = month.attendance[index].students;
  final matched = attendanceStudents.firstWhere(
    (attStudent) =>
        attStudent.split(' ').isNotEmpty && attStudent.split(' ')[0] == student,
    orElse: () => ' ',
  );
  if (matched.isNotEmpty && matched.split(' ').length > 1) {
    return matched.split(' ')[1][0];
  } else {
    return 'ab';
  }
}

void updateStudentController(BuildContext context, aStudent student) async {
  showPending(context);
  await updateStudent(context, student);
  print("Student updated successfully.");
  snackBarMsg(
    context,
    AppColors.color5,
    "Student updated successfully.",
    Icons.check,
  );
  Navigator.pop(context);
  await getAllStudent(context);
  await buildStudentList(context, allStudent);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => StudentList()),
  );
}

void deleteStudentController(BuildContext context, aStudent student) async {
  try {
    showPending(context);
    await deleteStudent(context, student);
    print("Student deleted successfully.");
    snackBarMsg(
      context,
      AppColors.color5,
      "Student deleted successfully.",
      Icons.check,
    );
    Navigator.pop(context);
    await getAllStudent(context);
    await buildStudentList(context, allStudent);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StudentList()),
    );
  } catch (e) {
    Navigator.pop(context);
    snackBarMsg(
      context,
      AppColors.color3,
      "Error deleting student: ${e.toString()}",
      Icons.warning_amber,
    );
  }
}
