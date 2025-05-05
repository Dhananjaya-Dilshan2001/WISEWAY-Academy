import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/functions/payment.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/UIBuilding/viewAllStudent.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:apk/screen/popUpWindows/addDay.dart';
import 'package:apk/screen/popUpWindows/allStudent.dart';
import 'package:flutter/material.dart';

class Classdashboard extends StatefulWidget {
  final aClass object;
  final aMonth month;
  const Classdashboard({super.key, required this.object, required this.month});
  @override
  State<Classdashboard> createState() => _ClassdashboardState();
}

class _ClassdashboardState extends State<Classdashboard> {
  // ignore: annotate_overrides
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.color1,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color4),
        backgroundColor: AppColors.color1,
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
          child: Text("Class Dashboard        ", style: fontStyle.font6),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            padding: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: AppColors.color2,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      //height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: IconButton(
                        icon: Icon(
                          Icons.class_,
                          color: AppColors.color4,
                          size: MediaQuery.of(context).size.width * 0.15,
                        ),
                        onPressed: () {
                          print('Download document');
                          // Add download functionality here
                        },
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      alignment: Alignment.centerLeft,
                      //height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.55,
                      //color: AppColors.color5,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 30,
                            child: Text(
                              "${widget.object.subject}",
                              style: fontStyle.font3,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 30,
                            child: Text(
                              "${widget.object.curriculm} - G${widget.object.grade}",
                              style: fontStyle.font3,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 30,
                            child: Text(
                              "${widget.object.teacher}",
                              style: fontStyle.font3,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 30,
                            child: Text(
                              "${widget.object.ID}",
                              style: fontStyle.font3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "   ${widget.object.note}",
                    style: fontStyle.font3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.9,
            //color: AppColors.color2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    await getAllStudent(context);
                    await buildStudentListOnViewStudent(
                      context,
                      widget.object,
                      fetchStudentByIDs(widget.object.students, allStudent),
                      false,
                      false,
                      0,
                      nullMonthObject(),
                      0,
                    );
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return viewAllStudent(
                          title: "Registered Students",
                          list: viewStudent,
                        ); // Call your StatefulWidget with parameters
                      },
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: BoxDecoration(
                      color: AppColors.color2,
                      borderRadius: BorderRadius.circular(
                        8,
                      ), // Add radius instead of circle
                    ),
                    child: Icon(
                      Icons.group,
                      color: Colors.white,
                    ), // Changed icon to person
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                GestureDetector(
                  onTap: () async {
                    await getAllStudent(context);
                    await buildStudentListOnViewStudent(
                      context,
                      widget.object,
                      allStudent,
                      true,
                      false,
                      0,
                      nullMonthObject(),
                      0,
                    );
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return viewAllStudent(
                          title: "Add Student to Class",
                          list: viewStudent,
                        ); // Call your StatefulWidget with parameters
                      },
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Icon(Icons.add, color: Colors.white),
                    decoration: BoxDecoration(
                      color: AppColors.color6,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      GestureDetector(
                        onTap: () async {
                          //viewAllStudentController(context);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.1,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Icon(Icons.arrow_back, color: Colors.white),
                          decoration: BoxDecoration(
                            color: AppColors.color6,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text("2025", style: fontStyle.font2),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      GestureDetector(
                        onTap: () async {
                          //viewAllStudentController(context);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.1,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                          decoration: BoxDecoration(
                            color: AppColors.color6,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      GestureDetector(
                        onTap: () async {
                          //viewAllStudentController(context);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.1,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Icon(Icons.arrow_back, color: Colors.white),
                          decoration: BoxDecoration(
                            color: AppColors.color6,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text("${widget.month.name}", style: fontStyle.font2),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      GestureDetector(
                        onTap: () async {
                          //viewAllStudentController(context);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.1,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                          decoration: BoxDecoration(
                            color: AppColors.color6,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ],
              ),
            ),
          ),
          //SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              //color: AppColors.color2,
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView(children: dayList),
          ),
          GestureDetector(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return addDay(
                    monthIndex: 0,
                    monthObject: widget.month,

                    classObject: widget.object,
                    object: nullDayObject(),
                  ); // Call your StatefulWidget
                },
              );
              //viewAllStudentController(context);
            },
            child: Container(
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,
              child: Icon(Icons.add, color: Colors.white),
              decoration: BoxDecoration(
                color: AppColors.color6,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
