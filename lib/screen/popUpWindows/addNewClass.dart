import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class addNewClass extends StatefulWidget {
  final aClass object;
  const addNewClass({super.key, required this.object});
  @override
  State<addNewClass> createState() => _addNewClassState();
}

class _addNewClassState extends State<addNewClass> {
  Color tapCambridge = AppColors.color6;
  Color tapEdexcel = AppColors.color2;
  Color tapOnline = AppColors.color2;
  Color tapPhysical = AppColors.color6;

  initeState() {
    super.initState();
    widget.object.curriculm = "Cambridge";
    widget.object.state = "Physical";
    super.initState();
  }

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
                        widget.object.subject = value;
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
                        widget.object.teacher = value;
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
                    decoration: InputDecoration(
                      counterStyle: TextStyle(
                        color:
                            AppColors
                                .color4, // Change the color of the max length counter
                      ),
                    ),
                    maxLength: 2, // Limits input to 2 characters
                    onChanged: (value) {
                      widget.object.grade = value;
                    },
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
                        widget.object.note = value;
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
                      widget.object.whatsappNo = value;
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
                            tapCambridge = AppColors.color6;
                            tapEdexcel = AppColors.color2;
                            if (tapCambridge == AppColors.color6) {
                              widget.object.curriculm = "Cambridge";
                            } else {
                              widget.object.curriculm = "Edexcel";
                            }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Center(
                            child: Text("Cambridge", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: tapCambridge,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapCambridge = AppColors.color2;
                            tapEdexcel = AppColors.color6;
                            if (tapEdexcel == AppColors.color6) {
                              widget.object.curriculm = "Edexcel";
                            } else {
                              widget.object.curriculm = "Cambridge";
                            }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Center(
                            child: Text("Edexcel", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: tapEdexcel,
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
                            tapOnline = AppColors.color6;
                            tapPhysical = AppColors.color2;
                            if (tapOnline == AppColors.color6) {
                              widget.object.state = "Online";
                            } else {
                              widget.object.state = "Physical";
                            }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Center(
                            child: Text("Online", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: tapOnline,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapOnline = AppColors.color2;
                            tapPhysical = AppColors.color6;
                            if (tapPhysical == AppColors.color6) {
                              widget.object.state = "Physical";
                            } else {
                              widget.object.state = "Online";
                            }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Center(
                            child: Text("Physical", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: tapPhysical,
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
              width: MediaQuery.of(context).size.width * 0.5,
              //color: AppColors.color5,
              child: Column(
                children: [
                  Text("Class ID", style: fontStyle.font2),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.object.ID = generateClassID(
                          context,
                          widget.object,
                        );
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      //height: 30,
                      //width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "${widget.object.ID.isEmpty ? "Tap to generate" : widget.object.ID}",
                            style: fontStyle.font4,
                          ),
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
                    if (isClassObjectNull(widget.object)) {
                      popUpMsg(
                        context,
                        AppColors.color2,
                        "Ready to Register..!",
                        "All details are correct..?",
                        () => addClassController(context, widget.object),
                      );
                    } else {
                      popUpMsg(
                        context,
                        AppColors.color6,
                        "Error",
                        "Fill the all details and try again..!",
                        () => Navigator.of(context).pop(),
                      );
                    }
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
