import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/providers/expense_provider.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:intl/intl.dart';

class CalculateAmount extends ConsumerWidget {
  final ProjectModel project;

  const CalculateAmount({super.key, required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTimeEntries = ref.watch(timeEntryNotifierProvider(project.id!));
    final asyncExpense = ref.watch(expenseNotifierProvider(project.id!));

    final totalHours = asyncTimeEntries.maybeWhen(data: (entries) => entries.fold<double>(0, (sum, e) => sum + e.hours), orElse: () => 0.0);
    final totalExpense = asyncExpense.maybeWhen(data: (expense) => expense.fold<double>(0, (sum, e) => sum + e.amount), orElse: () => 0.0);
    final laborCost = project.hourlyRate * totalHours;
    final totalCost = laborCost + totalExpense;
    final marginRate = project.marginRate;
    final sellingPrice = totalCost * (1 + marginRate);

    return Container(
      width: double.infinity,
      padding: Responsive.cardPadding(context),
      decoration: BoxDecoration(
        color: AppColors.surfaceTint,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('금액 산출', style: AppTextStyles.subTitleBold(context).copyWith(color: AppColors.textSecondary)),
          Divider(thickness: 0.5, color: AppColors.textTertiary),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('시급 X 시간', style: AppTextStyles.subTitle(context).copyWith(color: AppColors.textSecondary)),
              Text('₩${NumberFormat('#,###').format(laborCost.floor())}', style: AppTextStyles.subTitleBold(context).copyWith(color: AppColors.textSecondary)),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('원가 내역', style: AppTextStyles.subTitle(context).copyWith(color: AppColors.textSecondary)),
              Text('₩${NumberFormat('#,###').format(totalExpense.floor())}', style: AppTextStyles.subTitleBold(context).copyWith(color: AppColors.textSecondary)),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('마진 (${(marginRate * 100).floor()}%)', style: AppTextStyles.subTitle(context).copyWith(color: AppColors.textSecondary)),
              Text('+₩${NumberFormat('#,###').format((totalCost * marginRate).floor())}', style: AppTextStyles.subTitleBold(context).copyWith(color: AppColors.textSecondary)),
            ],
          ),
          SizedBox(height: 6),
          Divider(thickness: 0.5, color: AppColors.textTertiary),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('판매가', style: AppTextStyles.subTitle(context).copyWith(color: AppColors.textSecondary)),
              Text('₩${NumberFormat('#,###').format(sellingPrice.floor())}', style: AppTextStyles.title(context).copyWith(color: AppColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}
