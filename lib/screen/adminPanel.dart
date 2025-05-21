import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/drawer.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/UIBuilding/studentList.dart';
import 'package:apk/screen/paymentReport.dart';
import 'package:apk/screen/popUpWindows/addNewClass.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:apk/screen/popUpWindows/registerStudent.dart';
import 'package:apk/screen/popUpWindows/searchStudent.dart';
import 'package:apk/screen/studentList.dart';
import 'package:flutter/material.dart';

class adminPanel extends StatefulWidget {
  const adminPanel({super.key});
  @override
  State<adminPanel> createState() => _adminPanelState();
}

class _adminPanelState extends State<adminPanel>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.color1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          iconTheme: IconThemeData(color: AppColors.color3),
          backgroundColor: AppColors.color2,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.color4, size: 30),
                ),
          ),
          title: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text("Admin Panel      ", style: fontStyle.font6),
              ],
            ),
          ),
        ),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              //color: AppColors.color6,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  commonButton.button2(
                    MediaQuery.of(context).size.height * 0.06,
                    MediaQuery.of(context).size.width * 0.4,
                    "Register",
                    AppColors.color6,
                    () async {
                      print('Tap Add Student');
                      // getStudentCount();
                      // genarateStudentID(context);
                      // //registerNewStudent(context,"String url","String comment");
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return registerStudent(
                            student: nullStudentObject(),
                          ); // Call your StatefulWidget
                        },
                      );
                      // Perform any action here
                    },
                    AppColors.color4,
                    Icons.person_add,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  commonButton.button2(
                    MediaQuery.of(context).size.height * 0.06,
                    MediaQuery.of(context).size.width * 0.4,
                    "New Class",
                    AppColors.color6,
                    () async {
                      print('Start New Paper');
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return addNewClass(
                            object: nullClassObject(),
                          ); // Call your StatefulWidget
                        },
                      );
                      // Perform any action here
                    },
                    AppColors.color4,
                    Icons.add_business,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: AppColors.color4,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                  commonButton.button3(
                    MediaQuery.of(context).size.height * 0.12,
                    MediaQuery.of(context).size.width * 0.25,
                    "Students",
                    AppColors.color3,
                    () async {
                      // studentList= [];
                      print('Tap View All Students');
                      showPending(context);
                      await getAllStudent(context);
                      await buildStudentList(context, allStudent);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StudentList()),
                      );
                      // Perform any action here
                    },
                    AppColors.color4,
                    Icons.group,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.0325),
                  commonButton.button3(
                    MediaQuery.of(context).size.height * 0.12,
                    MediaQuery.of(context).size.width * 0.25,
                    "Collect\nPayment",
                    AppColors.color3,
                    () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return searchStudent(); // Call your StatefulWidget
                        },
                      );
                      print('tap on Collect Payment');
                      //
                      // Perform any action here
                    },
                    AppColors.color4,
                    Icons.payments,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.0325),
                  commonButton.button3(
                    MediaQuery.of(context).size.height * 0.12,
                    MediaQuery.of(context).size.width * 0.25,
                    "Budget\nReport",
                    AppColors.color3,
                    () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => paymentReport(),
                        ),
                      );
                      print('tap on Budget report');
                      //
                      // Perform any action here
                    },
                    AppColors.color4,
                    Icons.bar_chart, // Changed icon to a report views icon
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text("Classes", style: fontStyle.font3),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.9,
              color: AppColors.color4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color2,
              child: ListView(children: classList),
            ),
          ],
        ),
      ),
    );
  }
}
