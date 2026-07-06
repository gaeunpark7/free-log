import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/date_utils.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/features/calendar/domain/model/calendar_detail_model.dart';
import 'package:free_log/features/calendar/presentation/providers/calendar_provider.dart';
import 'package:free_log/features/calendar/presentation/widgets/detail/entry_row.dart';
import 'package:free_log/features/calendar/presentation/widgets/detail/section_header.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDetailWidget extends ConsumerWidget {
  final DateTime day;

  const CalendarDetailWidget({super.key, required this.day});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateOnly = DateTime(day.year, day.month, day.day);
    final dayData = ref.watch(calendarNotifierProvider).valueOrNull?[dateOnly];

    final hasData =
        dayData != null &&
        (dayData.timeEntries.isNotEmpty ||
            dayData.incomes.isNotEmpty ||
            dayData.expenses.isNotEmpty);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHandle(),
            const SizedBox(height: 8),
            _buildTitle(context),
            Divider(color: AppColors.borderDefault),
            if (!hasData)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    AppLocalizations.of(context)!.noRecord,
                    style: AppTextStyles.caption(context),
                  ),
                ),
              )
            else ...[
              if (dayData.timeEntries.isNotEmpty) _buildWorkSection(context, dayData.timeEntries),
              if (dayData.incomes.isNotEmpty) ...[
                if (dayData.timeEntries.isNotEmpty) const Divider(color: AppColors.borderDefault),
                _buildIncomeSection(context, dayData.incomes),
              ],
              if (dayData.expenses.isNotEmpty) ...[
                if (dayData.timeEntries.isNotEmpty || dayData.incomes.isNotEmpty)
                  const Divider(color: AppColors.borderDefault),
                _buildExpenseSection(context, dayData.expenses),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: Container(
          width: 45,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
      child: Row(
        children: [
          Text(
            FrelogDateUtils.formatMonthDay(context, day),
            style: AppTextStyles.title(context).copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(width: 8),
          if (isSameDay(day, DateTime.now()))
            Text(
              AppLocalizations.of(context)!.today,
              style: AppTextStyles.caption(context).copyWith(color: AppColors.primary),
            ),
        ],
      ),
    );
  }

  //작업 섹션
  Widget _buildWorkSection(BuildContext context, List<TimeEntryDetail> entries) {
    final totalMiniutes = entries.fold(0, (sum, e) => sum + e.totalMinutes);
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: Icons.access_time,
            label: AppLocalizations.of(context)!.timeEntryTitle,
            rightText: TimeUtils.format(totalMiniutes),
            color: AppColors.textPrimary,
          ),
          const SizedBox(height: 8),
          ...entries.map((e) => _workEntryRow(context, e)),
        ],
      ),
    );
  }

  //수입 섹션
  Widget _buildIncomeSection(BuildContext context, List<IncomeDetail> incomes) {
    final total = incomes.fold(0, (sum, i) => sum + i.amount);
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: Icons.savings_outlined,
            label: AppLocalizations.of(context)!.paymentReceived,
            rightText: '+₩${_formatAmount(total)}',
            color: AppColors.success,
          ),
          const SizedBox(height: 6),
          ...incomes.map(
            (income) => EntryRow(
              description: income.description,
              projectName: income.projectName,
              amount: '+${_formatAmount(income.amount)}',
              amountColor: AppColors.success,
            ),
          ),
        ],
      ),
    );
  }

  //지출 섹션
  Widget _buildExpenseSection(BuildContext context, List<ExpenseDetail> expenses) {
    final total = expenses.fold(0, (sum, e) => sum + e.amount);
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: Icons.payment,
            label: AppLocalizations.of(context)!.costDetails,
            rightText: '-₩${_formatAmount(total)}',
            color: AppColors.error,
          ),
          const SizedBox(height: 6),
          ...expenses.map(
            (expense) => EntryRow(
              description: expense.description,
              projectName: expense.projectName,
              amount: '-${_formatAmount(expense.amount)}',
              amountColor: AppColors.error,
            ),
          ),
        ],
      ),
    );
  }

  //작업 row
  Widget _workEntryRow(BuildContext context, TimeEntryDetail entry) {
    return Row(
      children: [
        Text(entry.projectName, style: AppTextStyles.bodyBold(context)),
        Spacer(),
        Text(TimeUtils.format(entry.totalMinutes), style: AppTextStyles.subTitleBold(context)),
      ],
    );
  }

  String _formatAmount(int amount) => NumberFormat('#,###').format(amount);

  // String _weekdayLabel(int weekday, String locale) {
  //   final idx = weekday - 1;
  //   if (locale == 'ko') {
  //     const labels = ['월', '화', '수', '목', '금', '토', '일'];
  //     return labels[idx];
  //   }
  //   const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  //   return labels[idx];
  // }
}
