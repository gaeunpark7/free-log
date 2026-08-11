import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_handler.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/date_utils.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/calendar/domain/model/calendar_data_model.dart';
import 'package:free_log/features/calendar/presentation/providers/calendar_provider.dart';
import 'package:free_log/features/calendar/presentation/widgets/calendar/calendar_widget.dart';
import 'package:free_log/features/calendar/presentation/widgets/calendar/legend_widget.dart';
import 'package:free_log/features/calendar/presentation/widgets/calendar/summary_card_widget.dart';
import 'package:free_log/features/calendar/presentation/widgets/detail/calendar_detail_widget.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void _prevMonth() {
    final newDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
    if (newDay.isBefore(DateTime(2026))) return;
    _changeMonth(newDay);
  }

  void _nextMonth() {
    final newDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
    if (newDay.isAfter(DateTime(2045, 12))) return;
    _changeMonth(newDay);
  }

  void _changeMonth(DateTime day) {
    setState(() => _focusedDay = day);
    ref.read(calendarNotifierProvider.notifier).changeMonth(day.year, day.month);
  }

  void _showDayDetail(DateTime day) {
    // final data = ref.read(calendarNotifierProvider).valueOrNull ?? {};
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (_) => CalendarDetailWidget(day: day),
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncCalendar = ref.watch(calendarNotifierProvider);

    ref.listen(calendarNotifierProvider, (prev, next) {
      if (next is AsyncError && prev is! AsyncError) {
        ErrorHandler.showSnackBar(context, next.error);
      }
    });
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        title: _buildAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Responsive.screenPadding(context),
          child: Column(
            children: [
              _buildSummaryCard(asyncCalendar),
              const SizedBox(height: 1),
              CalendarWidget(
                focusedDay: _focusedDay,
                selectedDay: _selectedDay ?? DateTime.now(),
                onPageChanged: _changeMonth,
                onDaySelected: _showDayDetail,
                calendarData: asyncCalendar.valueOrNull ?? {},
              ),
              const SizedBox(height: 8),
              const LegendWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(AsyncValue<Map<DateTime, CalendarDataModel>> asyncCalendar) {
    return switch (asyncCalendar) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError() => const SummaryCardWidget(totalHours: 0, totalIncome: 0, totalExpense: 0),
      AsyncData(:final value) => SummaryCardWidget(
        totalHours: value.totalMinutes,
        totalIncome: value.totalIncome,
        totalExpense: value.totalExpense,
      ),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildAppBar() {
    return Builder(
      builder: (context) {
        return Padding(
          padding: Responsive.screenPadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _prevMonth,
                icon: const Icon(Icons.chevron_left, color: Colors.white),
              ),
              Text(
                FrelogDateUtils.formatYearMonth(context, _focusedDay),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: _nextMonth,
                icon: const Icon(Icons.chevron_right, color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
