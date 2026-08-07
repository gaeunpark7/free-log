import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DeleteUserCard extends StatelessWidget {
  const DeleteUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.borderDefault),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: Responsive.cardPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(context, AppLocalizations.of(context)!.deletedDataSectionTitle),
                SizedBox(height: 5),
                _buildBody(context, AppLocalizations.of(context)!.deletedDataSocialLoginInfo),
                _buildBody(context, AppLocalizations.of(context)!.deletedDataProjectAndWorkHistory),
                _buildBody(context, AppLocalizations.of(context)!.deletedDataIncomeExpenseHistory),
                _buildBody(
                  context,
                  AppLocalizations.of(context)!.deletedDataStatsAndCalendarHistory,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.borderDefault),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: Responsive.cardPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTitle(context, AppLocalizations.of(context)!.deleteAccountNoticeTitle),
                SizedBox(height: 5),
                _buildBody(context, AppLocalizations.of(context)!.deleteAccountNoticeIrreversible),
                _buildBody(
                  context,
                  AppLocalizations.of(context)!.deleteAccountNoticeNoCancelAndSupport,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Text _buildTitle(BuildContext context, String text) =>
    Text(text, style: AppTextStyles.bodyBold(context).copyWith(color: AppColors.textPrimary));
Text _buildBody(BuildContext context, String text) =>
    Text(text, style: AppTextStyles.body(context).copyWith(color: AppColors.textPrimary));
