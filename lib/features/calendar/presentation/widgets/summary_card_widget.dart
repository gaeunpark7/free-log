import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';

class SummaryCardWidget extends StatelessWidget {
  final double totalHours;
  final int totalIncome;
  final int totalExpense;
  const SummaryCardWidget({
    super.key,
    required this.totalHours,
    required this.totalIncome,
    required this.totalExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Responsive.cardPadding(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryItem(context, '${totalHours}h', '작업시간', AppColors.primaryDark),
          _buildDivider(),
          _buildSummaryItem(context, '+$totalIncome', '받은 수익', AppColors.success),
          _buildDivider(),
          _buildSummaryItem(context, '-$totalExpense', '재료비', AppColors.error),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(BuildContext context, String value, String label, Color color) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.title(context).copyWith(color: color)),
        SizedBox(height: 4),
        Text(label, style: AppTextStyles.caption(context)),
      ],
    );
  }

  Widget _buildDivider() => Container(height: 40, width: 1, color: AppColors.borderDefault);
}
