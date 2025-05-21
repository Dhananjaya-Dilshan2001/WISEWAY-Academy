import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/pdfGenarate/dailyPayment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

Timestamp viewDate = Timestamp.now();

class viewDailyReport extends StatefulWidget {
  const viewDailyReport({super.key});
  @override
  State<viewDailyReport> createState() => _viewDailyReportState();
}

class _viewDailyReportState extends State<viewDailyReport> {
  Color tapOnline = AppColors.color2;
  Color tapCash = AppColors.color6;

  @override
  void initState() {
    super.initState();
    viewDate = Timestamp.now();
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
            Text("View Daily Report", style: fontStyle.font2),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.7,
              color: AppColors.color4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
                          '${viewDate.toDate().year.toString()}/'
                          '${viewDate.toDate().month.toString()}/'
                          '${viewDate.toDate().day.toString()}',
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
                        viewDate = Timestamp.fromDate(value!);
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            commonButton.button4(
              MediaQuery.of(context).size.width * 0.3,
              "View Report",
              AppColors.color6,
              () async {
                print('Tap on View Report');
                generatePaperBudgetPDF(context, viewDate);
              },
              AppColors.color4,
            ),
          ],
        ),
      ),
    );
  }
}
