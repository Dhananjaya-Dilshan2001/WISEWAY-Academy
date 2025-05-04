import 'package:flutter/material.dart';

class commonComponent {
  //button1
  GestureDetector button1(
    double w,
    String t,
    Color c,
    VoidCallback ontap,
    Color fColor,
  ) {
    GestureDetector b = GestureDetector(
      onTap: ontap,
      child: Container(
        width: w,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0, // Left padding
            right: 20.0, // Right padding
            top: 10.0, // Top padding
            bottom: 10.0, // Bottom padding
          ),
          child: Center(
            child: Text(
              "$t",
              style: TextStyle(
                color: fColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSansSinhala',
                fontSize: 17,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: c, // Set the background color of the container
          borderRadius: BorderRadius.circular(8.0), // Set the corner radius
        ),
      ),
    );
    return b;
  }

  //button2 - con and text in line
  GestureDetector button2(
    double h,
    double w,
    String t,
    Color c,
    VoidCallback ontap,
    Color fColor,
    IconData icon,
  ) {
    GestureDetector b = GestureDetector(
      onTap: ontap,
      child: Container(
        width: w,
        height: h,
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.1, // Left padding
            right: w * 0.1, // Right padding
            top: 10.0, // Top padding
            bottom: 10.0, // Bottom padding
          ),
          child: Row(
            children: [
              FittedBox(child: Icon(size: w * 0.3, icon, color: Colors.white)),
              SizedBox(width: w * 0.05),
              Text(
                t,
                style: TextStyle(
                  color: fColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansSinhala',
                  fontSize: w * 0.1,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: c, // Set the background color of the container
          borderRadius: BorderRadius.circular(8.0), // Set the corner radius
        ),
      ),
    );
    return b;
  }

  //button3 - Button contain Icona and name
  GestureDetector button3(
    double h,
    double w,
    String t,
    Color c,
    VoidCallback ontap,
    Color fColor,
    IconData icon,
  ) {
    GestureDetector b = GestureDetector(
      onTap: ontap,
      child: Container(
        width: w,
        height: h,
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.1, // Left padding
            right: w * 0.1, // Right padding
            top: w * 0.1, // Top padding
            bottom: 0, // Bottom padding
          ),
          child: Column(
            children: [
              FittedBox(child: Icon(size: w * 0.5, icon, color: Colors.white)),
              SizedBox(width: w * 0.1),
              Text(
                "$t",
                style: TextStyle(
                  color: fColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansSinhala',
                  fontSize: w * 0.13,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: c, // Set the background color of the container
          borderRadius: BorderRadius.circular(8.0), // Set the corner radius
        ),
      ),
    );
    return b;
  }

  //button5 - Icon Only butoon
  GestureDetector button5(
    double h,
    double w,
    Color c,
    VoidCallback ontap,
    Color fColor,
    String img,
  ) {
    GestureDetector b = GestureDetector(
      onTap: ontap,
      child: Container(
        width: w,
        height: h,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0, // Left padding
            right: 10.0, // Right padding
            top: 5.0, // Top padding
            bottom: 5.0, // Bottom padding
          ),
          child: Column(
            children: [Container(width: w * 0.9, child: Image.asset("$img"))],
          ),
        ),
        decoration: BoxDecoration(
          color: c, // Set the background color of the container
          borderRadius: BorderRadius.circular(8.0), // Set the corner radius
        ),
      ),
    );
    return b;
  }

  //button4
  GestureDetector button4(
    double w,
    String t,
    Color c,
    VoidCallback ontap,
    Color fColor,
  ) {
    GestureDetector b = GestureDetector(
      onTap: ontap,
      child: Container(
        width: w,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0, // Left padding
            right: 10.0, // Right padding
            top: 5.0, // Top padding
            bottom: 5.0, // Bottom padding
          ),
          child: Center(
            child: Text(
              "$t",
              style: TextStyle(
                color: fColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSansSinhala',
                fontSize: 17,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: c, // Set the background color of the container
          borderRadius: BorderRadius.circular(8.0), // Set the corner radius
        ),
      ),
    );
    return b;
  }

  //button6 - icon and text in line and text small size
  GestureDetector button6(
    double h,
    double w,
    String t,
    Color c,
    VoidCallback ontap,
    Color fColor,
    String img,
  ) {
    GestureDetector b = GestureDetector(
      onTap: ontap,
      child: Container(
        width: w,
        height: h,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0, // Left padding
            right: 10.0, // Right padding
            top: 5.0, // Top padding
            bottom: 5.0, // Bottom padding
          ),
          child: Row(
            children: [
              Image.asset("$img"),
              SizedBox(width: 5),
              Text(
                "$t",
                style: TextStyle(
                  color: fColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansSinhala',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: c, // Set the background color of the container
          borderRadius: BorderRadius.circular(5.0), // Set the corner radius
        ),
      ),
    );
    return b;
  }
}

commonComponent commonButton = new commonComponent();
