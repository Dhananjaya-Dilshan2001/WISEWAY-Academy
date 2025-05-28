import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String appVersion = "1.0";
String ownerMsgTitle = "";
String ownerMsgBody = "";
bool appAccess = false;

Future<String?> getAdminPassword() async {
  try {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance
            .collection('AppInfo')
            .doc('AppInfo')
            .get();

    if (doc.exists) {
      String password = doc.get('adminPassword');
      return password;
    } else {
      print('Document does not exist');
      return null;
    }
  } catch (e) {
    print('Error getting appVersion: $e');
    return null;
  }
}

Future<String?> getAppVersion() async {
  try {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance
            .collection('AppInfo')
            .doc('AppInfo')
            .get();

    if (doc.exists) {
      String appVersion = doc.get('appVersion');
      return appVersion;
    } else {
      print('Document does not exist');
      return null;
    }
  } catch (e) {
    print('Error getting appVersion: $e');
    return null;
  }
}

Future<bool> getAppOwnerDetails() async {
  try {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance
            .collection('AppInfo')
            .doc('AppInfo')
            .get();

    if (doc.exists) {
      appAccess = doc.get('appAccess');
      ownerMsgTitle = doc.get('ownerMsgTitle');
      ownerMsgBody = doc.get('ownerMsgBody');
      return appAccess;
    } else {
      print('Document does not exist');
      return appAccess;
    }
  } catch (e) {
    print('Error getting appVersion: $e');
    return appAccess;
  }
}

Future<bool> checkOwnerAccess(BuildContext context) async {
  if (await getAppOwnerDetails()) {
    return true;
  } else {
    Navigator.of(context).pop();
    popUpMsg(
      context,
      AppColors.color3,
      "${ownerMsgTitle}",
      "$ownerMsgBody",
      () => Navigator.of(context).pop(),
    );
    return false;
  }
}

Future<bool> cheackAppVersion(BuildContext context) async {
  if (appVersion == await getAppVersion()) {
    print("App Version is OK..!");
    return true;
  } else {
    print("App version is not matched");
    Navigator.of(context).pop();
    popUpMsg(
      context,
      AppColors.color3,
      "Update available..!",
      "Your App version: "
          "$appVersion \nLatest Version : ${await getAppVersion()}",
      () => Navigator.of(context).pop(),
    );
    return false;
  }
}

Future<bool> cheackAdminPassword(BuildContext context, String password) async {
  if (password == await getAdminPassword()) {
    print("Password Is Matched..!");
    return true;
  } else {
    print("Password Incorrect");
    Navigator.of(context).pop();
    popUpMsg(
      context,
      AppColors.color1,
      "Incorrect Password..!",
      "Please re-enter correct password..!",
      () => Navigator.of(context).pop(),
    );
    return false;
  }
}

void updateAdminPassword(BuildContext context, String newPassword) async {
  try {
    await FirebaseFirestore.instance
        .collection('AppInfo')
        .doc('AppInfo')
        .update({'adminPassword': newPassword});

    snackBarMsg(
      context,
      AppColors.color5,
      "Your password has been changed successfully.",
      Icons.check,
    );
  } catch (e) {
    print('Error updating password: $e');
    snackBarMsg(
      context,
      AppColors.color6,
      "Failed to change password. Please try again. $e",
      Icons.error,
    );
  }
}

void changeAdminPasswordController(
  BuildContext context,
  String oldPassword,
  String newPassword,
) async {
  showPending(context);
  if (await cheackAdminPassword(context, oldPassword)) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    updateAdminPassword(context, newPassword);
  } else {
    print("Old Password is not matched");
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    snackBarMsg(
      context,
      Colors.red,
      "Old Password is not matched.",
      Icons.error,
    );
  }
}
