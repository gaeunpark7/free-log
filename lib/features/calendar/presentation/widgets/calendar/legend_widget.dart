import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/l10n/app_localizations.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRow(
          context,
          AppColors.primaryDark,
          AppLocalizations.of(context)!.timeEntryTitle,
        ),
        const SizedBox(width: 10),
        _buildRow(
          context,
          AppColors.success,
          AppLocalizations.of(context)!.revenue,
        ),
        const SizedBox(width: 10),
        _buildRow(
          context,
          AppColors.error,
          AppLocalizations.of(context)!.expenses,
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, Color color, String text) => Row(
    children: [
      CircleAvatar(backgroundColor: color, radius: 5),
      const SizedBox(width: 5),
      Text(text, style: AppTextStyles.caption(context).copyWith(color: color)),
    ],
  );
}
