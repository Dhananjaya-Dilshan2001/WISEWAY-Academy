import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_field/date_field.dart';

class registerStudent extends StatefulWidget {
  final bool isRegister;
  final String buttonText;
  final aStudent student;
  const registerStudent({
    super.key,
    required this.student,
    required this.isRegister,
    required this.buttonText,
  });
  @override
  State<registerStudent> createState() => _registerStudentState();
}

class _registerStudentState extends State<registerStudent> {
  Color tapMale = AppColors.color6;
  Color tapFemale = AppColors.color2;
  Color tapCambridge = AppColors.color6;
  Color tapEdexcel = AppColors.color2;
  Color tapOnline = AppColors.color2;
  Color tapPhysical = AppColors.color6;

  String title = "";
  String OLYear = "";

  @override
  void initState() {
    title =
        widget.isRegister ? "Register A new Student" : "Update Student Details";

    if (widget.student.gender == "Male") {
      tapMale = AppColors.color6;
      tapFemale = AppColors.color2;
    } else {
      tapMale = AppColors.color2;
      tapFemale = AppColors.color6;
    }
    if (widget.student.curriculm == "Cambridge") {
      tapCambridge = AppColors.color6;
      tapEdexcel = AppColors.color2;
    } else {
      tapCambridge = AppColors.color2;
      tapEdexcel = AppColors.color6;
    }
    if (widget.student.state == "Online") {
      tapOnline = AppColors.color6;
      tapPhysical = AppColors.color2;
    } else {
      tapOnline = AppColors.color2;
      tapPhysical = AppColors.color6;
    }
    if (widget.student.ID.isEmpty) {
      widget.student.gender = "Male";
      widget.student.curriculm = "Edexcel";
      widget.student.state = "Physical";
      OLYear = "";
    } else {
      OLYear = "20${widget.student.ID.substring(1, 3)}";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.color2,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(title, style: fontStyle.font2),
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
                  child: Text("Name", style: fontStyle.font4),
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
                            widget.student.name.isEmpty
                                ? "Enter Student Name"
                                : widget.student.name,
                        hintStyle: fontStyle.font4.copyWith(
                          color: AppColors.color4,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        widget.student.name = value;
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
                  child: Text("School", style: fontStyle.font4),
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
                            widget.student.school.isEmpty
                                ? "Enter School Name"
                                : widget.student.school,
                        hintStyle: fontStyle.font4.copyWith(
                          color: AppColors.color4,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        widget.student.school = value;
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
                  child: Text("O/L Year", style: fontStyle.font4),
                ),
                Container(
                  height: 40,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.4,
                  //color: AppColors.color6,
                  child: TextField(
                    style: fontStyle.font4,
                    decoration: InputDecoration(
                      hintText: OLYear.isEmpty ? "ex : 2028" : OLYear,
                      hintStyle: fontStyle.font4.copyWith(
                        color: AppColors.color4,
                      ),
                      counterStyle: TextStyle(
                        color:
                            AppColors
                                .color4, // Change the color of the max length counter
                      ),
                    ),
                    maxLength: 4, // Limits input to 2 characters
                    onChanged: (value) {
                      OLYear = value;
                    },
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
                    style: fontStyle.font4,
                    decoration: InputDecoration(
                      hintText:
                          widget.student.grade.isEmpty
                              ? "Enter Grade"
                              : widget.student.grade,
                      hintStyle: fontStyle.font4.copyWith(
                        color: AppColors.color4,
                      ),
                      counterStyle: TextStyle(
                        color:
                            AppColors
                                .color4, // Change the color of the max length counter
                      ),
                    ),
                    maxLength: 2, // Limits input to 2 characters
                    onChanged: (value) {
                      widget.student.grade = value;
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
                  width: MediaQuery.of(context).size.width * 0.25,
                  //color: AppColors.color5,
                  child: Text("Date Of Birth", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.35,
                  //color: AppColors.color6,
                  child: DateTimeField(
                    decoration: InputDecoration(
                      // Dark background for the input field
                      labelText:
                          '${widget.student.birthDay.toDate().toLocal().toString().split(' ')[0]}',
                      labelStyle: fontStyle.font4.copyWith(
                        color: Colors.white,
                      ), // White text color
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 20,
                      ),
                      // White icon
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    onChanged: (DateTime? value) {
                      setState(() {
                        widget.student.birthDay = Timestamp.fromDate(value!);
                      });
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
                          widget.student.whatsappNo.isEmpty
                              ? "Enter Whatsapp No"
                              : widget.student.whatsappNo,
                      hintStyle: fontStyle.font4.copyWith(
                        color: AppColors.color4,
                      ),
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    onChanged: (value) {
                      widget.student.whatsappNo = value;
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
                  width: MediaQuery.of(context).size.width * 0.3,
                  //color: AppColors.color5,
                  child: Text("Parent's No", style: fontStyle.font4),
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
                          widget.student.parentNo.isEmpty
                              ? "Enter Parent's No"
                              : widget.student.parentNo,
                      hintStyle: fontStyle.font4.copyWith(
                        color: AppColors.color4,
                      ),
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    onChanged: (value) {
                      widget.student.parentNo = value;
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
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Gender", style: fontStyle.font4),
                ),
                Container(child: Text(":   ", style: fontStyle.font4)),
                //SizedBox(width: 5,),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.5,
                  //color: AppColors.color6,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapMale = AppColors.color6;
                            tapFemale = AppColors.color2;
                            if (tapMale == AppColors.color6) {
                              widget.student.gender = "Male";
                            } else {
                              widget.student.gender = "Female";
                            }
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          child: Center(
                            child: Text("Male", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: tapMale,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapFemale = AppColors.color6;
                            tapMale = AppColors.color2;
                            if (tapFemale == AppColors.color6) {
                              widget.student.gender = "Female";
                            } else {
                              widget.student.gender = "Male";
                            }
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          child: Center(
                            child: Text("Female", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: tapFemale,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
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
                              widget.student.curriculm = "Cambridge";
                            } else {
                              widget.student.curriculm = "Edexcel";
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5,
                            right: 5,
                            top: 5,
                            bottom: 5,
                          ),
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
                            tapEdexcel = AppColors.color6;
                            tapCambridge = AppColors.color2;
                            if (tapEdexcel == AppColors.color6) {
                              widget.student.curriculm = "Edexcel";
                            } else {
                              widget.student.curriculm = "Cambridge";
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5,
                            right: 5,
                            top: 5,
                            bottom: 5,
                          ),
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
                  padding: EdgeInsets.all(5),
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
                              widget.student.state = "Online";
                            } else {
                              widget.student.state = "Physical";
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
                            tapPhysical = AppColors.color6;
                            tapOnline = AppColors.color2;
                            if (tapPhysical == AppColors.color6) {
                              widget.student.state = "Physical";
                            } else {
                              widget.student.state = "Online";
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            GestureDetector(
              onTap: () async {
                if (widget.student.ID.isEmpty) {
                  widget.student.ID = await genarateStudentID(
                    context,
                    widget.student,
                    OLYear,
                  );
                } else {
                  snackBarMsg(
                    context,
                    AppColors.color6,
                    "Student ID already generated",
                    Icons.error,
                  );
                }
                setState(() {
                  widget.student.ID = widget.student.ID;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                //width: MediaQuery.of(context).size.width * 0.3,
                //color: AppColors.color5,
                child: Column(
                  children: [
                    Text("Student ID", style: fontStyle.font2),
                    Container(
                      height: 30,
                      //width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                        child: Text(
                          "${widget.student.ID.isEmpty ? "Tap to generate" : widget.student.ID}",
                          style: fontStyle.font4,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.color6,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ],
                ),
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
                    Navigator.of(context).pop();

                    //tempStudent.setAllNull();
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
                      print("Student details: ${widget.student.toMap()}");
                      if (isStudentObjectNull(widget.student)) {
                        popUpMsg(
                          context,
                          AppColors.color2,
                          "Ready to Register..!",
                          "All details are correct..?",
                          () => registerStudentController(
                            context,
                            widget.student,
                          ),
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
                      updateStudentController(context, widget.student);
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
