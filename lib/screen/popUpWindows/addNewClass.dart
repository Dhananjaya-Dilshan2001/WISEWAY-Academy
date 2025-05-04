import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class addNewClass extends StatefulWidget {
  const addNewClass({super.key});
  @override
  State<addNewClass> createState() => _addNewClassState();
}

class _addNewClassState extends State<addNewClass> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.color2,
      content: SingleChildScrollView(
        //padding: EdgeInsets.all(10.0),
        //height: MediaQuery.of(context).size.height * 0.6,
        //width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Text("Add New Class", style: fontStyle.font2),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.7,
              color: AppColors.color4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Text("Subject", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                Expanded(
                  child: Container(
                    height: 30,
                    child: TextField(
                      style: fontStyle.font4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        //tempStudent.name = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Teacher", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Expanded(
                  child: Container(
                    height: 30,
                    child: TextField(
                      style: fontStyle.font4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        //tempStudent.name = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Grade", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.25,
                  //color: AppColors.color6,
                  child: TextField(
                    //keyboardType: TextInputType.number,
                    style: fontStyle.font4,
                    decoration: InputDecoration(),
                    //controller: gradecontroller,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Note", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Expanded(
                  child: Container(
                    height: 30,
                    child: TextField(
                      style: fontStyle.font4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        //tempStudent.name = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.3,
                  //color: AppColors.color5,
                  child: Text("Whatsapp No", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.3,
                  //color: AppColors.color6,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: fontStyle.font4,
                    decoration: InputDecoration(),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    onChanged: (value) {
                      //tempStudent.whatsappNo = value;
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.3,
                  //color: AppColors.color5,
                  child: Column(
                    children: [
                      Text("Curriculums", style: fontStyle.font2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // tapCambridge =
                            //     tapCambridge == AppColors.color1
                            //         ? AppColors.color5
                            //         : AppColors.color1;
                            // tapEdexcel = AppColors.color1;
                            // if (tapCambridge == AppColors.color5) {
                            //   tempStudent.curriculm = "Cambridge";
                            //   genarateStudentID(context);
                            // } else {
                            //   tempStudent.curriculm = "Edexcel";
                            //   genarateStudentID(context);
                            // }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Center(
                            child: Text("Cambridge", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.color6,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // tapEdexcel =
                            //     tapEdexcel == AppColors.color1
                            //         ? AppColors.color5
                            //         : AppColors.color1;
                            // tapCambridge = AppColors.color1;
                            // if (tapEdexcel == AppColors.color5) {
                            //   tempStudent.curriculm = "Edexcel";
                            //   genarateStudentID(context);
                            // } else {
                            //   tempStudent.curriculm = "Cambridge";
                            //   genarateStudentID(context);
                            // }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Center(
                            child: Text("Edexcel", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.color2,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                //SizedBox(width: 5,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.3,
                  //color: AppColors.color6,
                  child: Column(
                    children: [
                      Text("State", style: fontStyle.font2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // tapNewStudent =
                            //     tapNewStudent == AppColors.color1
                            //         ? AppColors.color5
                            //         : AppColors.color1;
                            // tapOldStudent = AppColors.color1;
                            // if (tapNewStudent == AppColors.color5) {
                            //   tempStudent.state = "New";
                            // } else {
                            //   tempStudent.state = "Old";
                            // }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Center(
                            child: Text("Online", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.color6,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // tapOldStudent =
                            //     tapOldStudent == AppColors.color1
                            //         ? AppColors.color5
                            //         : AppColors.color1;
                            // tapNewStudent = AppColors.color1;
                            // if (tapOldStudent == AppColors.color5) {
                            //   tempStudent.state = "Old";
                            // } else {
                            //   tempStudent.state = "New";
                            // }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Center(
                            child: Text("Physical", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.color2,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.3,
              //color: AppColors.color5,
              child: Column(
                children: [
                  Text("Class ID", style: fontStyle.font2),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Center(
                      child: Text("{tempStudent.ID}", style: fontStyle.font4),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.color6,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              children: [
                commonButton.button4(
                  MediaQuery.of(context).size.width * 0.3,
                  "Cancel",
                  AppColors.color3,
                  () async {
                    print('Tap on Cancel');
                    //tempStudent.setAllNull();
                    Navigator.of(context).pop();
                  },
                  AppColors.color4,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                commonButton.button4(
                  MediaQuery.of(context).size.width * 0.3,
                  "Register",
                  AppColors.color6,
                  () async {
                    print('Tap on Register');
                    //cheackTempStudentNull(context);
                  },
                  AppColors.color4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
