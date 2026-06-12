import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/d_day_info.dart';

class DDayBadge extends StatelessWidget {
  final DDayInfo? info;

  const DDayBadge({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    if (info == null) return const SizedBox.shrink();

    return switch (info!.status) {
      DDayStatus.safe || DDayStatus.near => _badge(color: AppColors.inProgressBg, textColor: AppColors.primary, label: info!.label),
      DDayStatus.today => _badge(color: AppColors.todayBg, textColor: AppColors.todayText, icon: Icons.local_fire_department_outlined, label: info!.label),
      DDayStatus.overdue => _badge(color: AppColors.errorBg, textColor: AppColors.error, icon: Icons.error_outline, label: info!.label, borderColor: AppColors.borderError),
    };
  }

  Widget _badge({required Color color, required Color textColor, IconData? icon, required String label, Color? borderColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 12, color: textColor), const SizedBox(width: 3)],
          Text(
            label,
            style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
