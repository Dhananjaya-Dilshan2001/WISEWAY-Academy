import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/paymentReport.dart';
import 'package:flutter/material.dart';

List<Widget> classListOnPaymentReport = [];

GestureDetector ClassCardOnPaymentReport(BuildContext context, aClass object) {
  return GestureDetector(
    onTap: () async {
      print("Tap On class : ${object.teacher}");
      pdfGenarateController(context, object, commonYear);
    },
    child: Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 0),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: AppColors.color2.withOpacity(0.7),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height * 0.11,
            width: MediaQuery.of(context).size.width * 0.6,
            //color: AppColors.color5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Text("${object.subject}", style: fontStyle.font3),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Text(
                    "${object.curriculm} - G${object.grade}",
                    style: fontStyle.font3,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Text("${object.teacher}", style: fontStyle.font3),
                ),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Container(
            alignment: Alignment.centerRight,
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Icon(
              Icons.download_for_offline,
              color: AppColors.color4,
              size: MediaQuery.of(context).size.width * 0.15,
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> buildClassListOnPaymentReport(
  BuildContext context,
  List<aClass> objects,
) async {
  classListOnPaymentReport = []; // Clear the list before adding new items
  int l = objects.length;
  print("Lenth of array in Build Class List Is $l");

  for (int i = 0; i < l; i++) {
    classListOnPaymentReport.add(SizedBox(height: 5));
    classListOnPaymentReport.add(ClassCardOnPaymentReport(context, objects[i]));
  }
}
