import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

class attendStudent extends StatefulWidget {
  final int indexOfDay;
  final aClass classObject;
  final aDay day;
  final aStudent student;
  final int monthIndex;
  final aMonth month;
  final String year;
  const attendStudent({
    Key? key,
    required this.indexOfDay,
    required this.classObject,
    required this.day,
    required this.student,
    required this.monthIndex,
    required this.month,
    required this.year,
  }) : super(key: key);
  @override
  State<attendStudent> createState() => _attendStudentState();
}

class _attendStudentState extends State<attendStudent> {
  Color tapOnline = AppColors.color2;
  Color tapPhysical = AppColors.color6;
  String state = "Physical";

  initState() {
    tapOnline = AppColors.color2;
    tapPhysical = AppColors.color6;
    state = "Physical";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.color2,
      content: Container(
        //padding: EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            Center(
              child: Text(
                "${getMonthName(widget.monthIndex + 1)} - Attend Student",
                style: fontStyle.font3,
              ),
            ),
            Center(
              child: Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.8,
                color: AppColors.color4,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.22,
                  width: MediaQuery.of(context).size.width * 0.22,
                  decoration: BoxDecoration(
                    color: AppColors.color1,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'Image/studentP.png',
                      ), // Background image
                      fit:
                          BoxFit
                              .contain, // How the image should fit in the container
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.4,
                  //color: AppColors.color6,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.0, // Right padding
                      top: 0.0, // Top padding
                      bottom: 0.0, // Bottom padding
                    ),
                    child: Text(
                      "${widget.student.name} \n${widget.student.ID}"
                      "\nGrade ${widget.student.grade} - ${widget.student.curriculm} ",
                      style: fontStyle.font3,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            Row(
              children: [
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.2,
                  //color: AppColors.color5,
                  child: Text("Attendance", style: fontStyle.font4),
                ),
                Container(child: Text(":   ", style: fontStyle.font4)),
                //SizedBox(width: 5,),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.4,
                  //color: AppColors.color6,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapOnline = AppColors.color6;
                            tapPhysical = AppColors.color2;
                            state = "Online";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Center(
                            child: Text("Online", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: tapOnline,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapOnline = AppColors.color2;
                            tapPhysical = AppColors.color6;
                            state = "Physical";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          //height: 40,
                          //width: 65,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              children: [
                commonButton.button4(
                  MediaQuery.of(context).size.width * 0.3,
                  "Cancel",
                  AppColors.color1,
                  () async {
                    print('Tap on Cancel');
                    //tempStudentPaper.resetValue();
                    Navigator.of(context).pop();
                  },
                  AppColors.color4,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                commonButton.button4(
                  MediaQuery.of(context).size.width * 0.3,
                  "Attend",
                  AppColors.color6,
                  () async {
                    showPending(context);
                    markAttendace(
                      context,
                      widget.classObject,
                      widget.month,
                      widget.monthIndex,
                      widget.indexOfDay,
                      widget.student.ID + " $state",
                      widget.day,
                      widget.year,
                    );
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
