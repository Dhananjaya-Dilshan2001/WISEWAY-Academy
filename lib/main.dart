import 'dart:io';
import 'package:apk/screen/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyB5jWDVqE7Qa88jm6WZjepxlO9o3n30QGY",
          authDomain: "wiseway-academy.firebaseapp.com",
          projectId: "wiseway-academy",
          storageBucket: "wiseway-academy.firebasestorage.app",
          messagingSenderId: "1054709900079",
          appId: "1:1054709900079:web:1610116174a1aa87abf7da",
          measurementId: "G-BZTM0SR1WL",
        ),
      )
      : await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await _requestStoragePermission();
  runApp(const MyApp());
}

Future<void> _requestStoragePermission() async {
  if (!kIsWeb && Platform.isAndroid) {
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const welcomePage(),
    );
  }
}
