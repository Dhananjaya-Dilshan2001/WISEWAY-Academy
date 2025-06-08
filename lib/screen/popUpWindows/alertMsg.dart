import 'package:apk/commonWidget/font&color.dart';
import 'package:flutter/material.dart';

void showPending(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible:
        false, // Prevents dismissing the dialog by tapping outside
    builder: (BuildContext context) {
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
            child: Text('Yes', style: fontStyle.font2),
          ),
        ],
      );
    },
  );
}

void snackBarMsg(
  BuildContext context,
  Color bgcolor,
  String msg,
  IconData icon,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: bgcolor,
      content: Row(
        children: [
          Icon(icon, color: AppColors.color4),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              msg,
              style: fontStyle.font3,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
      duration: Duration(seconds: 4),
    ),
  );
}
