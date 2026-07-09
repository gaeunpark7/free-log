import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/features/profile/domain/model/user_model.dart';
import 'package:free_log/features/profile/presentation/providers/profile_provider.dart';
import 'package:free_log/l10n/app_localizations.dart';

class ProfileEditDialog extends ConsumerStatefulWidget {
  final UserModel user;
  const ProfileEditDialog({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileEditDialogState();
}

class _ProfileEditDialogState extends ConsumerState<ProfileEditDialog> {
  late TextEditingController _nickNameController;
  late TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nickNameController = TextEditingController(text: widget.user.nickname);
    _emailController = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    _nickNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(14)),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              SizedBox(height: 12),
              //이름
              Text(
                AppLocalizations.of(context)!.nickName,
                style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
              ),
              SizedBox(height: 2),
              AppTextField(
                controller: _nickNameController,
                valieText: AppLocalizations.of(context)!.nicknameError,
                hintText: AppLocalizations.of(context)!.nicknameHint,
                maxLenth: 8,
              ),
              SizedBox(height: 12),

              //이메일
              Text(
                AppLocalizations.of(context)!.email,
                style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
              ),
              SizedBox(height: 2),
              AppTextField(
                controller: _emailController,
                valieText: "",
                hintText: "",
                maxLenth: 12,
                icon: Icon(Icons.lock_outline),
                read: true,
                validate: false,
              ),
              SizedBox(height: 12),

              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTitle(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.person, color: AppColors.primary),
        ),
        SizedBox(width: 10),
        Text(
          AppLocalizations.of(context)!.editNickname,
          style: AppTextStyles.subTitleBold(context),
        ),
      ],
    );
  }

  Row _buildButton() {
    return Row(
      children: [
        Expanded(
          child: AppFilledButton.cancel(
            text: AppLocalizations.of(context)!.cancel,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(width: 8),
        //저장
        Expanded(
          child: AppFilledButton(
            onPressed: () {
              final noChange = widget.user.nickname == _nickNameController.text.trim();
              if (noChange) {
                Navigator.pop(context);
                return;
              }

              if (!_formKey.currentState!.validate()) return;
              ref
                  .read(profileProvider.notifier)
                  .updateProfile(nickname: _nickNameController.text.trim());
              Navigator.pop(context);
            },
            text: AppLocalizations.of(context)!.save,
          ),
        ),
      ],
    );
  }
}
