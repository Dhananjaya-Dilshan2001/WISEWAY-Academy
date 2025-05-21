import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:flutter/material.dart';

List<Widget> monthCard = [];

Row paidCard(BuildContext context, String monthName, String state) {
  //print("Student Name Is ${name[0]} ${name[1]}");
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.centerRight,
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.25,
        child: Text("$monthName :", style: fontStyle.font3),
      ),
      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
      GestureDetector(
        onTap: () async {},
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.55,
          child: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Text(
                "Paid  $state",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: AppColors.color6,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Row unPaidCard(
  BuildContext context,
  aMonth month,
  String classID,
  String studentID,
  int indexOfClass,
) {
  //print("Student Name Is ${name[0]} ${name[1]}");
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.centerRight,
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.25,
        child: Text("${month.name} :", style: fontStyle.font3),
      ),
      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
      GestureDetector(
        onTap: () async {
          await waitForCollectPayment(
            context,
            "2025",
            month,
            classID,
            studentID,
            indexOfClass,
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.55,
          child: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Icon(
                Icons.close,
                color: Colors.white,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Text(
                "Unpaid",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: AppColors.color6,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Future<void> buildMonthList(
  BuildContext context,
  List<aMonth> allMonth,
  String classID,
  String studentID,
  int indexOfClass,
) async {
  monthCard = [];

  for (int i = 0; i < 12; i++) {
    // Check if the studentID exists in the paidStudents list for the month
    bool isPaid = allMonth[i].paidStudents.any((entry) {
      // Each entry is a string like "StudentID Paid - 3000 - Cash"
      List<String> parts = entry.split(' ');
      return parts.isNotEmpty && parts[0] == studentID;
    });

    if (isPaid) {
      // Find the entry for this student
      String paidEntry = allMonth[i].paidStudents.firstWhere((entry) {
        List<String> parts = entry.split(' ');
        return parts.isNotEmpty && parts[0] == studentID;
      });
      // Extract payment details
      // Example: "StudentID Paid - 3000 - Cash"
      // parts[2] = amount, parts[4] = method (if format is consistent)
      List<String> parts = paidEntry.split(' ');
      String state = parts[2];
      monthCard.add(SizedBox(height: 5));
      monthCard.add(paidCard(context, allMonth[i].name, state));
    } else {
      monthCard.add(SizedBox(height: 5));
      monthCard.add(
        unPaidCard(context, allMonth[i], classID, studentID, indexOfClass),
      );
    }
  }
}
