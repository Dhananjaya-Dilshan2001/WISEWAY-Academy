import 'package:apk/commonWidget/font&color.dart';
import 'package:flutter/material.dart';

class viewAllStudent extends StatefulWidget {
  const viewAllStudent({super.key});
  @override
  _viewAllStudentState createState() => _viewAllStudentState();
}

class _viewAllStudentState extends State<viewAllStudent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.color2,
      content: Container(
        //padding: EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: Column(
                children: [
                  Text("Students", style: fontStyle.font2),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: AppColors.color4,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color:
                          AppColors
                              .color3, // Set the background color of the container
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ), // Set the corner radius
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                            color:
                                AppColors
                                    .color4, // Set the background color of the container
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ), // Set the corner radius
                          ),
                          child: Center(
                            child: Text("01", style: fontStyle.font8),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.08,
                          width: MediaQuery.of(context).size.width * 0.08,
                          decoration: BoxDecoration(
                            color: AppColors.color4,
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          //height: MediaQuery.of(context).size.height * 0.02,
                          width: MediaQuery.of(context).size.width * 0.15,

                          child: Text("Thinuka", style: fontStyle.font3),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Container(
                          //height: MediaQuery.of(context).size.height * 0.04,
                          //width: MediaQuery.of(context).size.width * 0.2,
                          child: Text("KIED10001", style: fontStyle.font5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
