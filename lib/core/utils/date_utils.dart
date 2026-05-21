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

  // 화면 표시용 - 한국: 2025년 4월 20일 / 영어: Apr 20, 2025)
  static String formatDate(DateTime dt, String locale) {
    final format = locale == 'ko'
        ? DateFormat('yyyy년 MM월 dd일', 'ko')
        : DateFormat('MMM dd, yyyy', 'en');
    return format.format(dt.toLocal());
  }

  // D-day 계산
  static int dDay(DateTime deadline) {
    final now = DateTime.now();
    return deadline.toLocal().difference(now).inDays;
  }
}
