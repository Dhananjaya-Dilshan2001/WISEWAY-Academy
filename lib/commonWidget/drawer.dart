import 'package:flutter/material.dart';
import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/screen/welcomePage.dart';

Drawer buildDrawer(BuildContext context) {
  Drawer drawer = Drawer(
    backgroundColor: AppColors.color1,
    child: Column(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(color: AppColors.color1),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.3,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  //color: AppColors.color2,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'Image/wiseway logo.png',
                    ), // Background image
                    fit:
                        BoxFit
                            .contain, // How the image should fit in the container
                  ),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Container(
            child: Icon(
              Icons.feedback_outlined,
              color: AppColors.color4,
              size: 25,
            ),
          ),
          title: Text('Send Feedback', style: fontStyle.font3),
          onTap: () async {
            //await showFeedbackDialog(context);
          },
        ),
        ListTile(
          leading: Container(
            child: Icon(Icons.exit_to_app, color: AppColors.color4, size: 25),
          ),
          title: Text('Exit', style: fontStyle.font3),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => welcomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        ListTile(
          leading: Container(
            child: Icon(Icons.info_outline, color: AppColors.color4, size: 25),
          ),
          title: Text('About us', style: fontStyle.font3),
        ),
        ListTile(
          leading: Container(
            child: Image.asset("Image/fb.png", height: 40, width: 40),
          ),
          title: Text('FaceBook', style: fontStyle.font3),
          onTap: () {
            //launchInWebView(fb);
          },
        ),
        ListTile(
          leading: Container(
            child: Image.asset("Image/insta.png", height: 40, width: 40),
          ),
          title: Text('Instegrame', style: fontStyle.font3),
          onTap: () {
            //launchInWebView(insta);
          },
        ),
        ListTile(
          leading: Container(
            child: Image.asset("Image/linked.png", height: 40, width: 40),
          ),
          title: Text('Linked', style: fontStyle.font3),
          onTap: () {
            //launchInWebView(linked);
          },
        ),
      ],
    ),
  );
  return drawer;
}
