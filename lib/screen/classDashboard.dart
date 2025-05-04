import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:apk/screen/popUpWindows/addDay.dart';
import 'package:apk/screen/popUpWindows/allStudent.dart';
import 'package:apk/screen/popUpWindows/updateStudent.dart';
import 'package:flutter/material.dart';

class Classdashboard extends StatefulWidget {
  const Classdashboard({super.key});
  @override
  State<Classdashboard> createState() => _ClassdashboardState();
}

class _ClassdashboardState extends State<Classdashboard> {
  // ignore: annotate_overrides
  void initState() {
    super.initState();
    setState(() {
      print("Trigger Class Dashboard UI..!");
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
          child: Text("Class Dashboard        ", style: fontStyle.font6),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.19,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: AppColors.color2,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      //height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: IconButton(
                        icon: Icon(
                          Icons.class_,
                          color: AppColors.color4,
                          size: MediaQuery.of(context).size.width * 0.15,
                        ),
                        onPressed: () {
                          print('Download document');
                          // Add download functionality here
                        },
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      alignment: Alignment.centerLeft,
                      //height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.5,
                      //color: AppColors.color5,
                      child: Column(
                        children: [
                          Text(
                            "Mathematics Edexcel - G10\nIshan Sir\nMathG10001",
                            style: fontStyle.font3,
                          ),
                          //Text("Ishan Sir", style: fontStyle.font3),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Monday 8.00 AM - 10.00 AM",
                    style: fontStyle.font3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.9,
            //color: AppColors.color2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return viewAllStudent(); // Call your StatefulWidget
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
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                GestureDetector(
                  onTap: () async {
                    //viewAllStudentController(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Icon(Icons.add, color: Colors.white),
                    decoration: BoxDecoration(
                      color: AppColors.color6,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
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
                ],
              ),
            ),
          ),
          //SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              //color: AppColors.color2,
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color:
                        AppColors
                            .color4, // Set the background color of the container
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // Set the corner radius
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color:
                              AppColors
                                  .color2, // Set the background color of the container
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ), // Set the corner radius
                        ),
                        child: Center(
                          child: Text("01", style: fontStyle.font3),
                        ),
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: MediaQuery.of(context).size.height * 0.03,
                              //color: AppColors.color2,
                              child: Text(
                                "Thursday - 05/03",
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
                                "04.00 PM - 06.00 PM",
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
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return viewAllStudent(); // Call your StatefulWidget
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
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return attendStudent(); // Call your StatefulWidget
                            },
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.18,
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
                            size: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return addDay(); // Call your StatefulWidget
                      },
                    );
                    //viewAllStudentController(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Icon(Icons.add, color: Colors.white),
                    decoration: BoxDecoration(
                      color: AppColors.color6,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
