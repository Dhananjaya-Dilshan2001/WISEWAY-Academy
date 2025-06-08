import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/allPaymentInFunction.dart';
import 'package:apk/functions/paymentInFunction.dart';
import 'package:apk/functions/student.dart';
import 'package:apk/pdfGenarate/dailyPayment.dart';
import 'package:apk/screen/popUpWindows/alertMsg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

Future<void> classMonthlyPaymentPDF(
  BuildContext context,
  aClass classObject,
  aMonth month,
  List<aPayment> payments,
  String year, // Add this parameter
) async {
  showPending(context);
  List<aPayment> classAllPayment = fetchClassAllPayment(
    classObject.ID,
    payments,
    year,
  );
  int totalPayment = classAllPayment.fold(
    0,
    (sum, payment) => sum + payment.value,
  );

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
                    "WISEWAY Academy",
                    style: pw.TextStyle(
                      fontSize: 30,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Text(
                    "Monthly Payment Details A Class - $year ${month.name}",
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
                pw.SizedBox(height: 10),
                pw.Text(
                  "Class : Grade ${classObject.grade} - ${classObject.curriculm} ${classObject.subject}",
                  style: pw.TextStyle(
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  "Teacher : ${classObject.teacher}",
                  style: pw.TextStyle(
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  "Attendance",
                  style: pw.TextStyle(
                    fontSize: 15,
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
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                ),
                headers: [
                  'No',
                  'Student Name',
                  ...List.generate(
                    month.attendance.length,
                    (index) =>
                        'Day ${index + 1}\n${month.attendance[index].date.toDate().month}/${month.attendance[index].date.toDate().day}',
                  ),
                ],
                data:
                    classObject.students.map((student) {
                      // Prepare attendance data
                      final attendanceData = List.generate(
                        month.attendance.length,
                        (index) {
                          final attendanceStudents =
                              month.attendance[index].students;
                          final matched = attendanceStudents.firstWhere(
                            (attStudent) =>
                                attStudent.split(' ').isNotEmpty &&
                                student.split(' ').isNotEmpty &&
                                attStudent.split(' ')[0] ==
                                    student.split(' ')[0],
                            orElse: () => '0',
                          );
                          if (matched.isNotEmpty &&
                              matched.split(' ').length > 1) {
                            return matched.split(' ')[1][0];
                          } else {
                            return 'ab';
                          }
                        },
                      );

                      return [
                        "${classObject.students.indexOf(student) + 1}",
                        "${fetchStudenDetailsByID(allStudent, student, "name")}",
                        ...attendanceData,
                      ];
                    }).toList(),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "Payments",
                style: pw.TextStyle(
                  fontSize: 15,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Table.fromTextArray(
                border: pw.TableBorder.all(),
                cellAlignment: pw.Alignment.centerLeft,
                headerStyle: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                ),
                headers: ['No', 'Student Name', 'Payment', 'Reason', 'Value'],
                data: List<List<String>>.from(
                  classObject.students.asMap().entries.expand((entry) {
                    final i = entry.key;
                    final student = entry.value;
                    final studentName = fetchStudenDetailsByID(
                      allStudent,
                      student,
                      "name",
                    );
                    final paymentList = fetchPaymentDetails(
                      classObject.ID,
                      student,
                      payments,
                    );
                    bool validStudent =
                        classObject.grade ==
                                fetchStudenDetailsByID(
                                  allStudent,
                                  student,
                                  "grade",
                                )
                            ? true
                            : false;
                    print("$studentName Is normal Student----> $validStudent");
                    if (paymentList.isEmpty) {
                      return [
                        [
                          (i + 1).toString(),
                          studentName,
                          validStudent
                              ? "Unpaid"
                              : "Grade ${fetchStudenDetailsByID(allStudent, student, "grade")}",
                          validStudent
                              ? "Unpaid"
                              : "Grade ${fetchStudenDetailsByID(allStudent, student, "grade")}",
                          validStudent
                              ? "Unpaid"
                              : "Grade ${fetchStudenDetailsByID(allStudent, student, "grade")}",
                        ],
                      ];
                    } else {
                      return paymentList.map(
                        (p) => [
                          (i + 1).toString(),
                          studentName,
                          validStudent
                              ? "${p.collectedDate.toDate().month}/${p.collectedDate.toDate().day} (${p.method})"
                              : "Grade ${fetchStudenDetailsByID(allStudent, student, "grade")}",
                          validStudent
                              ? "${p.month} (${p.reason})"
                              : "Grade ${fetchStudenDetailsByID(allStudent, student, "grade")}",
                          validStudent
                              ? "${p.value}/="
                              : "Grade ${fetchStudenDetailsByID(allStudent, student, "grade")}",
                        ],
                      );
                    }
                  }),
                ),
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
