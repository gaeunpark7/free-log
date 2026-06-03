import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';

class AddTitle extends StatelessWidget {
  const AddTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '작업 추가',
          style: TextStyle(
            fontSize: Responsive.fontSize(context, AppTextStyles.titleSize),
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          '새로운 프리랜서 작업을 등록합니다',
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
