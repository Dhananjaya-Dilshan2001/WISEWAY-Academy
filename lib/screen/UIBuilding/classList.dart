import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/payment.dart';
import 'package:apk/screen/UIBuilding/dayList.dart';
import 'package:apk/screen/classDashboard.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

GestureDetector listCardOnClassList(
  BuildContext context,
  String grade,
  String curriculm,
  String subject,
  List<String> note,
  String teacher,
  String ID,
  aClass object,
) {
  //print("Student Name Is ${name[0]} ${name[1]}");
  return GestureDetector(
    onTap: () async {
      showPending(context);
      List<aMonth>? payment = await getPaymentController(
        context,
        "2025",
        object.ID,
      );
      if (payment != null && payment.isNotEmpty) {
        await buildDayList(
          context,
          0,
          payment[0],
          object,
          payment[0].attendance,
        );
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => Classdashboard(
                object: object,
                month: payment?[0] ?? nullMonthObject(),
              ),
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      //height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: AppColors.color2.withOpacity(0.7),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.01),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.25),
              Text(
                "Grade $grade - $curriculm",
                style: TextStyle(
                  color: AppColors.color4,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansSinhala',
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.17),
              Icon(Icons.settings, color: AppColors.color4),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.01),
          Text(
            "$subject",
            style: TextStyle(
              color: AppColors.color4,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansSinhala',
              fontSize: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.01),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                //height: MediaQuery.of(context).size.height * 0.05,
                //color: AppColors.color5,
                child: Text(
                  "${note[0]}",
                  style: TextStyle(
                    color: AppColors.color4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansSinhala',
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),

              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.centerRight,
                //color: AppColors.color5,
                child: Text(
                  "Conducted by",
                  style: TextStyle(
                    color: AppColors.color4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansSinhala',
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                //color: AppColors.color5,
                child: Text(
                  "${note.length > 1 ? note[1] : " "}",
                  style: TextStyle(
                    color: AppColors.color4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansSinhala',
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.centerRight,
                //color: AppColors.color5,
                child: Text(
                  "$teacher",
                  style: TextStyle(
                    color: AppColors.color4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansSinhala',
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

//add items for table
void addNewClassToList(
  BuildContext context,
  String grade,
  String curriculm,
  String subject,
  List<String> note,
  String teacher,
  String ID,
  aClass object,
) {
  classList.add(SizedBox(height: 5));
  classList.add(
    listCardOnClassList(
      context,
      grade,
      curriculm,
      subject,
      note,
      teacher,
      ID,
      object,
    ),
  );
}

//build student widget list
Future<void> buildClassList(BuildContext context, List<aClass> objects) async {
  classList = []; // Clear the list before adding new items
  int l = objects.length;
  print("Lenth of array in Build Class List Is $l");

  for (int i = 0; i < l; i++) {
    addNewClassToList(
      context,
      objects[i].grade,
      objects[i].curriculm,
      objects[i].subject,
      objects[i].note.split(' '),
      objects[i].teacher,
      objects[i].ID,
      objects[i],
    );
  }
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => StudentList()),
  // );
}
