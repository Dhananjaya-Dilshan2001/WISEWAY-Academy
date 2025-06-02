import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/qrcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future<void> viewCard(BuildContext context, aStudent student) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ), // You can change 20 to any radius you like
        ),
        backgroundColor: AppColors.color1,
        //title: Text('My Card',style: fontStyle.font2,),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.white,
                    child: QrImageView(
                      data: student.ID,
                      version: QrVersions.auto,
                      gapless: true,
                    ),
                  ),
                  IconButton(
                    color: AppColors.color6,

                    onPressed: () {
                      downloadQrImageView(
                        context,
                        student.ID,
                        "${student.ID} - ${student.name}",
                      );
                    },
                    icon: Icon(Icons.download, color: AppColors.color4),
                    iconSize: 30,
                  ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  //width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.3,
                  //color: Colors.white10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${student.ID}",
                        style: fontStyle.font3.copyWith(fontSize: 15),
                      ),
                      Text(
                        student.name,
                        style: fontStyle.font3.copyWith(fontSize: 15),
                      ),
                      Text(
                        "${student.grade} - ${student.curriculm}",
                        style: fontStyle.font3.copyWith(fontSize: 15),
                      ),
                      Text(
                        "${student.school}",
                        style: fontStyle.font3.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
