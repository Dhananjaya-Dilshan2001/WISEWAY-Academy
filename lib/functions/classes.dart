import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/classFunction.dart';
import 'package:apk/firebase/payment.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/screen/UIBuilding/classList.dart';
import 'package:apk/screen/UIBuilding/dayList.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:apk/screen/classDashboard.dart';
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
  initilizePaymentForAllMonth(
    context,
    object.ID,
    "${DateTime.now().year.toString()}",
  );
  print("Class registered successfully.");
  await getAllClass(context);
  await buildClassList(context, allClass, "${DateTime.now().year}");
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => adminPanel()),
  );
}

Future<void> addStudentIntoClassController(
  BuildContext context,
  aClass object,
  aStudent student,
  String year,
) async {
  showPending(context);
  print("Add student into class functionality for student ID: ${student.ID}");

  // Check if student is already in the class
  if (object.students.contains(student.ID)) {
    Navigator.pop(context);
    Navigator.pop(context);
    snackBarMsg(
      context,
      AppColors.color6,
      "Student is already in this class.",
      Icons.info,
    );
    return;
  }

  student.classID.add(object.ID);
  await updateStudent(context, student);

  object.students.add(student.ID);
  await updateClass(context, object);
  Navigator.pop(context);
  print("Student added successfully to the class.");
  await getAllClass(context);
  navigateToClassDashboard(context, object, year, DateTime.now().month);
}

Future<void> markAttendace(
  BuildContext context,
  aClass classObject,
  aMonth month,
  int monthIndex,
  int indexOfDay,
  String studentID,
  aDay day,
  String year,
) async {
  // Check if studentID already exists in the day's students list
  // Check if studentID (without online/physical) already exists in the day's students list
  if (day.students.any(
    (s) => s.split(' ').first == studentID.split(' ').first,
  )) {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
    snackBarMsg(
      context,
      AppColors.color6,
      "Attendance already marked for this student.",
      Icons.info,
    );
    return;
  }

  day.students.add(studentID);

  month.attendance[indexOfDay] = day;

  await updatePayment(context, classObject.ID, year, month);
  print("Update Succssfully..!");
  navigateToClassDashboard(context, classObject, year, DateTime.now().month);
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

void updateClassController(BuildContext context, aClass object) async {
  showPending(context);
  await updateClass(context, object);

  print("Class updated successfully.");
  await getAllClass(context);
  await buildClassList(context, allClass, "${DateTime.now().year}");
  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => adminPanel()),
  );
}

void deleteClassController(BuildContext context, aClass object) async {
  showPending(context);
  await deleteClass(context, object);
  await deleteClassDocument(context, object.ID);
  print("Class deleted successfully.");
  await getAllClass(context);
  await buildClassList(context, allClass, "${DateTime.now().year}");
  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => adminPanel()),
  );
}

void removeStudentFromClassController(
  BuildContext context,
  aClass object,
  aStudent student,
  String year,
) async {
  showPending(context);
  print(
    "Remove student from class functionality for student ID: ${student.ID}",
  );

  student.classID.remove(object.ID);
  await updateStudent(context, student);

  object.students.remove(student.ID);
  await updateClass(context, object);
  Navigator.pop(context);
  print("Student removed successfully from the class.");

  navigateToClassDashboard(context, object, year, DateTime.now().month);
}

void removeAttendance(
  BuildContext context,
  aClass classObject,
  String studentID,
  aMonth month,
  int indexOfDay,
  String year,
) async {
  print(
    "Remove attendance for student ID: $studentID in class: ${classObject.ID} Month Name ${month.name} Index Of Day $indexOfDay",
  );
  showPending(context);
  month.attendance[indexOfDay].students.removeWhere(
    (s) => s.split(' ').first == studentID,
  );

  await updatePayment(context, classObject.ID, year, month);
  print("Update Succssfully..!");
  navigateToClassDashboard(
    context,
    classObject,
    year,
    getMonthIntFromName(month.name),
  );
}

Future<void> navigateToClassDashboard(
  BuildContext context,
  aClass classObject,
  String year,
  int monthIndex,
) async {
  monthIndex = monthIndex - 1;
  await getAllClass(context);

  aMonth monthObject = await getPaymentController(
    context,
    year,
    monthIndex,
    classObject,
  );
  await buildDayList(
    context,
    monthObject,
    classObject,
    monthObject.attendance,
    year,
  );

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder:
          (context) => Classdashboard(
            object: classObject,
            month: monthObject,
            year: year,
          ),
    ),
  );
}

Future<String> yearShiftController(
  BuildContext context,
  String classID,
  String currentYear,
  bool isNext,
) async {
  List<String> yearList = await getAvailableYearsAClass(context, classID);
  yearList.sort((a, b) => a.compareTo(b)); // Sort years ascending
  print("Available years for class $classID: $yearList");

  int currentYearIndex = yearList.indexOf(currentYear);
  if (currentYearIndex == -1) {
    print("Current year not found in the list.");
    return "";
  }

  if (isNext) {
    if (currentYearIndex < yearList.length - 1) {
      currentYearIndex++;
    }
  } else {
    if (currentYearIndex > 0) {
      currentYearIndex--;
    }
  }

  commonYear = yearList[currentYearIndex];
  print("Shifting year from $currentYear to $commonYear");
  return commonYear;
}
