import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_handler.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/features/profile/presentation/providers/profile_provider.dart';
import 'package:free_log/l10n/app_localizations.dart';

class ProfileSettingsScreen extends ConsumerStatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends ConsumerState<ProfileSettingsScreen> {
  final _nameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileProvider, (prev, next) {
      if (next.hasError && prev?.hasError != true) {
        ErrorHandler.showSnackBar(context, next.error);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: Responsive.screenPadding(context),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.setNickname,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(AppLocalizations.of(context)!.nicknameSubtitle),
              SizedBox(height: 12),
              Icon(Icons.account_circle, size: 120, color: AppColors.primary),
              SizedBox(height: 12),
              AppTextField(
                controller: _nameController,
                valieText: AppLocalizations.of(context)!.nicknameError,
                hintText: AppLocalizations.of(context)!.nicknameHint,
                maxLenth: 12,
              ),
              SizedBox(height: 12),
              AppFilledButton(
                onPressed: () {
                  if (!_formkey.currentState!.validate()) return;
                  ref
                      .read(profileProvider.notifier)
                      .updateProfile(nickname: _nameController.text.trim());
                },
                text: AppLocalizations.of(context)!.save,
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
