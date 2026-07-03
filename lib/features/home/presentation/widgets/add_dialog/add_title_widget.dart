import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';

class AddTitle extends StatelessWidget {
  const AddTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.addProject,
          style: TextStyle(
            fontSize: Responsive.fontSize(context, AppTextStyles.titleSize),
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.addProjectSubtitle,
          style: TextStyle(
            fontSize: Responsive.fontSize(context, AppTextStyles.captionSize),
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: Responsive.sizedBoxHeight(context, AppSpacing.md)),
      ],
    );
  }
}
