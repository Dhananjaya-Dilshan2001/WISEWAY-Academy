import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/screen/studentList.dart';
import 'package:flutter/widgets.dart';

List<aStudent> sortStudentList(
  BuildContext context,
  List<aStudent> students,
  String grade,
) {
  if (tapCambridge == AppColors.color1 && tapEdexcel == AppColors.color1) {
    return grade == "0"
        ? sortStudentsByName(students)
        : sortStudentsByName(filterStudentsByGrade(students, grade));
  } else {
    return tapCambridge == AppColors.color6
        ? sortStudentsByName(
          filterStudentByCurriculum(
            context,
            filterStudentsByGrade(students, grade),
            "Cambridge",
          ),
        )
        : sortStudentsByName(
          filterStudentByCurriculum(
            context,
            filterStudentsByGrade(students, grade),
            "Edexcel",
          ),
        );
  }
}

List<aStudent> filterStudentsByGrade(List<aStudent> students, String grade) {
  if (grade == "0") {
    return students;
  }
  return students.where((student) => student.grade == "$grade").toList();
}

List<aStudent> sortStudentsByName(List<aStudent> students) {
  students.sort((a, b) => a.name.compareTo(b.name));
  return students;
}

List<aStudent> filterStudentByCurriculum(
  BuildContext context,
  List<aStudent> students,
  String curriculum,
) {
  List<aStudent> filteredStudents =
      students.where((student) => student.curriculm == curriculum).toList();
  return filteredStudents;
}
