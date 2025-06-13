import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/day.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/UIBuilding/viewAllStudent.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:apk/screen/popUpWindows/allStudent.dart';
import 'package:apk/screen/popUpWindows/qrScanner.dart';
import 'package:flutter/material.dart';

GestureDetector listCardOfDay(
  BuildContext context,
  int indexOfMonth,
  aMonth month,
  aClass classObject,
  int no,
  aDay object,
  String year,
) {
  return GestureDetector(
    onLongPress: () {
      print("Tap on long press");
      popUpMsg(
        context,
        AppColors.color6,
        "Are you sure you want to delete this day?",
        "All details of this day will be deleted.",
        () {
          deleteDayFromMonth(context, month, classObject, no - 1, year);
        },
      );
    },
    child: Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.color4, // Set the background color of the container
        borderRadius: BorderRadius.circular(10.0), // Set the corner radius
      ),
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color:
                  AppColors.color2, // Set the background color of the container
              borderRadius: BorderRadius.circular(8.0), // Set the corner radius
            ),
            child: Center(child: Text("0$no", style: fontStyle.font3)),
          ),

          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * 0.03,
                  //color: AppColors.color2,
                  child: Text(
                    "${object.otherInfo} - ${object.date.toDate().day.toString().padLeft(2, '0')}/${object.date.toDate().month.toString().padLeft(2, '0')}",
                    style: fontStyle.font4.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.height *
                          0.02, // Set font size
                      color: AppColors.color2, // Set font color
                      fontWeight: FontWeight.bold, // Set bold font
                    ),
                  ),
                ),
                // Line spacing decreased further
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * 0.02,
                  //color: AppColors.color2,
                  child: Text(
                    "${object.time}",
                    style: fontStyle.font4.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.height *
                          0.015, // Set font size
                      color: AppColors.color2, // Set font color
                      fontWeight: FontWeight.bold, // Set bold font
                    ),
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(width: MediaQuery.of(context).size.width * 0),
          GestureDetector(
            onTap: () async {
              showPending(context);
              await buildStudentListOnViewStudent(
                context,
                classObject,
                fetchStudentByIDs(
                  fetchStudentIDFromAttendanceList(
                    month.attendance[no - 1].students,
                  ),
                  allStudent,
                ),
                false,
                false,
                0,
                month,
                no - 1,
                false,
                true,
                year,
              );
              Navigator.pop(context);
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return viewAllStudent(
                    title: "Attended Student",
                    list: viewStudent,
                  ); // Call your StatefulWidget with parameters
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width * 0.14,
              decoration: BoxDecoration(
                color: AppColors.color2,
                borderRadius: BorderRadius.circular(
                  8,
                ), // Add radius instead of circle
              ),
              child: Row(
                children: [
                  Icon(Icons.group, color: Colors.white),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text(
                    "${month.attendance[no - 1].students.length}",
                    style: fontStyle.font3.copyWith(fontSize: 12),
                  ),
                ],
              ), // Changed icon to person
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          SizedBox(
            child: Container(color: AppColors.color1),
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          GestureDetector(
            onTap: () async {
              showPending(context);
              await getAllStudent(context);
              await buildStudentListOnViewStudent(
                context,
                classObject,
                fetchStudentByIDs(classObject.students, allStudent),
                true,
                true,
                indexOfMonth,
                month,
                no - 1,
                false,
                false,
                year,
              );
              Navigator.pop(context);
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return viewAllStudent(
                    title: "Mark Attendance",
                    list: viewStudent,
                  ); // Call your StatefulWidget with parameters
                },
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.09,
              decoration: BoxDecoration(color: AppColors.color6),
              child: Icon(
                Icons.group_add,
                color: Colors.white,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
          SizedBox(
            child: Container(color: AppColors.color1),
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          GestureDetector(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return QRScannerPage(
                    purpose: 2,
                    classObject: classObject,
                    indexOfDay: no - 1,
                    month: month,
                    monthIndex: indexOfMonth,
                    year: year,
                  ); // Call your StatefulWidget
                },
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.09,
              decoration: BoxDecoration(
                color: AppColors.color6,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//add items for table
void addNewDayToList(
  BuildContext context,
  int indexOfMonth,
  aMonth month,
  aClass classObject,
  int no,
  aDay object,
  String year,
) {
  dayList.add(SizedBox(height: 5));
  dayList.add(
    listCardOfDay(context, indexOfMonth, month, classObject, no, object, year),
  );
}

//build student widget list
Future<void> buildDayList(
  BuildContext context,
  aMonth month,
  aClass classObject,
  List<aDay> students,
  String year,
) async {
  print("Come to build day list function --> Month : ${month.name}");
  dayList = []; // Clear the list before adding new items
  int l = students.length;

  for (int i = 0; i < l; i++) {
    addNewDayToList(
      context,
      getMonthIntFromName(month.name) - 1,
      month,
      classObject,
      i + 1,
      students[i],
      year,
    );
  }
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => StudentList()),
  // );
}
