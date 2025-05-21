import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/functions/student.dart';
import 'package:flutter/material.dart';

GestureDetector listCard(
  BuildContext context,
  int no,
  List<String> name,
  String ID,
  String grade,
) {
  //print("Student Name Is ${name[0]} ${name[1]}");
  return GestureDetector(
    onTap: () async {
      await waitForCollectPaymentPage(context, ID, 0);
    },
    child: Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.color3, // Set the background color of the container
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
                  AppColors.color4, // Set the background color of the container
              borderRadius: BorderRadius.circular(8.0), // Set the corner radius
            ),
            child: Center(child: Text("$no", style: fontStyle.font8)),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Container(
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.1,
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
            //height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              //color: AppColors.color4,// Set the background color of the container
              borderRadius: BorderRadius.circular(8.0), // Set the corner radius
            ),
            child: Text("${name[0]}", style: fontStyle.font3),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Container(
            //height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              //color: AppColors.color4,// Set the background color of the container
              borderRadius: BorderRadius.circular(8.0), // Set the corner radius
            ),
            child: Text("$ID", style: fontStyle.font5),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.1,

            child: Center(child: Text("$grade", style: fontStyle.font3)),
          ),
        ],
      ),
    ),
  );
}

//add items for table
void addNewStudentToList(
  BuildContext context,
  int no,
  List<String> name,
  String ID,
  String grade,
) {
  studentList.add(SizedBox(height: 5));
  studentList.add(listCard(context, no, name, ID, grade));
}

//build student widget list
Future<void> buildStudentList(
  BuildContext context,
  List<aStudent> students,
) async {
  studentList = []; // Clear the list before adding new items
  int l = students.length;
  print("Lenth of array in Build Student List Is $l");

  for (int i = 0; i < l; i++) {
    print("Student Name Is ${students[i].name}");
    addNewStudentToList(
      context,
      i + 1,
      students[i].name.split(' '),
      students[i].ID,
      students[i].grade,
    );
  }
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => StudentList()),
  // );
}
