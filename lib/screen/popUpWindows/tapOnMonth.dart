import 'package:apk/commonWidget/commonButton.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/allPayment.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final TextEditingController paymentValueController = TextEditingController();

int getValueAsInt(TextEditingController value) {
  int m = 0;
  try {
    m = int.parse(value.text);
    return m;
  } catch (e) {
    // Handle the error if the text cannot be converted to an integer
    print("Error: $e");
    return 0;
  }
}

class tapOnMonth extends StatefulWidget {
  final aPayment paymentObject;
  const tapOnMonth({super.key, required this.paymentObject});
  @override
  State<tapOnMonth> createState() => _tapOnMonthState();
}

class _tapOnMonthState extends State<tapOnMonth> {
  Color tapOnline = AppColors.color2;
  Color tapCash = AppColors.color6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tapOnline = AppColors.color2;
    tapCash = AppColors.color6;
    widget.paymentObject.method = "Cash";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.color2,
      content: SingleChildScrollView(
        //padding: EdgeInsets.all(10.0),
        //height: MediaQuery.of(context).size.height * 0.6,
        //width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Text(
              "${widget.paymentObject.year} - ${widget.paymentObject.month}",
              style: fontStyle.font2,
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.7,
              color: AppColors.color4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Value", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.25,
                  //color: AppColors.color6,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: fontStyle.font4,
                    decoration: InputDecoration(),
                    controller: paymentValueController,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Date", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.35,
                  //color: AppColors.color6,
                  child: DateTimeField(
                    decoration: InputDecoration(
                      // Dark background for the input field
                      labelText:
                          '${widget.paymentObject.collectedDate.toDate().year.toString()}/'
                          '${widget.paymentObject.collectedDate.toDate().month.toString()}/'
                          '${widget.paymentObject.collectedDate.toDate().day.toString()}',
                      labelStyle: fontStyle.font4.copyWith(
                        color: Colors.white,
                      ), // White text color
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 20,
                      ),
                      // White icon
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    onChanged: (DateTime? value) {
                      setState(() {
                        widget.paymentObject.collectedDate = Timestamp.fromDate(
                          value!,
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Reason", style: fontStyle.font4),
                ),
                Container(
                  height: 25,
                  child: Text(":   ", style: fontStyle.font4),
                ),
                //SizedBox(width: 5,),
                Expanded(
                  child: Container(
                    height: 30,
                    child: TextField(
                      style: fontStyle.font4,
                      decoration: InputDecoration(
                        hintText: widget.paymentObject.reason,
                        hintStyle: fontStyle.font4.copyWith(
                          color: Colors.white, // Set hint text color to white
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        widget.paymentObject.reason = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  //color: AppColors.color5,
                  child: Text("Method", style: fontStyle.font4),
                ),
                Container(child: Text(":   ", style: fontStyle.font4)),
                //SizedBox(width: 5,),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.5,
                  //color: AppColors.color6,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapOnline = AppColors.color6;
                            tapCash = AppColors.color2;
                            widget.paymentObject.method = "Online";
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          child: Center(
                            child: Text("Online", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: tapOnline,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapOnline = AppColors.color2;
                            tapCash = AppColors.color6;
                            widget.paymentObject.method = "Cash";
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          child: Center(
                            child: Text("Cash", style: fontStyle.font4),
                          ),
                          decoration: BoxDecoration(
                            color: tapCash,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              children: [
                commonButton.button4(
                  MediaQuery.of(context).size.width * 0.3,
                  "Back",
                  AppColors.color3,
                  () async {
                    print('Tap on Cancel');
                    //tempStudent.setAllNull();
                    Navigator.of(context).pop();
                  },
                  AppColors.color4,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                commonButton.button4(
                  MediaQuery.of(context).size.width * 0.3,
                  "Collect",
                  AppColors.color6,
                  () async {
                    print('Tap on Collect..!');
                    widget.paymentObject.value = getValueAsInt(
                      paymentValueController,
                    );
                    addNewPaymentController(context, widget.paymentObject);
                  },
                  AppColors.color4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
