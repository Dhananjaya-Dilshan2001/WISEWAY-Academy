import 'package:apk/commonWidget/font&color.dart';
import 'package:flutter/material.dart';

void showPending(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible:
        false, // Prevents dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 30), () {
        Navigator.of(context).pop(); // Close the dialog after 10 seconds
      });
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          height: 100.0,
          width: 100.0,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    },
  );
}

void popUpMsg(
  BuildContext context,
  Color b,
  String msgTitle,
  String msgBody,
  VoidCallback ontap,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: b,
        title: Text(msgTitle),
        titleTextStyle: fontStyle.font2,
        content: Text(msgBody),
        contentTextStyle: fontStyle.font3,
        actions: [
          TextButton(
            onPressed: () {
              ontap();
            },
            child: Text('OK', style: fontStyle.font2),
          ),
        ],
      );
    },
  );
}
