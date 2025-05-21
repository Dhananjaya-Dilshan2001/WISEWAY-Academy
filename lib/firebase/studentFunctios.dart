import 'package:apk/commonWidget/font&color.dart';
import 'package:apk/dataModel/model.dart';
import 'package:apk/functions/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addNewStudent(BuildContext context, aStudent newStudent) async {
  List<aStudent> dummyIssue = [newStudent];
  try {
    List<Map<String, dynamic>> m =
        dummyIssue.map((dummyMember) => dummyMember.toMap()).toList();
    DocumentReference documentRef = _firestore
        .collection('WISEWAY Academy')
        .doc("students");
    await documentRef.update({'students': FieldValue.arrayUnion(m)});

    if (context.mounted) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.color5,
          content: Row(
            children: [
              Icon(Icons.check, color: AppColors.color4),
              SizedBox(width: 10),
              Text(
                "Register a new student successfully..!",
                style: fontStyle.font3,
              ),
            ],
          ),
          duration: Duration(seconds: 4),
        ),
      );
    }
  } on FirebaseException catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.color6,
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Icon(Icons.warning_amber, color: AppColors.color3),
                SizedBox(width: 10),
                Text('Error: ${e.message}'),
              ],
            ),
          ),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}

Future<void> getAllStudent(BuildContext context) async {
  allStudent = [];
  DocumentSnapshot documentSnapshot =
      await _firestore.collection('WISEWAY Academy').doc("students").get();
  if (documentSnapshot.exists) {
    List<dynamic> customObjectsJson = documentSnapshot['students'];
    allStudent =
        customObjectsJson.map((json) => aStudent.fromJson(json)).toList();
    print('Retrieved array:');
  } else {
    print('Document does not exist');
  }
}

Future<void> updateStudent(
  BuildContext context,
  aStudent updatedStudent,
) async {
  try {
    DocumentReference documentRef = _firestore
        .collection('WISEWAY Academy')
        .doc("students");

    // Get current students array
    DocumentSnapshot docSnapshot = await documentRef.get();
    if (!docSnapshot.exists) {
      throw Exception("Students document does not exist");
    }

    List<dynamic> students = List.from(docSnapshot['students'] ?? []);
    int index = students.indexWhere(
      (student) => student['ID'] == updatedStudent.ID,
    );

    if (index == -1) {
      throw Exception("Student with ID ${updatedStudent.ID} not found");
    }

    // Update the student at the found index
    students[index] = updatedStudent.toMap();

    await documentRef.update({'students': students});

    if (context.mounted) {
      print("Update student successfully..!");
    }
  } catch (e) {
    if (context.mounted) {
      print("Error come when update student $e");
    }
  }
}
