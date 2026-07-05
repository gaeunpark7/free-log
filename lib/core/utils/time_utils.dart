class TimeUtils {
  // 시간 > 분
  static int toTotalMinutes(int hours, int minutes) {
    return (hours * 60) + minutes;
  }

  static int toHours(int totalMinutes) => totalMinutes ~/ 60;
  static int toMinutes(int totalMinutes) => totalMinutes % 60;

  //분 > 소수점
  static double toDecimalHours(int totalMinutes) {
    return totalMinutes / 60;
  }

  // 표시용
  static String format(int totalMinutes) {
    final hours = toHours(totalMinutes);
    final minutes = toMinutes(totalMinutes);

    if (hours == 0 && minutes > 0) return '${minutes}M';
    if (minutes == 0) return '${hours}H';

    if (minutes == 0) return '${hours}H';
    return '${hours}H ${minutes}M';
  }
}
