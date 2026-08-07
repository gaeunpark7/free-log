import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/features/profile/presentation/widgets/delete_user_card.dart';
import 'package:free_log/features/profile/presentation/widgets/delete_user_dialog.dart';
import 'package:free_log/features/profile/presentation/widgets/delete_user_title.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DeleteUserScreen extends StatefulWidget {
  const DeleteUserScreen({super.key});

  @override
  State<DeleteUserScreen> createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends State<DeleteUserScreen> {
  bool agreedToDelete = false;

  @override
  Widget build(BuildContext context) {
    void toggleAgree([bool? value]) {
      setState(() {
        agreedToDelete = value ?? !agreedToDelete;
      });
    }

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.deleteAccount,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: Responsive.screenPadding(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DeleteUserTitle(),
              SizedBox(height: 12),
              DeleteUserCard(),
              SizedBox(height: 6),
              _buildCheck(toggleAgree, context),
              SizedBox(height: 6),
              _buildButton(agreedToDelete),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildCheck(void Function(bool? value) toggleAgree, BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => toggleAgree(!agreedToDelete),
          child: Checkbox(
            value: agreedToDelete,
            activeColor: AppColors.primary,
            onChanged: toggleAgree,
            visualDensity: VisualDensity.compact,
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        Expanded(
          child: Text(
            AppLocalizations.of(context)!.deleteAccountAgreementCheckbox,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: AppTextStyles.caption(context).copyWith(color: AppColors.textSecondary),
          ),
        ),
      ],
    );
  }

  Row _buildButton(bool agreedToDelete) {
    return Row(
      children: [
        Expanded(
          child: AppFilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: AppLocalizations.of(context)!.cancel,
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: agreedToDelete
              ? AppFilledButton.delete(
                  onPressed: () {
                    showDialog(context: context, builder: (ctx) => DeleteUserDialog());
                  },
                  text: AppLocalizations.of(context)!.deleteAccount,
                )
              : AppFilledButton.delete2(
                  onPressed: () {},
                  text: AppLocalizations.of(context)!.deleteAccount,
                ),
        ),
      ],
    );
  }
}
