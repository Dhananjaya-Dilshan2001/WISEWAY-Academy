import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/screen/UIBuilding/monthList.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:flutter/material.dart';

List<Widget> classListOnStudent = [];

class Collectpayment extends StatefulWidget {
  final aStudent student;
  Collectpayment({super.key, required this.student});
  @override
  State<Collectpayment> createState() => _CollectpaymentState();
}

class _CollectpaymentState extends State<Collectpayment> {
  // ignore: annotate_overrides
  void initState() {
    super.initState();
    setState(() {
      print("Trigger collect payment UI..!");
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
          child: Text("Collect Payment       ", style: fontStyle.font6),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: AppColors.color2,
              ),
              child: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Center(
                    child: Text(
                      "Student Payment Details",
                      style: fontStyle.font3,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: AppColors.color4,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.22,
                        width: MediaQuery.of(context).size.width * 0.22,
                        decoration: BoxDecoration(
                          color: AppColors.color1,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'Image/studentP.png',
                            ), // Background image
                            fit:
                                BoxFit
                                    .contain, // How the image should fit in the container
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.54,
                        //color: AppColors.color6,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 10.0, // Right padding
                            top: 0.0, // Top padding
                            bottom: 0.0, // Bottom padding
                          ),
                          child: Text(
                            "${widget.student.name}\n${widget.student.ID}"
                            "\nGrade ${widget.student.grade} - ${widget.student.curriculm} ",
                            style: fontStyle.font3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Column(children: classListOnStudent),
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

                  Column(children: monthCard),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
