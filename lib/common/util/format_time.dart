// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

enum Format { dMy, mmdy, mdy, dMydMy, my }

mixin FormatTime {
  static String formatTime({required Format format, DateTime? dateTime}) {
    final DateTime now = DateTime.now();
    final DateTime sevenDaysAgo = now.subtract(const Duration(days: 7));
    String formatted;
    DateFormat formatter;
    switch (format) {
      case Format.dMy:
        formatter = DateFormat('dd/MM/yyyy');
        formatted = formatter.format(dateTime ?? now);
        break;
      case Format.mmdy:
        formatter = DateFormat('MMMM dd, yyyy');
        formatted = formatter.format(dateTime ?? now);
        break;
      case Format.mdy:
        formatter = DateFormat('MMM dd, yyyy');
        formatted = formatter.format(dateTime ?? now);
        break;
      case Format.dMydMy:
        if (sevenDaysAgo.year == now.year) {
          formatter = DateFormat('dd MMM yyyy');
          formatted =
              '${DateFormat('dd MMM').format(sevenDaysAgo)} - ${formatter.format(now)}';
        } else {
          formatter = DateFormat('dd MMM yyyy');
          formatted =
              '${formatter.format(sevenDaysAgo)} - ${formatter.format(now)}';
        }
        break;
      case Format.my:
        formatter = DateFormat('MMM, yyyy');
        formatted = formatter.format(dateTime ?? now);
        break;
    }
    return formatted;
  }

  static String convertTime(int duration) {
    final hours = (duration / 3600).truncate().toString().padLeft(2, '0');
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return '$hours:$minutesStr:$secondsStr';
  }

  static timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "năm" : "năm"} trước";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "tháng" : "tháng"} trước";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "tuần" : "tuần"} trước";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "ngày" : "ngày"} trước";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "giờ" : "giờ"} trước";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "phút" : "phút"} trước";
    }
    return 'vừa rồi';
  }
}
