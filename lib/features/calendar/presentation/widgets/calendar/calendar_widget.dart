import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/features/calendar/domain/model/calendar_data_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onPageChanged,
    this.onDaySelected,
    required this.calendarData,
  });
  final DateTime focusedDay;
  final DateTime selectedDay;
  final Map<DateTime, CalendarDataModel> calendarData;
  final void Function(DateTime) onPageChanged;
  final void Function(DateTime)? onDaySelected;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return Container(
      decoration: const BoxDecoration(color: AppColors.background),
      child: TableCalendar(
        locale: locale,
        headerVisible: false,
        rowHeight: 95.h,
        firstDay: DateTime(2026),
        lastDay: DateTime(2045),
        focusedDay: widget.focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        daysOfWeekHeight: 25,
        availableGestures: AvailableGestures.horizontalSwipe,
        //월 이동
        onPageChanged: (focusedDay) {
          widget.onPageChanged(focusedDay);
        },

        //날짜 선택
        onDaySelected: (selectedDay, focusedDay) {
          setState(() => _selectedDay = selectedDay);
          widget.onDaySelected?.call(selectedDay);
        },

        //header style
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false, //2주 월 버튼 제거
          titleTextStyle: AppTextStyles.subTitleBold(context),
          leftChevronIcon: const Icon(
            Icons.chevron_left,
            color: AppColors.textPrimary,
          ),
          rightChevronIcon: const Icon(
            Icons.chevron_right,
            color: AppColors.textPrimary,
          ),
        ),

        calendarStyle: CalendarStyle(
          // cellMargin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          //오늘 날짜
          todayDecoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          todayTextStyle: AppTextStyles.bodyBold(
            context,
          ).copyWith(color: AppColors.primaryDark),
          //선택 된 날짜
          selectedDecoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          selectedTextStyle: AppTextStyles.body(
            context,
          ).copyWith(color: Colors.white),
          //주말 색상
          weekendTextStyle: AppTextStyles.body(
            context,
          ).copyWith(color: AppColors.errorSoft),
          outsideDaysVisible: false, // 다른 달 날짜 숨기기
        ),

        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) =>
              _buildDayCell(day, false, false),
          todayBuilder: (context, day, focusedDay) =>
              _buildDayCell(day, false, true),
          selectedBuilder: (context, day, focusedDay) =>
              _buildDayCell(day, true, false),
          // outsideBuilder: (context, day, focusedDay) => const SizedBox(),
        ),
      ),
    );
  }

  Widget _buildDayCell(DateTime day, bool isSelected, bool isToday) {
    final dateOnly = DateTime(day.year, day.month, day.day);
    final data = widget.calendarData[dateOnly];
    // final cellWidth = Responsive.calendarCellWidth(context);
    return SizedBox(
      height: 90.h,
      width: 50.w,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primarySoft : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : isToday
                ? AppColors.primaryDark
                : AppColors.borderDefault,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            // 날짜 숫자
            Text(
              '${day.day}',
              style: AppTextStyles.captionBold(context).copyWith(
                color: isSelected || isToday
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
            ),
            // SizedBox(height: 2),
            if (data != null) ...[
              if (data.minutes > 0)
                Text(
                  '+${TimeUtils.format(data.minutes)}',
                  style: AppTextStyles.calendarBody(context),
                ),
              if (data.income > 0)
                Text(
                  '+${_formatShort(data.income)}',
                  style: AppTextStyles.calendarBody(
                    context,
                  ).copyWith(color: AppColors.success),
                ),
              if (data.expense > 0)
                Text(
                  '-${_formatShort(data.expense)}',
                  style: AppTextStyles.calendarBody(
                    context,
                  ).copyWith(color: AppColors.error),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

String _formatShort(int amount) {
  if (amount >= 1000000) return '${(amount / 1000000).toStringAsFixed(1)}m';
  if (amount >= 1000) return '${(amount / 1000).toStringAsFixed(0)}k';
  return '$amount';
}
