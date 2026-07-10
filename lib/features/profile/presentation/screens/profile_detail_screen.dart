import 'package:flutter/material.dart';
import 'package:free_log/core/router/route_paths.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: Responsive.screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.app,
              style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.borderDefault),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildRow(
                    context,
                    () {
                      context.push(
                        '${RoutePaths.profile}/${RoutePaths.profileDetail}/${RoutePaths.privacy}',
                      );
                    },
                    AppLocalizations.of(context)!.privacyPolicy,
                    AppLocalizations.of(context)!.settingsData,
                    Icons.privacy_tip_outlined,
                    false,
                  ),
                  Divider(color: AppColors.borderDefault, height: 1.0),
                  _buildRow(
                    context,
                    () {},
                    AppLocalizations.of(context)!.reportBug,
                    AppLocalizations.of(context)!.settingsBug,
                    Icons.feedback_outlined,
                    false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.account,
              style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.borderDefault),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _buildRow(
                context,
                () {},
                AppLocalizations.of(context)!.deleteAccount,
                AppLocalizations.of(context)!.settingsDelete,
                Icons.person_off_outlined,
                true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    VoidCallback onTap,
    String title,
    String subTitle,
    IconData icon,
    bool isDelete,
  ) => GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: Responsive.cardPadding(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: isDelete ? AppColors.errorBg : AppColors.primarySoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: isDelete ? AppColors.errorSoft : AppColors.primary),
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyBold(
                      context,
                    ).copyWith(color: isDelete ? AppColors.error : AppColors.textPrimary),
                  ),
                  Text(
                    subTitle,
                    style: AppTextStyles.caption(
                      context,
                    ).copyWith(color: isDelete ? AppColors.errorSoft : Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    ),
  );
}
