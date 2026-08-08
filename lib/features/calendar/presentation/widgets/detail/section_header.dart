import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.icon,
    required this.label,
    required this.rightText,
    required this.color,
  });
  final IconData icon;
  final String label;
  final String rightText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.captionBold(
            context,
          ).copyWith(color: AppColors.textPrimary),
        ),
        const Spacer(),
        Text(
          rightText,
          style: AppTextStyles.captionBold(
            context,
          ).copyWith(color: color, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
