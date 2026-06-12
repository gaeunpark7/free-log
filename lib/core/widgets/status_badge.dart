import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/features/home/domain/model/project_status.dart';

class StatusBadge extends StatelessWidget {
  final ProjectStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      ProjectStatus.inProgress => _badge(color: AppColors.warningBg, textColor: AppColors.warning, label: '진행중'),
      ProjectStatus.onHold => _badge(color: AppColors.neutralBg, textColor: AppColors.neutral, label: '보류'),
      ProjectStatus.completed => _badge(color: AppColors.successBg, textColor: AppColors.success, icon: Icons.check, label: '완료'),
    };
  }

  Widget _badge({required Color color, required Color textColor, IconData? icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: textColor),
            const SizedBox(width: 3),
          ],
          Text(label, style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
