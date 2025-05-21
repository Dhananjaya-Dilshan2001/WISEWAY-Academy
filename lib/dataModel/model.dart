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
  Timestamp registeredDate;
  List<String> classID;
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
    required this.registeredDate,
    required this.classID,
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
      'registeredDate': registeredDate,
      'classID': classID,
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
      'registeredDate': registeredDate,
      'classID': classID,
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
      registeredDate: map['registeredDate'],
      classID: List<String>.from(map['classID']),
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
      registeredDate: json['registeredDate'],
      classID: List<String>.from(json['classID']),
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
  Timestamp registeredDate;
  List<String> students;
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
    required this.registeredDate,
    required this.students,
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
      'registeredDate': registeredDate,
      'students': students,
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
      'registeredDate': registeredDate,
      'students': students,
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
      registeredDate: map['registeredDate'],
      students: List<String>.from(map['students']),
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
      registeredDate: json['registeredDate'],
      students: List<String>.from(json['students']),
    );
  }
}

class aDay {
  String time;
  String classID;
  Timestamp date;
  List<String> students;
  String otherInfo;
  String state;
  aDay({
    required this.time,
    required this.classID,
    required this.date,
    required this.students,
    required this.otherInfo,
    required this.state,
  });
  // Method to convert a Day object to a map
  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'classID': classID,
      'date': date,
      'students': students,
      'otherInfo': otherInfo,
      'state': state,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'classID': classID,
      'date': date,
      'students': students,
      'otherInfo': otherInfo,
      'state': state,
    };
  }

  // Method to create a Day object from a map
  factory aDay.fromMap(Map<String, dynamic> map) {
    return aDay(
      time: map['time'],
      classID: map['classID'],
      date: map['date'],
      students: List<String>.from(map['students']),
      otherInfo: map['otherInfo'],
      state: map['state'],
    );
  }
  factory aDay.fromJson(Map<String, dynamic> json) {
    return aDay(
      time: json['time'],
      classID: json['classID'],
      date: json['date'],
      students: List<String>.from(json['students']),
      otherInfo: json['otherInfo'],
      state: json['state'],
    );
  }
}

class aPayment {
  String year;
  String month;
  String classID;
  String studentID;
  int value;
  Timestamp collectedDate;
  String reason;
  String method;
  aPayment({
    required this.year,
    required this.month,
    required this.classID,
    required this.studentID,
    required this.value,
    required this.collectedDate,
    required this.reason,
    required this.method,
  });
  // Method to convert a Day object to a map
  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'month': month,
      'classID': classID,
      'studentID': studentID,
      'value': value,
      'collectedDate': collectedDate,
      'reason': reason,
      'method': method,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
      'classID': classID,
      'studentID': studentID,
      'value': value,
      'collectedDate': collectedDate,
      'reason': reason,
      'method': method,
    };
  }

  // Method to create a Day object from a map
  factory aPayment.fromMap(Map<String, dynamic> map) {
    return aPayment(
      year: map['year'],
      month: map['month'],
      classID: map['classID'],
      studentID: map['studentID'],
      value: map['value'],
      collectedDate: map['collectedDate'],
      reason: map['reason'],
      method: map['method'],
    );
  }
  factory aPayment.fromJson(Map<String, dynamic> json) {
    return aPayment(
      year: json['year'],
      month: json['month'],
      classID: json['classID'],
      studentID: json['studentID'],
      value: json['value'],
      collectedDate: json['collectedDate'],
      reason: json['reason'],
      method: json['method'],
    );
  }
}

class aMonth {
  String name;
  String classID;
  List<String> paidStudents;
  List<String> unpaidStudents;
  List<aDay> attendance;
  String otherInfo;
  aMonth({
    required this.name,
    required this.classID,
    required this.paidStudents,
    required this.unpaidStudents,
    required this.attendance,
    required this.otherInfo,
  });
  // Method to convert a Month object to a map
  Map<String, dynamic> toMap() {
    return {
      'classID': classID,
      'paidStudents': paidStudents,
      'unpaidStudents': unpaidStudents,
      'attendance': attendance.map((day) => day.toMap()).toList(),
      'otherInfo': otherInfo,
      'name': name,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'classID': classID,
      'paidStudents': paidStudents,
      'unpaidStudents': unpaidStudents,
      'attendance':
          attendance
              .map((day) => day.toJson())
              .toList(), // Serialize each aDay object
      'otherInfo': otherInfo,
    };
  }

  // Method to create a Day object from a map
  factory aMonth.fromMap(Map<String, dynamic> map) {
    return aMonth(
      name: map['name'],
      classID: map['classID'],
      paidStudents: List<String>.from(map['paidStudents']),
      unpaidStudents: List<String>.from(map['unpaidStudents']),
      attendance:
          (map['attendance'] as List<dynamic>)
              .map((paperMap) => aDay.fromMap(paperMap))
              .toList(),
      otherInfo: map['otherInfo'],
    );
  }
  factory aMonth.fromJson(Map<String, dynamic> json) {
    return aMonth(
      name: json['name'],
      classID: json['classID'],
      paidStudents: List<String>.from(json['paidStudents']),
      unpaidStudents: List<String>.from(json['unpaidStudents']),
      attendance:
          (json['attendance'] as List<dynamic>)
              .map((paperJson) => aDay.fromJson(paperJson))
              .toList(),
      otherInfo: json['otherInfo'],
    );
  }
}

aDay nullDayObject() {
  return aDay(
    time: "",
    classID: "",
    date: Timestamp.now(),
    students: [],
    otherInfo: "",
    state: "",
  );
}

aMonth nullMonthObject() {
  return aMonth(
    name: "",
    classID: "",
    paidStudents: [],
    unpaidStudents: [],
    attendance: [],
    otherInfo: "",
  );
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
    registeredDate: Timestamp.now(),
    students: [],
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
    registeredDate: Timestamp.now(),
    classID: [],
    otherInfo: "",
  );
}
