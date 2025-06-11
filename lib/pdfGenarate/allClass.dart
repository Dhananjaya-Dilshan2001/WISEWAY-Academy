import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/allPaymentInFunction.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/pdfGenarate/dailyPayment.dart';
import 'package:apk/screen/paymentReport.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

Future<void> allClassMonthlyPaymentPDF(
  BuildContext context,
  List<aClass> allClass,
  List<aPayment> payments,
  String year, // Add this parameter
) async {
  showPending(context);
  int totalPayment = allClass
      .map((c) => getMonthlyPaymentAClass(c.ID, payments, year))
      .fold(0, (sum, payment) => sum + payment);

  final ByteData bytes = await rootBundle.load('Image/wiseway logo.png');
  final Uint8List logoBytes = bytes.buffer.asUint8List();
  final pw.ImageProvider logoImage = pw.MemoryImage(logoBytes);

  try {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        header: (pw.Context context) {
          if (context.pageNumber == 1) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Image(logoImage, width: 100, height: 100),
                pw.Center(
                  child: pw.Text(
                    "WISEWAY Academy - Kiribathgoda",
                    style: pw.TextStyle(
                      fontSize: 30,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Text(
                    "Monthly Payment Details - $year ${getMonthName(indexOfMonthOnPaymentReport + 1)}",
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  "Class Details",
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            );
          } else {
            return pw.SizedBox();
          }
        },
        build:
            (pw.Context context) => [
              pw.SizedBox(height: 5),
              pw.Table.fromTextArray(
                border: pw.TableBorder.all(),
                cellAlignment: pw.Alignment.centerLeft,
                headerStyle: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
                headers: [
                  'No',
                  'Teacher',
                  'Subject',
                  'Grade',
                  'Count Of Student',
                  'Payments',
                ],
                data:
                    allClass.map((object) {
                      return [
                        (allClass.indexOf(object) + 1).toString(),
                        object.teacher,
                        object.subject,
                        "${object.grade} - ${object.curriculm}",
                        object.students.length,
                        "${getMonthlyPaymentAClass(object.ID, payments, year)}/=",
                      ];
                    }).toList(),
              ),

              pw.SizedBox(height: 20),
              pw.Text(
                "Total Income : $totalPayment/=",
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
      ),
    );

    showPDFPreview(context, pdf);
  } catch (e) {
    print("Error generating PDF: $e");
  }
}
