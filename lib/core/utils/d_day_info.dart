enum DDayStatus { overdue, today, near, safe }

class DDayInfo {
  final int daysLeft;
  final DDayStatus status;
  final String label;

  DDayInfo._(this.daysLeft, this.status, this.label);

  factory DDayInfo.from(DateTime deadline) {
    final today = DateTime.now();
    final t = DateTime(today.year, today.month, today.day);
    final d = DateTime(deadline.year, deadline.month, deadline.day);
    final days = d.difference(t).inDays;

    if (days < 0) {
      return DDayInfo._(days, DDayStatus.overdue, 'D+${-days}');
    } else if (days == 0) {
      return DDayInfo._(0, DDayStatus.today, 'D-DAY');
    } else if (days <= 3) {
      return DDayInfo._(days, DDayStatus.near, 'D-$days');
    } else {
      return DDayInfo._(days, DDayStatus.safe, 'D-$days');
    }
  }
}
