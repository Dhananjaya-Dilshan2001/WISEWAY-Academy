import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/firebase/classFunction.dart';
import 'package:apk/firebase/appInfo.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/filters.dart';
import 'package:apk/screen/UIBuilding/classList.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

String adminPassword = "";

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.color1,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Container(
              child: Text("WISEWAY \nAcademy", style: fontStyle.font7),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset("Image/wiseway logo.png"),
              decoration: BoxDecoration(shape: BoxShape.circle),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                onChanged: (value) {
                  adminPassword = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Admin ID', // Hint text
                  hintStyle: TextStyle(
                    color: AppColors.color4,
                  ), // Background color of TextField
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0), // Curved border
                    borderSide: BorderSide(
                      color: Colors.white, // White border color
                      width: 2.0, // Border thickness
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0), // Curved border
                    borderSide: BorderSide(
                      color: Colors.white, // White border color when focused
                      width: 2.0, // Border thickness
                    ),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.color4, // Text color
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Center(
            child: commonButton.button1(
              MediaQuery.of(context).size.width * 0.6,
              "Logging",
              AppColors.color6,
              () async {
                print('Tap on Logging');
                showPending(context);
                await getAllClass(context);
                buildGradeListOfClasses(context, allClass, "0");
                await buildClassList(
                  context,
                  filterClassByType(allClass, "Monthly"),
                  DateTime.now().year.toString(),
                );
                bool isValid = await cheackAdminPassword(
                  context,
                  adminPassword,
                );
                bool appVersionCheck = await cheackAppVersion(context);
                bool ownerAccess = await checkOwnerAccess(context);
                if (isValid && appVersionCheck && ownerAccess) {
                  adminPassword = "";
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => adminPanel()),
                  );
                }
              },
              AppColors.color4,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          Text("@Powered by AppWhiz Solutions", style: fontStyle.font3),
        ],
      ),
    );
  }
}
