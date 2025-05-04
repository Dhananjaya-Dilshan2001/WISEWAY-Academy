import 'package:cloud_firestore/cloud_firestore.dart';

class aStudent {
  String name;
  String school;
  String grade;
  String whatsappNo;
  String parentNo;
  String gender;
  String institute;
  String curriculm;
  String state;
  String ID;
  Timestamp birthDay;
  String otherInfo;
  aStudent({
    required this.name,
    required this.school,
    required this.grade,
    required this.whatsappNo,
    required this.parentNo,
    required this.gender,
    required this.institute,
    required this.curriculm,
    required this.state,
    required this.ID,
    required this.birthDay,
    required this.otherInfo,
  });
  // Method to convert a Person object to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'school': school,
      'grade': grade,
      'whatsappNo': whatsappNo,
      'parentNo': parentNo,
      'gender': gender,
      'institute': institute,
      'curriculm': curriculm,
      'state': state,
      'ID': ID,
      'birthDay': birthDay,
      'otherInfo': otherInfo,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'school': school,
      'grade': grade,
      'whatsappNo': whatsappNo,
      'parentNo': parentNo,
      'gender': gender,
      'institute': institute,
      'curriculm': curriculm,
      'state': state,
      'ID': ID,
      'birthDay': birthDay,
      'otherInfo': otherInfo,
    };
  }

  // Method to create a Person object from a map
  factory aStudent.fromMap(Map<String, dynamic> map) {
    return aStudent(
      name: map['name'],
      school: map['school'],
      grade: map['grade'],
      whatsappNo: map['whatsappNo'],
      parentNo: map['parentNo'],
      gender: map['gender'],
      institute: map['institute'],
      curriculm: map['curriculm'],
      state: map['state'],
      ID: map['ID'],
      birthDay: map['birthDay'],
      otherInfo: map['otherInfo'],
    );
  }
  factory aStudent.fromJson(Map<String, dynamic> json) {
    return aStudent(
      name: json['name'],
      school: json['school'],
      grade: json['grade'],
      whatsappNo: json['whatsappNo'],
      parentNo: json['parentNo'],
      gender: json['gender'],
      institute: json['institute'],
      curriculm: json['curriculm'],
      state: json['state'],
      ID: json['ID'],
      birthDay: json['birthDay'],
      otherInfo: json['otherInfo'],
    );
  }
}

aStudent tempStudent = aStudent(
  name: "",
  school: "",
  grade: "",
  whatsappNo: "",
  parentNo: "",
  gender: "",
  institute: "",
  curriculm: "",
  state: "",
  ID: "",
  birthDay: Timestamp.now(),
  otherInfo: "",
);
