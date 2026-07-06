import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FrelogDateUtils {
  // DB 저장
  static String toUtcIso(DateTime localTime) {
    return localTime.toUtc().toIso8601String();
  }

  // DB에서 읽을 때
  static DateTime toLocal(String utcString) {
    return DateTime.parse(utcString).toLocal();
  }

  static String formatYearMonth(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'ko'
        ? DateFormat('yyyy년 M월', 'ko').format(date)
        : DateFormat('MMMM yyyy', 'en').format(date);
  }

  static String formatMonthDay(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.MMMMd(locale).format(date);
    // return locale == 'ko' ? '${date.month}월 ${date.day}일' : DateFormat('MMM d', 'en').format(date);
  }

  static String formatWeekday(BuildContext context, int weekday) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'ko') {
      const labels = ['월', '화', '수', '목', '금', '토', '일'];
      return labels[weekday - 1];
    }
    const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return labels[weekday - 1];
  }
}
