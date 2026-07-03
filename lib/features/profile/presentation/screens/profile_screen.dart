import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_view.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/profile/presentation/providers/profile_provider.dart';
import 'package:free_log/features/profile/presentation/widgets/profile_card.dart';
import 'package:free_log/features/profile/presentation/widgets/settings_card.dart';
import 'package:free_log/features/profile/presentation/widgets/stats_card.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:free_log/core/router/route_paths.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncProfile = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        //팝업 메뉴 버튼
        actions: [
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'privacy') {
                context.push('${RoutePaths.profile}/${RoutePaths.privacy}');
              } else if (value == 'logout') {}
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'privacy',
                child: _buildPopupItem(
                  AppLocalizations.of(context)!.privacyPolicy,
                  Icons.privacy_tip_outlined,
                ),
              ),
              PopupMenuItem<String>(
                value: 'feedback',
                child: _buildPopupItem(
                  AppLocalizations.of(context)!.reportBug,
                  Icons.feedback_outlined,
                ),
              ),
              PopupMenuDivider(color: AppColors.borderDefault),
              PopupMenuItem<String>(
                value: 'logout',
                child: _buildPopupItem(
                  AppLocalizations.of(context)!.signOut,
                  Icons.logout,
                  color: AppColors.errorSoft,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Responsive.screenPadding(context),
          child: Column(
            children: [
              switch (asyncProfile) {
                AsyncLoading() => Center(child: CircularProgressIndicator()),
                AsyncError(:final error) => ErrorView(message: error.toString()),
                AsyncData(:final value) => ProfileCard(user: value),
                _ => SizedBox.shrink(),
              },
              SizedBox(height: 12),
              switch (asyncProfile) {
                AsyncLoading() => Center(child: CircularProgressIndicator()),
                AsyncError(:final error) => ErrorView(message: error.toString()),
                AsyncData(:final value) => SettingsCard(
                  user: value,
                  onChanged: (value) {
                    ref.read(profileProvider.notifier).updateProfile(notifyDeadline: value);
                  },
                ),
                _ => SizedBox.shrink(),
              },
              SizedBox(height: 12),
              StatsCard(),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildPopupItem(final String title, final IconData icon, {final Color? color}) {
    return Row(
      children: [
        Icon(icon, color: color ?? AppColors.textPrimary, size: 18),
        SizedBox(width: 8),
        Text(title, style: TextStyle(color: color ?? AppColors.textPrimary)),
      ],
    );
  }
}
