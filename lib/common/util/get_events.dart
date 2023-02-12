// import 'package:flutter_patient_plus/common/constant/data.dart';
// import 'package:flutter_patient_plus/common/constant/enum.dart';
// import 'package:flutter_patient_plus/common/model/event_model.dart';

// List<EventModel> getEvents(DateTime time) {
//   final Iterable<EventModel> result = listEvents2.where((element) =>
//       element.time.year == time.year &&
//       element.time.month == time.month &&
//       element.time.day == time.day);
//   return result.toList();
// }

// List<EventModel> getPastEvents() {
//   final Iterable<EventModel> result = listEvents2.where((element) =>
//       element.time.isBefore(DateTime.now().subtract(const Duration(days: 1))));
//   return result.toList();
// }

// List<DateTime> getPastEventsDay() {
//   List<DateTime> result = [];
//   for (final event in getPastEvents()) {
//     result.add(DateTime.utc(event.time.year, event.time.month, event.time.day));
//   }
//   result.sort((a, b) => b.compareTo(a));
//   result = result.toSet().toList();
//   return result;
// }

// List<EventModel> getNextEvents() {
//   final Iterable<EventModel> result = listEvents2.where((element) =>
//       element.time.isAfter(DateTime.now().subtract(const Duration(days: 1))));
//   return result.toList();
// }

// List<DateTime> getNextEventsDay() {
//   List<DateTime> result = [];
//   for (final event in getNextEvents()) {
//     result.add(DateTime.utc(event.time.year, event.time.month, event.time.day));
//   }
//   result = result.toSet().toList();
//   return result;
// }

// List<EventModel> getInProgressEvents(DateTime time) {
//   List<EventModel> events = getEvents(time);
//   List<EventModel> result = [];

//   for (final event in events) {
//     if (event.status == StatusType.inProgress) {
//       result.add(event);
//     }
//   }

//   return result;
// }

// List<EventModel> getNotInProgressEvents(DateTime time) {
//   List<EventModel> events = getEvents(time);
//   List<EventModel> result = [];

//   for (final event in events) {
//     if (event.status != StatusType.inProgress) {
//       result.add(event);
//     }
//   }

//   return result;
// }
