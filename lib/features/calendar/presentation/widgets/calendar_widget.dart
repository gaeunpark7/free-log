import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  DateTime focusedDay;
  DateTime selectedDay;
  CalendarWidget({super.key, required this.focusedDay, required this.selectedDay});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.background),
      child: TableCalendar(
        headerVisible: false,
        rowHeight: 100, //셀 크기 키우기
        firstDay: DateTime(2026),
        lastDay: DateTime(2045),
        focusedDay: widget.focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(widget.selectedDay, day);
        },
        daysOfWeekHeight: 40,
        // locale: 'ko_KR',

        //월 이동
        onPageChanged: (focusedDay) {
          setState(() {
            widget.focusedDay = focusedDay;
          });
        },

        //날짜 선택
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            widget.focusedDay = focusedDay;
            widget.selectedDay = selectedDay;
          });
        },

        //header style
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false, //2주 월 버튼 제거
          titleTextStyle: AppTextStyles.subTitleBold(context),
          leftChevronIcon: Icon(Icons.chevron_left, color: AppColors.textPrimary),
          rightChevronIcon: Icon(Icons.chevron_right, color: AppColors.textPrimary),
        ),

        calendarStyle: CalendarStyle(
          // cellMargin: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
          //오늘 날짜
          todayDecoration: BoxDecoration(color: AppColors.primary.withOpacity(0.2), shape: BoxShape.circle),
          todayTextStyle: AppTextStyles.bodyBold(context).copyWith(color: AppColors.primaryDark),
          //선택 된 날짜
          selectedDecoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(8)),
          selectedTextStyle: AppTextStyles.body(context).copyWith(color: Colors.white),
          //주말 색상
          weekendTextStyle: AppTextStyles.body(context).copyWith(color: AppColors.errorSoft),
          outsideDaysVisible: false, // 다른 달 날짜 숨기기
        ),

        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) => _buildDayCell(day, false),
          todayBuilder: (context, day, focusedDay) => _buildDayCell(day, false),
          selectedBuilder: (context, day, focusedDay) => _buildDayCell(day, true),
          // outsideBuilder: (context, day, focusedDay) => const SizedBox(),
        ),
      ),
    );
  }

  Widget _buildDayCell(DateTime day, bool isSelected) {
    return SizedBox(
      height: 110,
      width: 110,
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primarySoft
              // : isToday
              // ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.borderDefault),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            // 날짜 숫자
            Text('${day.day}', style: AppTextStyles.captionBold(context).copyWith(color: isSelected ? AppColors.textPrimary : AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
