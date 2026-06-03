import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';

class DetailTimeEntries extends StatelessWidget {
  const DetailTimeEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('작업 시간', style: AppTextStyles.subTitleBold(context)),
                SizedBox(width: 10),
                Text('2.5h'),
              ],
            ),
            Text(
              '+ 추가',
              style: AppTextStyles.subTitle(
                context,
              ).copyWith(color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
