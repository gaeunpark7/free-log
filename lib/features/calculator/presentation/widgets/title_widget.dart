import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primary),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            Responsive.screenPadding(context).left,
            12,
            Responsive.screenPadding(context).right,
            16,
          ),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.calculate_outlined, color: AppColors.primaryDark, size: 30),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.priceCalculator,
                    style: AppTextStyles.headline(context).copyWith(color: Colors.white),
                  ),
                  Text(
                    AppLocalizations.of(context)!.quickEstimate,
                    style: AppTextStyles.subTitle(context).copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
