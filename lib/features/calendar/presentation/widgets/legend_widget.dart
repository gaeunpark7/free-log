import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildRow(context, AppColors.primaryDark, '작업'), SizedBox(width: 10), _buildRow(context, AppColors.success, '입금'), SizedBox(width: 10), _buildRow(context, AppColors.error, '재료비')],
    );
  }

  Widget _buildRow(BuildContext context, Color color, String text) => Row(
    children: [
      CircleAvatar(backgroundColor: color, radius: 5),
      SizedBox(width: 5),
      Text(text, style: AppTextStyles.caption(context).copyWith(color: color)),
    ],
  );
}
