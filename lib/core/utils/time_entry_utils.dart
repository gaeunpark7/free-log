String formatWeekday(DateTime? dt) {
  if (dt == null) return '';
  const labels = ['월', '화', '수', '목', '금', '토', '일'];
  return '${labels[dt.toLocal().weekday - 1]}요일';
}

String formatHours(double hours) {
  return hours == hours.truncateToDouble() ? '${hours.toInt()}h' : '${hours}h';
}
