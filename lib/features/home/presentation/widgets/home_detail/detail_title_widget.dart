import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class DetailTitleWidget extends StatelessWidget {
  const DetailTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('작업 이름', style: AppTextStyles.headline(context).copyWith(color: Colors.white)),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.inProgress),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            child: Text('진행중', style: AppTextStyles.bodyBold(context)),
          ),
        ),
      ],
    );
  }
}
