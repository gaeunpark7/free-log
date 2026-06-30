import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/utils/time_entry_utils.dart';

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
          _buildSummaryItem(context, formatHours(totalHours), '작업시간', AppColors.primaryDark),
          _buildDivider(),
          _buildSummaryItem(context, '+${_formatShort(totalIncome)}', '받은 수익', AppColors.success),
          _buildDivider(),
          _buildSummaryItem(context, '-${_formatShort(totalExpense)}', '지출', AppColors.error),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(BuildContext context, String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.title(
            context,
          ).copyWith(color: color, overflow: TextOverflow.ellipsis),
        ),
        SizedBox(height: 4),
        Text(label, style: AppTextStyles.caption(context)),
      ],
    );
  }

  Widget _buildDivider() => Container(height: 40, width: 1, color: AppColors.borderDefault);
}

String _formatShort(int amount) {
  if (amount >= 1000000) return '${(amount / 1000000).toStringAsFixed(1)}m';
  if (amount >= 1000) return '${(amount / 1000).toStringAsFixed(0)}k';
  return '$amount';
}
