import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({
    super.key,
    required this.inProgressCount,
    required this.completedCount,
  });
  final int inProgressCount;
  final int completedCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive.containerHeight(context, 0.18),
      color: AppColors.primary,
      padding: Responsive.screenPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          // SizedBox(height: Responsive.sizedBoxHeight(context, AppSpacing.lg)),
          Text(
            AppLocalizations.of(context)!.myProject,
            style: const TextStyle(
              fontSize: AppTextStyles.headlineSize,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSubTitle(
                context,
                AppLocalizations.of(
                  context,
                )!.projectStatus(inProgressCount, completedCount),
              ),
              const SizedBox(width: 2),
              // _buildSubTitle(context, inProgressCount.toString()),
              // SizedBox(width: AppSpacing.sm),
              // Text(
              //   '⦁',
              //   style: TextStyle(fontSize: Responsive.fontSize(context, AppTextStyles.bodySize), color: Colors.white),
              // ),
              // SizedBox(width: AppSpacing.sm),
              // _buildSubTitle(context, '완료 $completedCount'),
            ],
          ),
        ],
      ),
    );
  }

  Text _buildSubTitle(BuildContext context, String text) {
    return Text(
      text,
      style: AppTextStyles.subTitle(
        context,
      ).copyWith(color: Colors.white, fontWeight: FontWeight.w500),
    );
  }
}
