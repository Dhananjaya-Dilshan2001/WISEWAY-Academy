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

class aClass {
  String subject;
  String teacher;
  String grade;
  String whatsappNo;
  String note;
  String curriculm;
  String state;
  String ID;
  String otherInfo;
  aClass({
    required this.subject,
    required this.teacher,
    required this.grade,
    required this.whatsappNo,
    required this.note,
    required this.curriculm,
    required this.state,
    required this.ID,
    required this.otherInfo,
  });
  // Method to convert a Person object to a map
  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'teacher': teacher,
      'grade': grade,
      'whatsappNo': whatsappNo,
      'note': note,
      'curriculm': curriculm,
      'state': state,
      'ID': ID,
      'otherInfo': otherInfo,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'teacher': teacher,
      'grade': grade,
      'whatsappNo': whatsappNo,
      'note': note,
      'curriculm': curriculm,
      'state': state,
      'ID': ID,
      'otherInfo': otherInfo,
    };
  }

  // Method to create a Person object from a map
  factory aClass.fromMap(Map<String, dynamic> map) {
    return aClass(
      subject: map['subject'],
      teacher: map['teacher'],
      grade: map['grade'],
      whatsappNo: map['whatsappNo'],
      note: map['note'],
      curriculm: map['curriculm'],
      state: map['state'],
      ID: map['ID'],
      otherInfo: map['otherInfo'],
    );
  }
  factory aClass.fromJson(Map<String, dynamic> json) {
    return aClass(
      subject: json['subject'],
      teacher: json['teacher'],
      grade: json['grade'],
      whatsappNo: json['whatsappNo'],
      note: json['note'],
      curriculm: json['curriculm'],
      state: json['state'],
      ID: json['ID'],
      otherInfo: json['otherInfo'],
    );
  }
}

aClass nullClassObject() {
  return aClass(
    subject: "",
    teacher: "",
    grade: "",
    whatsappNo: "",
    note: "",
    curriculm: "",
    state: "",
    ID: "",
    otherInfo: "",
  );
}

aStudent nullStudentObject() {
  return aStudent(
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
}
