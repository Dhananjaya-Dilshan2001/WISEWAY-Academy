import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/day.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class addDay extends StatefulWidget {
  final aClass classObject;
  final aDay object;
  final aMonth monthObject;
  final int monthIndex;
  const addDay({
    super.key,
    required this.object,
    required this.classObject,
    required this.monthObject,
    required this.monthIndex,
  });
  @override
  State<addDay> createState() => _addDayState();
}

class _addDayState extends State<addDay> {
  Color tapOnline = AppColors.color2;
  Color tapPhysical = AppColors.color6;

  @override
  void initState() {
    widget.object.state = "Physical";
    widget.object.time = widget.classObject.note.split(' ').skip(1).join(' ');
    widget.object.otherInfo = widget.classObject.note.split(' ').first;
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
            Text("Add A Day", style: fontStyle.font2),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.7,
              color: AppColors.color4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              "Grade ${widget.classObject.grade} - ${widget.classObject.curriculm}\n${widget.classObject.subject}",
              style: fontStyle.font2,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Date", style: fontStyle.font4),
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
                          '${widget.object.date.toDate().day.toString().padLeft(2, '0')}'
                          '/${widget.object.date.toDate().day.toString().padLeft(2, '0')}/${widget.object.date.toDate().year.toString().padLeft(2, '0')}',
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
                        widget.object.date = Timestamp.fromDate(value!);
                        //tempPaper.date = value!;
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                        hintText:
                            widget
                                .object
                                .time, // Display string after the first space
                        hintStyle: fontStyle.font4.copyWith(
                          color: Colors.white, // Set hint text color to white
                        ),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        widget.object.time = value;
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                        hintText:
                            widget
                                .object
                                .otherInfo, // Display only the first part of the string
                        hintStyle: fontStyle.font4.copyWith(
                          color: Colors.white, // Set hint text color to white
                        ),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        widget.object.otherInfo = value;
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
                  child: Text("State", style: fontStyle.font4),
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
                            tapOnline = AppColors.color6;
                            tapPhysical = AppColors.color2;
                            widget.object.state = "Online";
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 60,
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
                            tapPhysical = AppColors.color6;
                            tapOnline = AppColors.color2;
                            widget.object.state = "Physical";
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 60,
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
                  "Back",
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
                  "Add",
                  AppColors.color6,
                  () async {
                    print('Tap on Add');
                    addDayController(
                      context,
                      widget.classObject,
                      widget.monthObject,
                      widget.monthIndex,
                      widget.object,
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
