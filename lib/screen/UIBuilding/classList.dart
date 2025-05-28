import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/filters.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:apk/screen/collectPayment.dart';
import 'package:apk/screen/popUpWindows/addANewClass.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

List<Widget> gradeListOfClasses = [];

GestureDetector listCardOnClassList(
  BuildContext context,
  String grade,
  String curriculm,
  String subject,
  List<String> note,
  String teacher,
  String ID,
  aClass object,
  String year,
) {
  //print("Student Name Is ${name[0]} ${name[1]}");
  return GestureDetector(
    onLongPress: () {
      popUpMsg(
        context,
        Colors.red,
        "Are you sure..!",
        "Are you sure to delete this class..?\nAll data will be lost..!",
        () => deleteClassController(context, object),
      );
    },
    onTap: () async {
      showPending(context);
      navigateToClassDashboard(
        context,
        object,
        DateTime.now().year.toString(),
        DateTime.now().month,
      );
      print("Today month is : ${DateTime.now().month}");
    },
    child: Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      //height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: AppColors.color2.withOpacity(0.7),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.01),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.25),
              Text(
                "Grade $grade - $curriculm",
                style: TextStyle(
                  color: AppColors.color4,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansSinhala',
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.17),
              GestureDetector(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return addANewClass(
                        buttonText: "Update",
                        isRegister: false,
                        title: "Update Class Details",
                        object: object,
                      ); // Call your StatefulWidget
                    },
                  );
                  //updateClassController(context, object);
                },
                child: Icon(Icons.settings, color: AppColors.color4),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.01),
          Text(
            "$subject",
            style: TextStyle(
              color: AppColors.color4,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansSinhala',
              fontSize: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.01),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                //height: MediaQuery.of(context).size.height * 0.05,
                //color: AppColors.color5,
                child: Text(
                  "${note[0]}",
                  style: TextStyle(
                    color: AppColors.color4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansSinhala',
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),

              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.centerRight,
                //color: AppColors.color5,
                child: Text(
                  "Conducted by",
                  style: TextStyle(
                    color: AppColors.color4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansSinhala',
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                //color: AppColors.color5,
                child: Text(
                  "${note.length > 1 ? note[1] : " "}",
                  style: TextStyle(
                    color: AppColors.color4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansSinhala',
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.centerRight,
                //color: AppColors.color5,
                child: Text(
                  "$teacher",
                  style: TextStyle(
                    color: AppColors.color4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansSinhala',
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

//add items for table
void addNewClassToList(
  BuildContext context,
  String grade,
  String curriculm,
  String subject,
  List<String> note,
  String teacher,
  String ID,
  aClass object,
  String year,
) {
  classList.add(SizedBox(height: 5));
  classList.add(
    listCardOnClassList(
      context,
      grade,
      curriculm,
      subject,
      note,
      teacher,
      ID,
      object,
      year,
    ),
  );
}

//build student widget list
Future<void> buildClassList(
  BuildContext context,
  List<aClass> objects,
  String year,
) async {
  classList = []; // Clear the list before adding new items
  int l = objects.length;
  print("Lenth of array in Build Class List Is $l");

  for (int i = 0; i < l; i++) {
    addNewClassToList(
      context,
      objects[i].grade,
      objects[i].curriculm,
      objects[i].subject,
      objects[i].note.split(' '),
      objects[i].teacher,
      objects[i].ID,
      objects[i],
      year,
    );
  }
}

GestureDetector classCardOnStudent(
  BuildContext context,
  aClass object,
  Color bgColor,
  String studentID,
  int index,
) {
  return GestureDetector(
    onTap: () async {
      await waitForCollectPaymentPage(
        context,
        studentID,
        index,
        DateTime.now().year.toString(),
      );
    },
    child: Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      //height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.01),
          Text(
            "Grade ${object.grade} - ${object.curriculm} : ",
            style: TextStyle(
              color: AppColors.color4,
              fontFamily: 'NotoSansSinhala',
              fontSize: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          //SizedBox(height: MediaQuery.of(context).size.width * 0.01),
          Text(
            "${object.subject}",
            style: TextStyle(
              color: AppColors.color4,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansSinhala',
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
        ],
      ),
    ),
  );
}

//add items for table
void addNewClassOnStudent(
  BuildContext context,
  aClass object,
  Color bgColor,
  String studentID,
  int index,
) {
  classListOnStudent.add(SizedBox(height: 5));
  classListOnStudent.add(
    classCardOnStudent(context, object, bgColor, studentID, index),
  );
}

//build student widget list
Future<void> buildClassListOnStudent(
  BuildContext context,
  List<aClass> objects,
  int selectedCard,
  String studentID,
) async {
  classListOnStudent = []; // Clear the list before adding new items
  int l = objects.length;
  print("Lenth of array in Build Class List Is $l");

  for (int i = 0; i < l; i++) {
    addNewClassOnStudent(
      context,
      objects[i],
      i == selectedCard ? AppColors.color3 : AppColors.color3.withOpacity(0.4),
      studentID,
      i,
    );
  }
}

void buildGradeListOfClasses(
  BuildContext context,
  List<aClass> classes,
  String selectedGrade,
) {
  gradeListOfClasses = [];
  List<String> grades = classes.map((c) => c.grade).toSet().toList();
  int l = grades.length;
  print("Lenth of array in Build Grade List Is $grades");

  for (int i = 0; i < l; i++) {
    gradeListOfClasses.add(SizedBox(width: 2));
    gradeListOfClasses.add(
      GestureDetector(
        onTap: () async {
          {
            tapMonthly = AppColors.color6;
            tapAllClass = AppColors.color2;
            tapSpecial = AppColors.color2;
            buildGradeListOfClasses(context, classes, grades[i]);
            buildClassList(
              context,
              filterClassByGrade(classes, grades[i]),
              DateTime.now().year.toString(),
            );
            (context as Element).markNeedsBuild();
          }
        },
        child: Container(
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                    : AppColors.color2,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
