import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/screen/adminPanel.dart';
import 'package:flutter/material.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({super.key});
  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  // ignore: annotate_overrides
  void initState() {
    super.initState();
    setState(() {
      print("Trigger student List UI..!");
    });
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
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setFirebaseForNextYear(context);
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Center(
            child: Container(
              //height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
            ),
          ),
        ],
      ),
    );
  }
}
