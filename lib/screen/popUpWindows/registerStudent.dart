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
  final aStudent student;
  const registerStudent({super.key, required this.student});
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

  @override
  void initState() {
    widget.student.gender = "Male";
    widget.student.curriculm = "Cambridge";
    widget.student.state = "Physical";
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
            Text("Register A new Student", style: fontStyle.font2),
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
                    decoration: InputDecoration(),
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
                    decoration: InputDecoration(),
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
                            tapMale =
                                tapMale == AppColors.color2
                                    ? AppColors.color6
                                    : AppColors.color2;
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
                            tapFemale =
                                tapFemale == AppColors.color2
                                    ? AppColors.color6
                                    : AppColors.color2;
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
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.3,
                  //color: AppColors.color5,
                  child: Column(
                    children: [
                      Text("Curriculums", style: fontStyle.font2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapCambridge =
                                tapCambridge == AppColors.color2
                                    ? AppColors.color6
                                    : AppColors.color2;
                            tapEdexcel = AppColors.color2;
                            if (tapCambridge == AppColors.color6) {
                              widget.student.curriculm = "Cambridge";
                            } else {
                              widget.student.curriculm = "Edexcel";
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
                            tapEdexcel =
                                tapEdexcel == AppColors.color2
                                    ? AppColors.color6
                                    : AppColors.color2;
                            tapCambridge = AppColors.color2;
                            if (tapEdexcel == AppColors.color6) {
                              widget.student.curriculm = "Edexcel";
                            } else {
                              widget.student.curriculm = "Cambridge";
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
                            tapOnline =
                                tapOnline == AppColors.color2
                                    ? AppColors.color6
                                    : AppColors.color2;
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
                            tapPhysical =
                                tapPhysical == AppColors.color2
                                    ? AppColors.color6
                                    : AppColors.color2;
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            GestureDetector(
              onTap: () async {
                setState(() {
                  widget.student.ID = genarateStudentID(
                    context,
                    widget.student,
                  );
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.3,
                //color: AppColors.color5,
                child: Column(
                  children: [
                    Text("Student ID", style: fontStyle.font2),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.4,
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
                    if (isStudentObjectNull(widget.student)) {
                      popUpMsg(
                        context,
                        AppColors.color2,
                        "Ready to Register..!",
                        "All details are correct..?",
                        () =>
                            registerStudentController(context, widget.student),
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
