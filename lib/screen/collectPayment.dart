import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:apk/screen/popUpWindows/tapOnMonth.dart';
import 'package:flutter/material.dart';

class Collectpayment extends StatefulWidget {
  const Collectpayment({super.key});
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
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color1,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      onChanged: (value) {
                        //searchStudentID = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Student ID', // Hint text
                        hintStyle: TextStyle(
                          color: AppColors.color4,
                          fontSize: 10, // Hint text color
                        ), // Background color of TextField
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ), // Curved border
                          borderSide: BorderSide(
                            color: Colors.white, // White border color
                            width: 1.0, // Border thickness
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ), // Curved border
                          borderSide: BorderSide(
                            color:
                                Colors.white, // White border color when focused
                            width: 2.0, // Border thickness
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.color4, // Text color
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  GestureDetector(
                    onTap: () async {
                      print("Click Search Button --ID ---> searchStudentID");
                      //showPending(context);
                      //await searchStudent(context, searchStudentID);
                      // await showDialog(
                      // context: context,
                      // builder: (BuildContext context) {
                      //   return searchedStudent(); // Call your StatefulWidget
                      // },
                      // );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: Image.asset("Image/search.png"),
                      decoration: BoxDecoration(
                        color: AppColors.color6,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  GestureDetector(
                    onTap: () async {
                      //viewAllStudentController(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: Icon(Icons.qr_code_scanner, color: Colors.white),
                      decoration: BoxDecoration(
                        color: AppColors.color6,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
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
                            "Thinuka Sasvindu \nKICA25003"
                            "\nGrade 10 - Edexcel ",
                            style: fontStyle.font3,
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
                      Container(
                        alignment: Alignment.centerRight,
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("January :", style: fontStyle.font3),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return tapOnMonth(); // Call your StatefulWidget
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.height * 0.03,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text(
                                "Paid - 3000 - Online",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height *
                                      0.018,
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
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("February:", style: fontStyle.font3),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      GestureDetector(
                        onTap: () {
                          //tap on month button;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.height * 0.03,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text(
                                "Paid - 3000  Cash",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height *
                                      0.018,
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
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("March :", style: fontStyle.font3),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      GestureDetector(
                        onTap: () {
                          //tap on month button;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Icon(
                                Icons.close,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.height * 0.03,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text(
                                "Unpaid",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height *
                                      0.018,
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
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonButton.button4(
                        MediaQuery.of(context).size.width * 0.3,
                        "Back",
                        AppColors.color3,
                        () async {
                          print('Tap on Back');
                          //tempStudent.setAllNull();
                          Navigator.of(context).pop();
                        },
                        AppColors.color4,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      commonButton.button4(
                        MediaQuery.of(context).size.width * 0.3,
                        "Update",
                        AppColors.color6,
                        () async {
                          print('Tap on Update');
                          //cheackTempStudentNull(context);
                        },
                        AppColors.color4,
                      ),
                    ],
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
