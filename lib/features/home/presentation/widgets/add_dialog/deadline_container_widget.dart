import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/responsive_utils.dart';

class DeadlineContainerWidget extends StatelessWidget {
  final DateTime? seletedDeadline;
  const DeadlineContainerWidget({super.key, required this.seletedDeadline});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              seletedDeadline == null
                  ? '연도 - 월 - 일'
                  : '${seletedDeadline!.year}-'
                        '${seletedDeadline!.month.toString().padLeft(2, '0')}-'
                        '${seletedDeadline!.day.toString().padLeft(2, '0')}',
              style: TextStyle(color: seletedDeadline == null ? Colors.grey : AppColors.textPrimary, fontSize: Responsive.fontSize(context, 14)),
            ),
          ],
        ),
      ),
    );
  }
}
