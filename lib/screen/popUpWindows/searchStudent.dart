import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:flutter/material.dart';

String searchStudentID = "";

class searchStudent extends StatefulWidget {
  const searchStudent({super.key});
  @override
  State<searchStudent> createState() => _searchStudentState();
}

class _searchStudentState extends State<searchStudent> {
  Color tapOnline = AppColors.color2;
  Color tapCash = AppColors.color6;

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
            Text("Search Student", style: fontStyle.font2),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.7,
              color: AppColors.color4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    onChanged: (value) {
                      searchStudentID = value;
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
                    await waitForCollectPaymentPage(
                      context,
                      "C10-0423-0504",
                      0,
                    );
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
          ],
        ),
      ),
    );
  }
}
