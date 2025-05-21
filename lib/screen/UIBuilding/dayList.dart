import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/UIBuilding/viewAllStudent.dart';
import 'package:apk/screen/popUpWindows/allStudent.dart';
import 'package:flutter/material.dart';

Container listCardOfDay(
  BuildContext context,
  int indexOfMonth,
  aMonth month,
  aClass classObject,
  int no,
  aDay object,
) {
  //print("Student Name Is ${name[0]} ${name[1]}");
  return Container(
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
              nullMonthObject(),
              0,
            );
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
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        SizedBox(
          child: Container(color: AppColors.color1),
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        GestureDetector(
          onTap: () async {
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
            );
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
            // await showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return attendStudent(); // Call your StatefulWidget
            //   },
            // );
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
) {
  dayList.add(SizedBox(height: 5));
  dayList.add(
    listCardOfDay(context, indexOfMonth, month, classObject, no, object),
  );
}

//build student widget list
Future<void> buildDayList(
  BuildContext context,
  int indexOfMonth,
  aMonth month,
  aClass classObject,
  List<aDay> students,
) async {
  print("Come to build day list function");
  dayList = []; // Clear the list before adding new items
  int l = students.length;
  print("Lenth of array in Build Student List Is $l");

  for (int i = 0; i < l; i++) {
    print("Student Name Is ${students[i].time}");
    addNewDayToList(
      context,
      indexOfMonth,
      month,
      classObject,
      i + 1,
      students[i],
    );
  }
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => StudentList()),
  // );
}
