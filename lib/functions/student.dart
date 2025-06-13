import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/functions/sorting.dart';
import 'package:apk/screen/UIBuilding/studentList.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:apk/screen/studentList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      student.ID.length != 15) {
    return false;
  } else {
    return true;
  }
}

Future<String> genarateStudentID(
  BuildContext context,
  aStudent student,
  String OLYear,
) async {
  String studentID = "";
  studentID += student.curriculm == "Edexcel" ? "E" : "C";
  studentID +=
      "${OLYear.isEmpty ? "0" : OLYear.substring(2, 4)}-${student.birthDay.toDate().month.toString().padLeft(2, '0')}${student.birthDay.toDate().day.toString().padLeft(2, '0')}-" +
      "${student.registeredDate.toDate().month.toString().padLeft(2, '0')}${student.registeredDate.toDate().day.toString().padLeft(2, '0')}" +
      "${await getStudentDailyRegisteredCount(context, student.registeredDate)}";
  return studentID;
}

Future<String> getStudentDailyRegisteredCount(
  BuildContext context,
  Timestamp date,
) async {
  await getAllStudent(context);
  int count = 0;
  for (var student in allStudent) {
    if (student.registeredDate.toDate().day == date.toDate().day &&
        student.registeredDate.toDate().month == date.toDate().month &&
        student.registeredDate.toDate().year == date.toDate().year) {
      count++;
    }
  }
  return count.toString().padLeft(2, '0');
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

  await getAllStudent(context);
  Navigator.pop(context);
  await buildStudentList(context, sortStudentList(context, allStudent, "0"));
  Navigator.push(
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

void removeClassWhenClassDeleted(BuildContext context, String classID) async {
  await getAllStudent(context);
  print("Removing class ID: $classID from all students");
  for (var student in allStudent) {
    if (student.classID.contains(classID)) {
      print("Removing class ID: $classID from student: ${student.name}");
      student.classID.removeWhere((id) => id == classID);
      await updateStudent(context, student);
    }
  }
}
