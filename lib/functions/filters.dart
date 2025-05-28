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
