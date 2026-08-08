// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:free_log/core/router/route_paths.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});
  static final Uri _feedbackFormUri = Uri.parse('https://forms.gle/3fcJh9dtJJk4UgsX8');

  Future<void> _openFeedbackForm(BuildContext context) async {
    try {
      final ok = await launchUrl(_feedbackFormUri, mode: LaunchMode.externalApplication);
      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.feedbackFormOpenFailed)),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.feedbackFormError)));
      debugPrint('오류문의 폼 열기 실패: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: Responsive.screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //앱 정보
            _buildTitleText(context, AppLocalizations.of(context)!.app),
            const SizedBox(height: 2),
            _buildInfoCard(context),
            const SizedBox(height: 12),

            //회원탈퇴
            _buildTitleText(context, AppLocalizations.of(context)!.account),
            const SizedBox(height: 2),
            _buildDeleteCard(context),
          ],
        ),
      ),
    );
  }

  Container _buildDeleteCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(12),
      ),
      child: _buildRow(
        context,
        () {
          context.push(
            '${RoutePaths.profile}/${RoutePaths.profileDetail}/${RoutePaths.deleteUser}',
          );
        },
        AppLocalizations.of(context)!.deleteAccount,
        AppLocalizations.of(context)!.settingsDelete,
        Icons.person_off_outlined,
        true,
      ),
    );
  }

  Container _buildInfoCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          //개인정보
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
          const Divider(color: AppColors.borderDefault, height: 1.0),

          //오류 문의
          _buildRow(
            context,
            () {
              _openFeedbackForm(context);
            },
            AppLocalizations.of(context)!.reportBug,
            AppLocalizations.of(context)!.settingsBug,
            Icons.feedback_outlined,
            false,
          ),
        ],
      ),
    );
  }

  Text _buildTitleText(BuildContext context, String text) {
    return Text(
      text,
      style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
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
              const SizedBox(width: 14),
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

          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    ),
  );
}
