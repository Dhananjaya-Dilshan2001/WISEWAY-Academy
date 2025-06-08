import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:apk/screen/popUpWindows/updateStudent.dart';
import 'package:flutter/material.dart';

GestureDetector listCardOnViewStudent(
  BuildContext context,
  aClass object,
  bool click,
  bool attend,
  int monthIndex,
  aMonth month,
  aStudent student,
  int indexOfDay,
  int no,
  List<String> name,
  String ID,
  bool removeButton,
  bool removeButton2,
  String year,
) {
  return GestureDetector(
    onTap:
        click
            ? () async {
              if (attend) {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return attendStudent(
                      student: student,
                      indexOfDay: indexOfDay,
                      classObject: object,
                      day: month.attendance[indexOfDay],
                      monthIndex: monthIndex,
                      month: month,
                      year: year,
                    ); // Call your StatefulWidget
                  },
                );
              } else {
                print("Card clicked: $ID");
                addStudentIntoClassController(context, object, student, year);
                print("Student added successfully to the class.");
              }
            }
            // Define the action to perform when the widget is clicked
            : null,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color:
            student.grade !=
                    object
                        .grade // Check if the student's grade matches the class grade"
                ? AppColors.color3.withOpacity(
                  0.5,
                ) // If not, set a different color with reduced opacity
                : AppColors.color3, // Set the background color of the container
        borderRadius: BorderRadius.circular(10.0), // Set the corner radius
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color:
                  AppColors.color4, // Set the background color of the container
              borderRadius: BorderRadius.circular(8.0), // Set the corner radius
            ),
            child: Center(child: Text("$no", style: fontStyle.font8)),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Container(
            height: MediaQuery.of(context).size.width * 0.08,
            width: MediaQuery.of(context).size.width * 0.05,
            decoration: BoxDecoration(
              color: AppColors.color4,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('Image/studentP.png'), // Background image
                fit:
                    BoxFit.contain, // How the image should fit in the container
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text(
              "${name[0]}",
              style: fontStyle.font3.copyWith(
                fontSize: 12,
              ), // Updated font size
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Container(
            child: Text("${ID}", style: fontStyle.font5.copyWith(fontSize: 8)),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Visibility(
            visible: removeButton,
            child: GestureDetector(
              onTap: () {
                popUpMsg(
                  context,
                  AppColors.color3,
                  "Remove Student",
                  "Are you sure you want to remove ${student.name} from this class?",
                  () {
                    Navigator.pop(context);
                    // Call the function to remove the student from the class
                    removeStudentFromClassController(
                      context,
                      object,
                      student,
                      year,
                    );
                  },
                );
              },
              child: Icon(Icons.remove_circle_outline, color: AppColors.color4),
            ),
          ),
          Visibility(
            visible: removeButton2,
            child: GestureDetector(
              onTap: () {
                popUpMsg(
                  context,
                  AppColors.color3,
                  "Remove Attendance",
                  "Are you sure you want to remove attendance for ${student.name} on ${month.name}?",
                  () {
                    Navigator.pop(context);
                    // Call the function to remove attendance
                    removeAttendance(
                      context,
                      object,
                      student.ID,
                      month,
                      indexOfDay,
                      year,
                    );
                  },
                );
              },
              child: Icon(Icons.remove_circle_outline, color: AppColors.color4),
            ),
          ),
        ],
      ),
    ),
  );
}

//add items for table
void addNewStudentToViewStudent(
  BuildContext context,
  aClass object,
  bool click,
  bool attend,
  int indexOfMonth,
  aMonth month,
  aStudent student,
  int indexOfDay,
  int no,
  List<String> name,
  String ID,
  bool removeButton,
  bool removeButton2,
  String year,
) {
  viewStudent.add(SizedBox(height: 5));
  viewStudent.add(
    listCardOnViewStudent(
      context,
      object,
      click,
      attend,
      indexOfMonth,
      month,
      student,
      indexOfDay,
      no,
      name,
      ID,
      removeButton,
      removeButton2,
      year,
    ),
  );
}

//build student widget list
Future<void> buildStudentListOnViewStudent(
  BuildContext context,
  aClass object,
  List<aStudent> students,
  bool click,
  bool attend,
  int indexOfMonth,
  aMonth month,
  int indexOfDay,
  bool removeButton,
  bool removeButton2,
  String year,
) async {
  viewStudent = []; // Clear the list before adding new items
  int l = students.length;
  print(
    "Call buildStudentListOnViewStudent --- Passing Month Name Is ${month.name}",
  );

  for (int i = 0; i < l; i++) {
    print("Student Name Is ${students[i].name}");
    addNewStudentToViewStudent(
      context,
      object,
      click,
      attend,
      indexOfMonth,
      month,
      students[i],
      indexOfDay,
      i + 1,
      students[i].name.split(' '),
      students[i].ID,
      removeButton,
      removeButton2,
      year,
    );
  }
}
