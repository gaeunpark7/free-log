import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';

class SummaryCardWidget extends StatelessWidget {
  const SummaryCardWidget({
    super.key,
    required this.totalHours,
    required this.totalIncome,
    required this.totalExpense,
  });
  final int totalHours;
  final int totalIncome;
  final int totalExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryItem(
            context,
            TimeUtils.format(totalHours),
            AppLocalizations.of(context)!.timeEntryTitle,
            AppColors.primaryDark,
          ),
          _buildDivider(),
          _buildSummaryItem(
            context,
            '+${_formatShort(totalIncome)}',
            AppLocalizations.of(context)!.revenue,
            AppColors.success,
          ),
          _buildDivider(),
          _buildSummaryItem(
            context,
            '-${_formatShort(totalExpense)}',
            AppLocalizations.of(context)!.expenses,
            AppColors.error,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            value,
            style: AppTextStyles.subTitleBold(
              context,
            ).copyWith(color: color, overflow: TextOverflow.ellipsis),
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: AppTextStyles.caption(context)),
      ],
    );
  }

  Widget _buildDivider() =>
      Container(height: 40, width: 1, color: AppColors.borderDefault);
}

String _formatShort(int amount) {
  if (amount >= 1000000) return '${(amount / 1000000).toStringAsFixed(1)}m';
  if (amount >= 1000) return '${(amount / 1000).toStringAsFixed(0)}k';
  return '$amount';
}
