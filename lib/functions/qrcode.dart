import 'dart:ui';

import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:apk/screen/popUpWindows/updateStudent.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> catchQRScannerID(
  BuildContext context,
  String studentID,
  int purpose,
  aClass classObject,
  int indexOfDay,
  aMonth month,
  int monthIndex,
  String year,
) async {
  print("Student ID : $studentID");
  if (purpose == 0) {
    await waitForCollectPaymentPage(
      context,
      studentID,
      0,
      "${DateTime.now().year.toString()}",
    );
  } else if (purpose == 1) {
    aStudent? student = await fetchStudentByID(context, studentID);

    addStudentIntoClassController(context, classObject, student!, year);
  } else if (purpose == 2) {
    if (classObject.students.any((student) => student == studentID)) {
      aStudent? student = await fetchStudentByID(context, studentID);
      Navigator.pop(context);
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return attendStudent(
            student: student!,
            indexOfDay: indexOfDay,
            classObject: classObject,
            day: month.attendance[indexOfDay],
            monthIndex: monthIndex,
            month: month,
            year: year,
          ); // Call your StatefulWidget
        },
      );
      return;
    } else {
      snackBarMsg(
        context,
        AppColors.color6,
        "This student not registered for this class.",
        Icons.warning,
      );
      Navigator.pop(context);
      return;
    }
  } else {
    snackBarMsg(
      context,
      AppColors.color6,
      "Not a purpose of Scan QR",
      Icons.warning,
    );
  }
}

Future<void> downloadQrImageView(
  BuildContext context,
  String data,
  String fileName,
) async {
  try {
    // Request storage permission
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      snackBarMsg(
        context,
        AppColors.color6,
        "Storage permission denied.",
        Icons.warning,
      );
      return;
    }

    // Generate QR image as bytes
    final qrValidationResult = QrValidator.validate(
      data: data,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );
    if (qrValidationResult.status != QrValidationStatus.valid) {
      snackBarMsg(context, AppColors.color6, "Invalid QR data.", Icons.warning);
      return;
    }
    final qrCode = qrValidationResult.qrCode!;
    final painter = QrPainter.withQr(
      qr: qrCode,
      color: const Color(0xFF000000),
      emptyColor: const Color(0xFFFFFFFF),
      gapless: true,
    );
    final picData = await painter.toImageData(400, format: ImageByteFormat.png);
    if (picData == null) {
      snackBarMsg(
        context,
        AppColors.color6,
        "Failed to generate QR image.",
        Icons.warning,
      );
      return;
    }

    // Get download directory
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    if (directory == null) {
      snackBarMsg(
        context,
        AppColors.color6,
        "Cannot access storage.",
        Icons.warning,
      );
      return;
    }

    // Save file
    String filePath = "${directory.path}/$fileName.png";
    File file = File(filePath);
    await file.writeAsBytes(picData.buffer.asUint8List());

    snackBarMsg(
      context,
      Colors.green,
      "QR code saved as $fileName.png",
      Icons.check,
    );
  } catch (e) {
    snackBarMsg(context, AppColors.color6, "Error: $e", Icons.warning);
  }
}
