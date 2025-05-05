import 'package:apk/commonWidget/font&color.dart';
import 'package:flutter/material.dart';

class viewAllStudent extends StatefulWidget {
  final String title;
  final List<Widget> list;
  const viewAllStudent({super.key, required this.title, required this.list});
  @override
  _viewAllStudentState createState() => _viewAllStudentState();
}

class _viewAllStudentState extends State<viewAllStudent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.color2,
      content: Container(
        //padding: EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: Column(
                children: [
                  Text("${widget.title}", style: fontStyle.font2),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: AppColors.color4,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: AppColors.color5,
              child: ListView(children: widget.list),
            ),
          ],
        ),
      ),
    );
  }
}
