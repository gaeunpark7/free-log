import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';

class HomeTitleWidget extends StatelessWidget {
  final int inProgressCount;
  final int completedCount;
  const HomeTitleWidget({super.key, required this.inProgressCount, required this.completedCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Responsive.containerHeight(context, 0.2),
      color: AppColors.primary,
      child: Padding(
        padding: Responsive.screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Responsive.sizedBoxHeight(context, AppSpacing.lg)),
            Text(
              '내 작업',
              style: TextStyle(fontSize: AppTextStyles.displaySize, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSubTitle(context, '진행중 $inProgressCount'),
                SizedBox(width: 2),
                // _buildSubTitle(context, inProgressCount.toString()),
                SizedBox(width: AppSpacing.sm),
                Text(
                  '●',
                  style: TextStyle(fontSize: Responsive.fontSize(context, AppTextStyles.bodySize), color: Colors.white),
                ),
                SizedBox(width: AppSpacing.sm),
                _buildSubTitle(context, '완료 $completedCount'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _buildSubTitle(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(fontSize: Responsive.fontSize(context, AppTextStyles.titleSize), color: Colors.white),
    );
  }
}
