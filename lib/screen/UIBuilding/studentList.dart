import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/functions/sorting.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:apk/screen/popUpWindows/classCard.dart';
import 'package:apk/screen/popUpWindows/registerStudent.dart';
import 'package:apk/screen/studentList.dart';
import 'package:flutter/material.dart';

List<Widget> gradeList = [];

GestureDetector listCard(
  BuildContext context,
  int no,
  List<String> name,
  String ID,
  String grade,
  aStudent studentObject,
) {
  //print("Student Name Is ${name[0]} ${name[1]}");
  return GestureDetector(
    onLongPress:
        () => popUpMsg(
          context,
          Colors.red,
          "Are you sure..!",
          "Are you sure to delete this Student Details..?\nAll data will be lost..!",
          () => deleteStudentController(context, studentObject),
        ),
    onTap: () async {
      await waitForCollectPaymentPage(
        context,
        ID,
        0,
        DateTime.now().year.toString(),
      );
    },
    child: Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.color3, // Set the background color of the container
        borderRadius: BorderRadius.circular(10.0), // Set the corner radius
      ),
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color:
                  AppColors.color4, // Set the background color of the container
              borderRadius: BorderRadius.circular(8.0), // Set the corner radius
            ),
            child: Center(child: Text("$no", style: fontStyle.font8)),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          GestureDetector(
            onTap: () {
              viewCard(context, studentObject);
            },
            child: Container(
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                color: AppColors.color4,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('Image/studentP.png'), // Background image
                  fit:
                      BoxFit
                          .contain, // How the image should fit in the container
                ),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), // Set the corner radius
            ),
            child: Text("${name[0]}", style: fontStyle.font3),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), // Set the corner radius
            ),
            child: Text("$ID", style: fontStyle.font5),
          ),
          //SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,

            //width: MediaQuery.of(context).size.width * 0.1,
            child: Center(child: Text("$grade", style: fontStyle.font3)),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          GestureDetector(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return registerStudent(
                    isRegister: false,
                    buttonText: "Update",
                    student: studentObject,
                  ); // Call your StatefulWidget
                },
              );
            },
            child: Icon(Icons.settings, color: AppColors.color4),
          ),
        ],
      ),
    ),
  );
}

//add items for table
void addNewStudentToList(
  BuildContext context,
  int no,
  List<String> name,
  String ID,
  String grade,
  aStudent studentObject,
) {
  studentList.add(SizedBox(height: 5));
  studentList.add(listCard(context, no, name, ID, grade, studentObject));
}

//build student widget list
Future<void> buildStudentList(
  BuildContext context,
  List<aStudent> students,
) async {
  studentList = []; // Clear the list before adding new items
  int l = students.length;

  for (int i = 0; i < l; i++) {
    addNewStudentToList(
      context,
      i + 1,
      students[i].name.split(' '),
      students[i].ID,
      students[i].grade,
      students[i],
    );
  }
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => StudentList()),
  // );
}

void buildGradeList(
  BuildContext context,
  List<aStudent> students,
  String selectedGrade,
) {
  gradeList = [];
  List<String> grades = students.map((s) => s.grade).toSet().toList();
  int l = grades.length;
  print("Lenth of array in Build Grade List Is $grades");

  for (int i = 0; i < l; i++) {
    gradeList.add(SizedBox(width: 2));
    gradeList.add(
      GestureDetector(
        onTap: () async {
          tapAllGrade = AppColors.color1;
          tapGrade = grades[i];
          buildGradeList(context, allStudent, grades[i]);
          await buildStudentList(
            context,
            sortStudentList(context, students, grades[i]),
          );
          {
            (context as Element).markNeedsBuild();
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Center(
            child: Text(
              "${grades[i].length == 1 ? "0${grades[i]}" : grades[i]}",
              style: fontStyle.font5,
            ),
          ),
          decoration: BoxDecoration(
            color:
                selectedGrade == grades[i]
                    ? AppColors.color6
                    : AppColors.color1,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
