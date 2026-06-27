import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/calendar/presentation/widgets/calendar_widget.dart';
import 'package:free_log/features/calendar/presentation/widgets/legend_widget.dart';
import 'package:free_log/features/calendar/presentation/widgets/summary_card_widget.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void _prevMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: AppColors.primary, automaticallyImplyLeading: false, title: _buildAppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: Responsive.screenPadding(context),
          child: Column(
            children: [
              SummaryCardWidget(),
              CalendarWidget(focusedDay: _focusedDay, selectedDay: _selectedDay ?? DateTime.now()),
              SizedBox(height: 8),
              LegendWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: Responsive.screenPadding(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: _prevMonth,
            icon: Icon(Icons.chevron_left, color: Colors.white),
          ),
          Text(
            '${_focusedDay.year}년 ${_focusedDay.month}월',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: _nextMonth,
            icon: Icon(Icons.chevron_right, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
