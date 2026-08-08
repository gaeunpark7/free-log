import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        title: Text(
          AppLocalizations.of(context)!.privacyPolicy,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: Responsive.screenPadding(context),
        child: SingleChildScrollView(
          child: Column(
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
                      //1
                      _buildTitle(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyCollectingInfo,
                      ),
                      _buildSubTitle(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyLoginInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicySocialLoginInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyGoogleLoginInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyKakaoLoginInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyNicknameInfo,
                      ),
                      const SizedBox(height: 10),
                      _buildSubTitle(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyServiceUsageInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyProjectInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyTodoTimeInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyIncomeExpenseInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyCalendarStatsInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyDefaultSettingsInfo,
                      ),
                      const SizedBox(height: 10),
                      _buildSubTitle(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyAdInfo,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyAdInfoDetail,
                      ),
                      // SizedBox(height: 10),
                      const Divider(color: AppColors.borderDefault),
                      //2
                      _buildTitle(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyPurposeTitle,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyPurposeIntro,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyPurposeIdentity,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyPurposeManagement,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyPurposeSync,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyPurposeAds,
                      ),
                      const Divider(color: AppColors.borderDefault),

                      //3
                      _buildTitle(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyStorageTitle,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyStorageSupabase,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyStoragePurpose,
                      ),
                      const Divider(color: AppColors.borderDefault),

                      //4
                      _buildTitle(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyRetentionTitle,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyRetentionDelete,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyRetentionLegal,
                      ),
                      const Divider(color: AppColors.borderDefault),

                      //5
                      _buildTitle(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyThirdPartyTitle,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyThirdPartyNoShare,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyThirdPartyAdmob,
                      ),
                      const Divider(color: AppColors.borderDefault),

                      //6
                      _buildTitle(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyEntrustTitle,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyEntrustIntro,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyEntrustSupabase,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.privacyPolicyEntrustGoogleKakao,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyEntrustAdmob,
                      ),
                      const Divider(color: AppColors.borderDefault),

                      //7
                      _buildTitle(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyRightsTitle,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyRightsDesc,
                      ),
                      const Divider(color: AppColors.borderDefault),

                      //8
                      _buildTitle(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyInquiryTitle,
                      ),
                      _buildBody(
                        context,
                        AppLocalizations.of(context)!.privacyPolicyInquiryDesc,
                      ),
                      Row(
                        children: [
                          _buildBody(
                            context,
                            AppLocalizations.of(
                              context,
                            )!.privacyPolicyEmailLabel,
                          ),
                          InkWell(
                            onTap: () async {
                              final uri = Uri.parse(
                                'https://mail.google.com/mail/u/0/?fs=1&to=gaeunpark736@gmail.com&tf=cm',
                              );
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            child: Text(
                              'agdeveloper736@gmail.com',
                              style: AppTextStyles.caption(context).copyWith(
                                color: const Color.fromARGB(255, 59, 6, 92),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTitle(BuildContext context, String text) =>
      Text(text, style: AppTextStyles.bodyBold(context));
  Text _buildSubTitle(BuildContext context, String text) => Text(
    text,
    style: AppTextStyles.captionBold(
      context,
    ).copyWith(color: AppColors.textPrimary),
  );
  Text _buildBody(BuildContext context, String text) => Text(
    text,
    style: AppTextStyles.caption(
      context,
    ).copyWith(color: AppColors.textPrimary),
  );
}
