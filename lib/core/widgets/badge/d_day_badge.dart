import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/d_day_info.dart';
import 'package:free_log/core/utils/responsive_utils.dart';

class DDayBadge extends StatelessWidget {
  final DDayInfo? info;

  const DDayBadge({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    if (info == null) return const SizedBox.shrink();

    return switch (info!.status) {
      DDayStatus.safe || DDayStatus.near => _badge(context, color: AppColors.inProgressBg, textColor: AppColors.primary, label: info!.label),
      DDayStatus.today => _badge(context, color: AppColors.todayBg, textColor: AppColors.todayText, label: info!.label),
      DDayStatus.overdue => _badge(context, color: AppColors.errorBg, textColor: AppColors.error, label: info!.label, borderColor: AppColors.borderError),
    };
  }

  Widget _badge(BuildContext context, {required Color color, required Color textColor, required String label, Color? borderColor}) {
    final fontSize = Responsive.fontSize(context, 12);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Responsive.isWeb(context) ? 10 : 8, vertical: Responsive.isWeb(context) ? 5 : 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize, color: textColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
