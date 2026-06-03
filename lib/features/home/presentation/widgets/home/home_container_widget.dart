import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/home/domain/model/project_status.dart';

class HomeContainerWidget extends StatelessWidget {
  final String title;
  final DateTime? deadline;
  final int hourlyRate;
  final ProjectStatus status;
  const HomeContainerWidget({
    super.key,
    required this.title,
    required this.deadline,
    required this.hourlyRate,
    required this.status,
  });

  String get _statusLabel {
    switch (status) {
      case ProjectStatus.inProgress:
        return '진행중';
      case ProjectStatus.onHold:
        return '보류';
      case ProjectStatus.completed:
        return '완료';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyles.title(context)),
                const Icon(Icons.arrow_forward_ios, size: 12),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Text(
                  deadline != null
                      ? '마감 ${deadline!.month.toString()}/${deadline!.day.toString().padLeft(2, '0')}'
                      : '마감일 없음',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(width: 4),
                Text('●', style: TextStyle(color: AppColors.textSecondary)),
                const SizedBox(width: 4),
                const Icon(Icons.access_time, size: 12, color: Colors.grey),
                const SizedBox(width: 2),
                Text('20h', style: TextStyle(color: AppColors.textSecondary)),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            Text(_statusLabel, style: TextStyle(color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}
