import 'package:apk/dataModel/model.dart';
import 'package:apk/firebase/allPayment.dart';
import 'package:apk/firebase/classFunction.dart';
import 'package:apk/firebase/studentFunctios.dart';
import 'package:apk/functions/allPaymentInFunction.dart';
import 'package:apk/functions/classes.dart';
import 'package:apk/functions/filters.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

Future<void> generatePaperBudgetPDF(
  BuildContext context,
  Timestamp date,
) async {
  showPending(context);
  String docID = "${date.toDate().year}-${getMonthName(date.toDate().month)}";
  await getAllPaymentByID(context, docID);
  await getAllStudent(context);
  await getAllClass(context);
  List<aPayment> dailyPayment = filterPaymentAccordingToDay(
    allPaymentAMonth,
    date.toDate().day,
  );

  // List<studentPaperObject> KiribathgodaStudent = sortStudentsByNameO(
  //   filterInstituteO(paper.attendance, "K"),
  // );
  // List<studentPaperObject> YakkalaStudent = sortStudentsByNameO(

  final ByteData bytes = await rootBundle.load('Image/wiseway logo.png');
  final Uint8List logoBytes = bytes.buffer.asUint8List();
  final pw.ImageProvider logoImage = pw.MemoryImage(logoBytes);
  //paper.income = await setIncomeOfPaper(paper);

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
                    "WISEWAY Academy",
                    style: pw.TextStyle(
                      fontSize: 30,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  "Daily Payment Details",
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  "Date :${date.toDate().year}/${date.toDate().month}/${date.toDate().day}",
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),

                pw.SizedBox(height: 20),
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
                  'Student Name',
                  'Grade',
                  'Subject',
                  'Reason',
                  'Payment Value',
                ],
                data:
                    dailyPayment.map((payment) {
                      return [
                        (dailyPayment.indexOf(payment) + 1).toString(),
                        fetchStudenDetailsByID(
                          allStudent,
                          payment.studentID,
                          "name",
                        ),
                        "${fetchClassDetailsByID(allClass, payment.classID, 'grade')} - ${fetchClassDetailsByID(allClass, payment.classID, 'curriculm')}",
                        fetchClassDetailsByID(
                          allClass,
                          payment.classID,
                          'subject',
                        ),
                        payment.reason,
                        payment.value,
                      ];
                    }).toList(),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "Payment Details",
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "InstituteIncome",
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "Total Income : {paper.income}/=",
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
      ),
    );

    showPDFPreview(context, pdf);

    // final outputDir = await getApplicationDocumentsDirectory();
    // final filePath = "${outputDir.path}/PaperBudget_$docID.pdf";
    // final file = File(filePath);

    // await file.writeAsBytes(await pdf.save());
    // OpenFile.open(file.path);

    //print("PDF generated and opened successfully: ${file.path}");
  } catch (e) {
    print("Error generating PDF: $e");
  }
}

// pdf for student details of a paper
// Future<void> generatePaperPDF(BuildContext context, aPaper paper) async {
//   showPending(context);
//   paper.attendance = sortStudentsByNameO(paper.attendance);

//   final ByteData bytes = await rootBundle.load('Image/wiseway logo.png');
//   final Uint8List logoBytes = bytes.buffer.asUint8List();
//   final pw.ImageProvider logoImage = pw.MemoryImage(logoBytes);
//   try {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.MultiPage(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(32),
//         header: (pw.Context context) {
//           if (context.pageNumber == 1) {
//             return pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 pw.Image(logoImage, width: 100, height: 100),
//                 pw.Center(
//                   child: pw.Text(
//                     "WISEWAY Papers",
//                     style: pw.TextStyle(
//                       fontSize: 30,
//                       fontWeight: pw.FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 pw.SizedBox(height: 20),

//                 pw.Text(
//                   "Paper Details",
//                   style: pw.TextStyle(
//                     fontSize: 24,
//                     fontWeight: pw.FontWeight.bold,
//                   ),
//                 ),
//                 pw.SizedBox(height: 10),
//                 pw.Text(
//                   "Paper Name: ${paper.name}",
//                   style: pw.TextStyle(fontSize: 16),
//                 ),
//                 pw.Text(
//                   "Subject: ${paper.subject}",
//                   style: pw.TextStyle(fontSize: 16),
//                 ),
//                 pw.Text(
//                   "Date: ${paper.date.toDate()}",
//                   style: pw.TextStyle(fontSize: 16),
//                 ),
//                 pw.Text(
//                   "Student Count: ${paper.attendance.length}",
//                   style: pw.TextStyle(fontSize: 16),
//                 ),
//                 pw.SizedBox(height: 20),
//                 pw.Text(
//                   "Student Details",
//                   style: pw.TextStyle(
//                     fontSize: 20,
//                     fontWeight: pw.FontWeight.bold,
//                   ),
//                 ),
//                 pw.SizedBox(height: 10),
//               ],
//             );
//           } else {
//             return pw.SizedBox(); // No header on other pages
//           }
//         },
//         build:
//             (pw.Context context) => [
//               pw.Table.fromTextArray(
//                 border: pw.TableBorder.all(),
//                 cellAlignment: pw.Alignment.centerLeft,
//                 headerStyle: pw.TextStyle(
//                   fontSize: 14,
//                   fontWeight: pw.FontWeight.bold,
//                 ),
//                 headers: ['ID', 'Name', 'Mark', 'P', 'W', 'D'],
//                 data:
//                     paper.attendance.map((student) {
//                       return [
//                         student.studentId,
//                         student.studentName,
//                         '${student.mark}%',
//                         student.payment,
//                         student.w,
//                         student.d.toString(),
//                       ];
//                     }).toList(),
//               ),
//             ],
//       ),
//     );

//     // ✅ Show PDF Preview before saving (if you have this function)
//     showPDFPreview(context, pdf);

//     final outputDir = await getApplicationDocumentsDirectory();
//     final filePath = "${outputDir.path}/Paper_${paper.ID}.pdf";
//     final file = File(filePath);

//     await file.writeAsBytes(await pdf.save());
//     OpenFile.open(file.path);

//     print("PDF generated and opened successfully: ${file.path}");
//   } catch (e) {
//     print("Error generating PDF: $e");
//   }
// }

// Show PDF Preview before saving
void showPDFPreview(BuildContext context, pw.Document pdf) {
  Navigator.pop(context); // Close the loading dialog
  Navigator.push(
    context,
    MaterialPageRoute(
      builder:
          (context) => Scaffold(
            appBar: AppBar(title: Text("PDF Preview")),
            body: PdfPreview(build: (format) => pdf.save()),
          ),
    ),
  );
}

// //update paper state as pending or complete
// Future<void> updatePaperStateController(
//   BuildContext context,
//   String paperID,
//   int state,
// ) async {
//   showPending(context);
//   searchP.state = state;
//   await updatePaperUsingID(context, paperID);
//   await getAllPaper(context);
//   sortInPaperDashboard(context);
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => paperDashBoard()),
//   );
// }
