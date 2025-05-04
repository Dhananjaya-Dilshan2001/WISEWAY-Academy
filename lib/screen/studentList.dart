import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});
  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  // ignore: annotate_overrides
  void initState() {
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
                              onTap: () {
                                //setState(() {
                                //   tapCambridge = tapCambridge == AppColors.color1
                                //       ? AppColors.color5
                                //       : AppColors.color1;
                                //   tapEdexcel = AppColors.color1;
                                //   sortTrigger(context);
                                // });
                                // if (tapCambridge == AppColors.color5) {
                                //   //gym.tempMember.gender = "Male";
                                // } else {
                                //   //gym.tempMember.gender = "Female";
                                //}
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
                                  color: AppColors.color6,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 3),
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   tapEdexcel =
                                //   tapEdexcel == AppColors.color1
                                //       ? AppColors.color5
                                //       : AppColors.color1;
                                //   tapCambridge= AppColors.color1;
                                //   sortTrigger(context);
                                // });
                                // if (tapEdexcel == AppColors.color5) {
                                //   //gym.tempMember.gender = "Female";
                                // } else {
                                //   //gym.tempMember.gender = "Male";
                                // }
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
                                  color: AppColors.color6,
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
                          onTap: () {
                            // setState(()  {
                            //   tapAll = tapAll == AppColors.color1
                            //       ? AppColors.color5
                            //       : AppColors.color1;
                            //   tapOnYakkala = AppColors.color1;
                            //   tapOnKiribathgoda = AppColors.color1;
                            //   sortTrigger(context);
                            // });
                            // if (tapAll == AppColors.color5) {
                            //   //gym.tempMember.gender = "Male";
                            // } else {
                            //   //gym.tempMember.gender = "Female";
                            // }
                          },
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(
                              child: Text("All", style: fontStyle.font5),
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.color6,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // setState(()  {
                                  //   tapAll = tapAll == AppColors.color1
                                  //       ? AppColors.color5
                                  //       : AppColors.color1;
                                  //   tapOnYakkala = AppColors.color1;
                                  //   tapOnKiribathgoda = AppColors.color1;
                                  //   sortTrigger(context);
                                  // });
                                  // if (tapAll == AppColors.color5) {
                                  //   //gym.tempMember.gender = "Male";
                                  // } else {
                                  //   //gym.tempMember.gender = "Female";
                                  // }
                                },
                                child: Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Center(
                                    child: Text("08", style: fontStyle.font5),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.color6,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   tapOnKiribathgoda = tapOnKiribathgoda == AppColors.color1
                                  //       ? AppColors.color5
                                  //       : AppColors.color1;
                                  //   tapOnYakkala = AppColors.color1;
                                  //   tapAll = AppColors.color1;
                                  //   sortTrigger(context);
                                  // });
                                  // if (tapOnKiribathgoda == AppColors.color5) {
                                  //   //gym.tempMember.gender = "Male";
                                  // } else {
                                  //   //gym.tempMember.gender = "Female";
                                  // }
                                },
                                child: Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Center(
                                    child: Text("09", style: fontStyle.font5),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.color6,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                onTap: () {
                                  //setState(() {
                                  //   tapOnYakkala =
                                  //   tapOnYakkala == AppColors.color1
                                  //       ? AppColors.color5
                                  //       : AppColors.color1;
                                  //   tapOnKiribathgoda= AppColors.color1;
                                  //   tapAll = AppColors.color1;
                                  //   sortTrigger(context);
                                  // });
                                  // if (tapOnYakkala == AppColors.color5) {
                                  //   //gym.tempMember.gender = "Female";
                                  // } else {
                                  //   //gym.tempMember.gender = "Male";
                                  // }
                                },
                                child: Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Center(
                                    child: Text("10", style: fontStyle.font5),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.color6,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
