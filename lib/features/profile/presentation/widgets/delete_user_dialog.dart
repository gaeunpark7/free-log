import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_handler.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/features/auth/presentation/providers/auth_provider.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DeleteUserDialog extends ConsumerStatefulWidget {
  const DeleteUserDialog({super.key});
  @override
  ConsumerState<DeleteUserDialog> createState() => _DeleteUserDialogState();
}

class _DeleteUserDialogState extends ConsumerState<DeleteUserDialog> {
  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (prev, next) {
      if (next.hasError && prev?.hasError != true) {
        ErrorHandler.showSnackBar(context, next.error);
      }
    });
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //title
                CircleAvatar(
                  backgroundColor: AppColors.errorBg,
                  radius: 30,
                  child: Icon(Icons.delete, color: AppColors.errorSoft, size: 28),
                ),
                SizedBox(height: 5),
                Text(
                  AppLocalizations.of(context)!.deleteAccountConfirmQuestion,
                  style: AppTextStyles.title(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                //body
                Text(
                  AppLocalizations.of(context)!.deleteAccountDialogMessage,
                  style: AppTextStyles.badge(
                    context,
                  ).copyWith(color: AppColors.textSecondary, fontSize: 14),
                ),
                SizedBox(height: 12),
                _buildButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: AppFilledButton.cancel(
            text: AppLocalizations.of(context)!.cancel,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: AppFilledButton.delete(
            text: AppLocalizations.of(context)!.deleteAccount,
            onPressed: () async {
              ref.read(authNotifierProvider.notifier).deleteAccount();
            },
          ),
        ),
      ],
    );
  }
}
