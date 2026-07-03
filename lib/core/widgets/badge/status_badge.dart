import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/home/domain/model/project_status.dart';
import 'package:free_log/l10n/app_localizations.dart';

class StatusBadge extends StatelessWidget {
  final ProjectStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      ProjectStatus.inProgress => _badge(
        context,
        color: AppColors.onHold,
        textColor: AppColors.warning,
        label: AppLocalizations.of(context)!.inProgress,
      ),
      ProjectStatus.onHold => _badge(
        context,
        color: AppColors.neutralBg,
        textColor: AppColors.neutral,
        label: AppLocalizations.of(context)!.onHold,
      ),
      ProjectStatus.completed => _badge(
        context,
        color: AppColors.successBg,
        textColor: AppColors.success,
        label: AppLocalizations.of(context)!.completed,
      ),
    };
  }

  Widget _badge(
    BuildContext context, {
    required Color color,
    required Color textColor,
    required String label,
  }) {
    final fontSize = Responsive.fontSize(context, 12);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isWeb(context) ? 10 : 8,
        vertical: Responsive.isWeb(context) ? 5 : 4,
      ),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize, color: textColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
