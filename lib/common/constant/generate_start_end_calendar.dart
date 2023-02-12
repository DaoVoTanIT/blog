import 'package:flutter/foundation.dart';

generateStartEnd(DateTime now) {
  now = DateTime(now.year, now.month, now.day);
  int currentDay = now.weekday;
  var startDatePick1 = now.subtract(Duration(days: currentDay - 1));
  var endDatePick1 = startDatePick1.add(const Duration(days: 6));
  var selectedDay1 = ValueNotifier(DateTime(now.year, now.month, now.day));
  return {
    'start_Date_pick': startDatePick1,
    'end_Date_pick': endDatePick1,
    'selectedDay': selectedDay1,
    'focusedDay': selectedDay1,
  };
}
