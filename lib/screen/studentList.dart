import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/functions/sorting.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/UIBuilding/studentList.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:flutter/material.dart';

Color tapCambridge = AppColors.color1;
Color tapEdexcel = AppColors.color1;
Color tapAllGrade = AppColors.color6;
String tapGrade = "0";

class StudentList extends StatefulWidget {
  const StudentList({super.key});
  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  // ignore: annotate_overrides
  void initState() {
    tapCambridge = AppColors.color1;
    tapEdexcel = AppColors.color1;
    tapAllGrade = AppColors.color6;
    buildGradeList(context, allStudent, "0");
    tapGrade = "0";
    super.initState();
    setState(() {
      print("Trigger student List UI..!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.color2,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color4),
        backgroundColor: AppColors.color2,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => adminPanel()),
            );
          },
        ),
        title: Center(
          child: Text("Student List         ", style: fontStyle.font6),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    width: MediaQuery.of(context).size.width * 0.425,
                    //color: AppColors.color2,
                    child: Column(
                      children: [
                        Text("Curriculums", style: fontStyle.font2),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  tapCambridge == AppColors.color6
                                      ? tapCambridge = AppColors.color1
                                      : tapCambridge = AppColors.color6;
                                  tapEdexcel = AppColors.color1;
                                  print(
                                    "Tap On Cambridge grade is : $tapGrade",
                                  );
                                  buildStudentList(
                                    context,
                                    sortStudentList(
                                      context,
                                      allStudent,
                                      tapGrade,
                                    ),
                                  );
                                });
                              },
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    "Cambridge",
                                    style: fontStyle.font5,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: tapCambridge,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 3),
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  tapEdexcel == AppColors.color6
                                      ? tapEdexcel = AppColors.color1
                                      : tapEdexcel = AppColors.color6;
                                  tapCambridge = AppColors.color1;
                                  print("Tap On Edexcel grade is : $tapGrade");
                                  buildStudentList(
                                    context,
                                    sortStudentList(
                                      context,
                                      allStudent,
                                      tapGrade,
                                    ),
                                  );
                                });
                              },
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    "Edexcel",
                                    style: fontStyle.font5,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: tapEdexcel,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    width: MediaQuery.of(context).size.width * 0.425,
                    //color: AppColors.color2,
                    child: Column(
                      children: [
                        Text("Grade", style: fontStyle.font2),
                        GestureDetector(
                          onTap: () async {
                            await buildStudentList(
                              context,
                              sortStudentList(context, allStudent, "0"),
                            );
                            setState(() {
                              tapAllGrade = AppColors.color6;
                              buildGradeList(context, allStudent, "0");
                            });
                          },
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(
                              child: Text("All", style: fontStyle.font5),
                            ),
                            decoration: BoxDecoration(
                              color: tapAllGrade,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: gradeList),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: ListView(children: studentList),
            ),
          ),
        ],
      ),
    );
  }
}
