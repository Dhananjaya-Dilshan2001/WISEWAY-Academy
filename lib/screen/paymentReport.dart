import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/paymentReport.dart';
import 'package:apk/screen/UIBuilding/classListInPaymenteport.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

int indexOfMonthOnPaymentReport = 0;

class paymentReport extends StatefulWidget {
  const paymentReport({super.key});
  @override
  State<paymentReport> createState() => _paymentReportState();
}

class _paymentReportState extends State<paymentReport> {
  // ignore: annotate_overrides
  void initState() {
    super.initState();
    indexOfMonthOnPaymentReport = DateTime.now().month - 1;
    setState(() {
      print("Trigger payment Report UI..!");
    });
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
          child: Text("Payment Reports         ", style: fontStyle.font6),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
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
                          showPending(context);
                          commonYear = await yearShiftController(
                            context,
                            allClass[0].ID,
                            commonYear,
                            false,
                          );
                          Navigator.pop(context);
                          setState(() {
                            print("Year Changed to $commonYear");
                          });
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
                      Text("$commonYear", style: fontStyle.font2),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      GestureDetector(
                        onTap: () async {
                          showPending(context);
                          commonYear = await yearShiftController(
                            context,
                            allClass[0].ID,
                            commonYear,
                            true,
                          );
                          Navigator.pop(context);
                          setState(() {
                            print("Year Changed to $commonYear");
                          });
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
                          if (indexOfMonthOnPaymentReport > 0) {
                            setState(() {
                              indexOfMonthOnPaymentReport--;
                            });
                          }
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
                      Text(
                        "${getMonthName(indexOfMonthOnPaymentReport + 1)}",
                        style: fontStyle.font2,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      GestureDetector(
                        onTap: () async {
                          if (indexOfMonthOnPaymentReport < 11) {
                            setState(() {
                              indexOfMonthOnPaymentReport++;
                            });
                          }
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
                  Container(
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: commonButton.button2(
                      MediaQuery.of(context).size.height * 0.04,
                      MediaQuery.of(context).size.width * 0.3,
                      "Summery",
                      AppColors.color6,
                      () async {
                        allClassPdfGenarateController(context, commonYear);
                      },
                      AppColors.color4,
                      Icons.download,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: Column(
                children: [
                  Center(child: Text("Classes", style: fontStyle.font3)),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: AppColors.color4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Column(children: classListOnPaymentReport),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
