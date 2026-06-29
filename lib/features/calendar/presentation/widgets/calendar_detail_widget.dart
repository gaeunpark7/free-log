import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/features/calendar/domain/model/calendar_data_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDetailWidget extends StatelessWidget {
  final DateTime day;
  final Map<DateTime, CalendarDataModel> calendarData;
  const CalendarDetailWidget({super.key, required this.day, required this.calendarData});

  @override
  Widget build(BuildContext context) {
    final dateOnly = DateTime(day.year, day.month, day.day);
    final dayData = calendarData[dateOnly];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(),
            const SizedBox(height: 16),
            _buildTitle(context),
            const SizedBox(height: 16),

            if (dayData == null)
              Center(child: Text('기록이 없어요', style: AppTextStyles.caption(context)))
            else ...[
              if (dayData.hours > 0) ...[
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(
                      '작업 ${dayData.hours}h',
                      style: AppTextStyles.bodyBold(context).copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Center _buildHandle() {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Row _buildTitle(BuildContext context) {
    return Row(
      children: [
        Text(
          '${day.month}월 ${day.day}일 (${_weekdayLabel(day.weekday)})',
          style: AppTextStyles.subTitleBold(context),
        ),
        const SizedBox(width: 8),
        if (isSameDay(day, DateTime.now()))
          Text('오늘', style: AppTextStyles.caption(context).copyWith(color: AppColors.primary)),
      ],
    );
  }
}

String _weekdayLabel(int weekday) {
  const labels = ['월', '화', '수', '목', '금', '토', '일'];
  return labels[weekday - 1];
}
