String formatWeekday(DateTime? dt, String locale) {
  if (dt == null) return '';
  final idx = dt.toLocal().weekday - 1;
  if (locale == 'ko') {
    const labels = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
    return labels[idx];
  }
  const labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  return labels[idx];
}

String formatHours(double hours) {
  return hours == hours.truncateToDouble() ? '${hours.toInt()}h' : '${hours}h';
}
