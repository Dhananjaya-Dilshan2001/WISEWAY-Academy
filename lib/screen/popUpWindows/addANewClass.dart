import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class addANewClass extends StatefulWidget {
  final aClass object;
  final String title;
  final String buttonText;
  final bool isRegister;
  const addANewClass({
    super.key,
    required this.object,
    required this.title,
    required this.buttonText,
    required this.isRegister,
  });
  @override
  State<addANewClass> createState() => _addANewClassState();
}

class _addANewClassState extends State<addANewClass> {
  Color tapCambridge = AppColors.color6;
  Color tapEdexcel = AppColors.color2;
  Color tapOnline = AppColors.color2;
  Color tapPhysical = AppColors.color6;
  Color tapMonthly = AppColors.color6;
  Color tapSpecial = AppColors.color2;
  String dayName = "";
  String classTime = "";

  @override
  void initState() {
    super.initState();
    if (widget.object.note.isEmpty) {
      dayName = "Enter day name ex: Monday";
      classTime = "Enter class time ex: 10:00AM - 11:00AM";
    } else {
      dayName = widget.object.note.split("   ")[0];
      classTime = widget.object.note.split("   ")[1];
    }

    if (widget.object.otherInfo.isEmpty) {
      widget.object.otherInfo = "Monthly";
      tapMonthly = AppColors.color6;
      tapSpecial = AppColors.color2;
    }
    if (widget.object.otherInfo == "Special") {
      tapMonthly = AppColors.color2;
      tapSpecial = AppColors.color6;
    } else {
      tapMonthly = AppColors.color6;
      tapSpecial = AppColors.color2;
    }
    if (widget.object.curriculm.isEmpty) {
      widget.object.curriculm = "Cambridge";
    }
    if (widget.object.state.isEmpty) {
      widget.object.state = "Physical";
    }
    if (widget.object.curriculm == "Cambridge") {
      tapCambridge = AppColors.color6;
      tapEdexcel = AppColors.color2;
    } else {
      tapCambridge = AppColors.color2;
      tapEdexcel = AppColors.color6;
    }
    if (widget.object.state == "Physical") {
      tapPhysical = AppColors.color6;
      tapOnline = AppColors.color2;
    } else {
      tapPhysical = AppColors.color2;
      tapOnline = AppColors.color6;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print("Calling dispose in addANewClass");
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.color2,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text("${widget.title}", style: fontStyle.font2),
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
                        hintText:
                            "${widget.object.subject.isEmpty ? "Enter Subject" : widget.object.subject}",
                        hintStyle: TextStyle(color: AppColors.color4),
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
                        hintText:
                            "${widget.object.teacher.isEmpty ? "Enter Teacher" : widget.object.teacher}",
                        hintStyle: TextStyle(color: AppColors.color4),
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
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Grade", style: fontStyle.font4),
                ),
                Container(
                  height: 40,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.25,
                  //color: AppColors.color6,
                  child: TextField(
                    //keyboardType: TextInputType.number,
                    style: fontStyle.font4,
                    decoration: InputDecoration(
                      hintText:
                          "${widget.object.grade.isEmpty ? "Enter Grade" : widget.object.grade}",
                      hintStyle: TextStyle(color: AppColors.color4),
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
                  child: Text("Day", style: fontStyle.font4),
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
                        hintText:
                            "${widget.object.note.isEmpty ? "Enter Day ex : Monday" : dayName}",
                        hintStyle: TextStyle(color: AppColors.color4),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        dayName = value;
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
                  child: Text("Time", style: fontStyle.font4),
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
                        hintText:
                            "${widget.object.note.isEmpty ? "Enter Time ex: 10:00AM - 11:00AM" : classTime}",
                        hintStyle: TextStyle(color: AppColors.color4),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        classTime = value;
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
                    decoration: InputDecoration(
                      hintText:
                          "${widget.object.whatsappNo.isEmpty ? "Enter No" : widget.object.whatsappNo}",
                      hintStyle: TextStyle(color: AppColors.color4),
                    ),
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
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.2,
                  //color: AppColors.color5,
                  child: Text("Class Type", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tapMonthly = AppColors.color6;
                      tapSpecial = AppColors.color2;
                      widget.object.otherInfo = "Monthly";
                    });
                  },
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text("Monthly", style: fontStyle.font4),
                    ),
                    decoration: BoxDecoration(
                      color: tapMonthly,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tapMonthly = AppColors.color2;
                      tapSpecial = AppColors.color6;
                      widget.object.otherInfo = "Special";
                    });
                  },
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text("Special", style: fontStyle.font4),
                    ),
                    decoration: BoxDecoration(
                      color: tapSpecial,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
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
                        if (widget.object.ID.isEmpty) {
                          widget.object.ID = generateClassID(
                            context,
                            widget.object,
                          );
                        } else {
                          snackBarMsg(
                            context,
                            AppColors.color6,
                            "Class ID already generated",
                            Icons.warning,
                          );
                        }
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
                    Navigator.of(context).pop();
                  },
                  AppColors.color4,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                commonButton.button4(
                  MediaQuery.of(context).size.width * 0.3,
                  "${widget.buttonText}",
                  AppColors.color6,
                  () async {
                    if (widget.isRegister) {
                      print('Tap on Register');
                      widget.object.note = "$dayName   $classTime";
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
                    } else {
                      updateClassController(context, widget.object);
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
