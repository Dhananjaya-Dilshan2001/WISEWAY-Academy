import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/qrcode.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QRScannerPage extends StatefulWidget {
  final int purpose;
  final aClass classObject;
  final int indexOfDay;
  final aMonth month;
  final int monthIndex;
  final String year;
  const QRScannerPage({
    Key? key,
    required this.purpose,
    required this.classObject,
    required this.indexOfDay,
    required this.month,
    required this.monthIndex,
    required this.year,
  }) : super(key: key);
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  QRViewController? controller;
  Barcode? result;
  bool _isProcessing = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;
    controller?.scannedDataStream.listen((scanData) async {
      if (!mounted || _isProcessing) return;
      _isProcessing = true;
      await controller?.pauseCamera();
      setState(() {
        result = scanData;
      });
      String studentID = scanData.code.toString();
      print("Lenth of student ID ${studentID.length} --> ${studentID}");
      if (studentID.length == 15) {
        catchQRScannerID(
          context,
          studentID,
          widget.purpose,
          widget.classObject,
          widget.indexOfDay,
          widget.month,
          widget.monthIndex,
          widget.year,
        );
      } else {
        Navigator.pop(context);
        snackBarMsg(
          context,
          AppColors.color6,
          "Invalid QR Code ${studentID}",
          Icons.warning,
        );
      }
      // Run your method here
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.color2,
      content: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.7,
              child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
            ),
            Center(
              child:
                  (result != null)
                      ? Text(
                        'Barcode Type: ${result!.format}   Data: ${result!.code}',
                      )
                      : Text('Scan a code'),
            ),
          ],
        ),
      ),
    );
  }
}
