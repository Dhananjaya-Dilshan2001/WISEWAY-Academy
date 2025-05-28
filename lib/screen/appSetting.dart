import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/firebase/appInfo.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';

String oldPassword = "";
String newPassword = "";

class AppSetting extends StatefulWidget {
  const AppSetting({super.key});
  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  // ignore: annotate_overrides
  void initState() {
    oldPassword = "";
    newPassword = "";
    super.initState();
    setState(() {
      print("Trigger student List UI..!");
    });
  }

  @override
  void dispose() {
    oldPassword = "";
    newPassword = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.color2,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color4),
        backgroundColor: AppColors.color2,
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
          child: Text("App Setting         ", style: fontStyle.font6),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Center(
            child: Container(
              //height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: Column(
                children: [
                  Text("Admin Setting", style: fontStyle.font3),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: AppColors.color4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.25,
                        //color: AppColors.color5,
                        child: Text("Old Password", style: fontStyle.font4),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: Text(":   ", style: fontStyle.font4),
                      ),
                      //SizedBox(width: 5,),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: TextField(
                            style: fontStyle.font4,
                            decoration: InputDecoration(
                              hintText: "Type Old Password",
                              hintStyle: TextStyle(color: AppColors.color4),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            onChanged: (value) {
                              oldPassword = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.25,
                        //color: AppColors.color5,
                        child: Text("New Password", style: fontStyle.font4),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: Text(":   ", style: fontStyle.font4),
                      ),
                      //SizedBox(width: 5,),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: TextField(
                            style: fontStyle.font4,
                            decoration: InputDecoration(
                              hintText: "Type New Password",
                              hintStyle: TextStyle(color: AppColors.color4),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            onChanged: (value) {
                              newPassword = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  GestureDetector(
                    onTap: () {
                      popUpMsg(
                        context,
                        AppColors.color1,
                        "Change Admin Password",
                        "Are you sure you want to change the admin password?",
                        () {
                          changeAdminPasswordController(
                            context,
                            oldPassword,
                            newPassword,
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.color6,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Change Admin Password",
                        style: fontStyle.font6.copyWith(
                          color: AppColors.color4,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                  Text("Database", style: fontStyle.font3),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: AppColors.color4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  GestureDetector(
                    onTap: () {
                      popUpMsg(
                        context,
                        AppColors.color5,
                        "Are you sure..!",
                        "Are you sure you want to set Firebase for next year?",
                        () => setFirebaseForNextYear(context),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.color6,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.cloud_sync,
                            color: AppColors.color4,
                            size: MediaQuery.of(context).size.height * 0.05,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text(
                            "Set Firebase For Next Year",
                            style: fontStyle.font6.copyWith(
                              color: AppColors.color4,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
