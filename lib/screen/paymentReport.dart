import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:flutter/material.dart';

class paymentReport extends StatefulWidget {
  const paymentReport({super.key});
  @override
  State<paymentReport> createState() => _paymentReportState();
}

class _paymentReportState extends State<paymentReport> {
  // ignore: annotate_overrides
  void initState() {
    super.initState();
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
                      Text("January", style: fontStyle.font2),
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
                        print('Tap Download');
                        // Perform download action here
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
              child: ListView(
                children: [
                  Center(child: Text("Classes", style: fontStyle.font3)),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: AppColors.color4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: AppColors.color2.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width * 0.6,
                          //color: AppColors.color5,
                          child: Column(
                            children: [
                              Text(
                                "Mathematics Edexcel - G10\nIshan Sir",
                                style: fontStyle.font3,
                              ),
                              //Text("Ishan Sir", style: fontStyle.font3),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: IconButton(
                            icon: Icon(
                              Icons.download_for_offline,
                              color: AppColors.color4,
                              size: MediaQuery.of(context).size.width * 0.15,
                            ),
                            onPressed: () {
                              print('Download document');
                              // Add download functionality here
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
