import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DeleteUserTitle extends StatelessWidget {
  const DeleteUserTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            // border: Border.all(color: AppColors.errorSoft),
            borderRadius: BorderRadius.circular(12),
            color: AppColors.errorBg,
          ),
          child: Icon(Icons.warning, color: AppColors.errorSoft, size: 35),
        ),
        SizedBox(height: 5),
        Text(
          AppLocalizations.of(context)!.deleteAccountConfirmQuestion,
          style: AppTextStyles.title(context),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          AppLocalizations.of(context)!.deleteAccountConfirmSubtext,
          style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textTertiary),
        ),
      ],
    );
  }
}
