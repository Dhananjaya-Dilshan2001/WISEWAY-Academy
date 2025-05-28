import 'package:apk/dataModel/model.dart';

List<aPayment> filterPaymentAccordingToDay(
  List<aPayment> allPayment,
  int day,
  String year,
) {
  return allPayment.where((payment) {
    // Assuming collectedDate is a Timestamp (from cloud_firestore)
    final date = payment.collectedDate.toDate();
    return date.day == day;
  }).toList();
}

List<aClass> filterClassByGrade(List<aClass> allClasses, String grade) {
  return allClasses.where((classItem) {
    return classItem.grade == grade;
  }).toList();
}

List<aClass> filterClassByType(List<aClass> allClasses, String type) {
  return allClasses.where((classItem) {
    return classItem.otherInfo == type;
  }).toList();
}
