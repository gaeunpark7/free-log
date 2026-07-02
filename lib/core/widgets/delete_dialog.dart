import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onDelete;
  const DeleteDialog({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.errorBg,
                  radius: 30,
                  child: Icon(Icons.delete, color: AppColors.errorSoft, size: 28),
                ),
                SizedBox(height: 5),
                Text(
                  AppLocalizations.of(context)!.deleteRecordTitle,
                  style: AppTextStyles.title(context),
                ),
                SizedBox(height: 5),
                Text(
                  AppLocalizations.of(context)!.deleteRecordMessage,
                  style: AppTextStyles.badge(
                    context,
                  ).copyWith(color: AppColors.textSecondary, fontSize: 14),
                ),
                SizedBox(height: 12),
                Row(
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
                        text: AppLocalizations.of(context)!.delete,
                        onPressed: () async {
                          onDelete();
                          if (context.mounted) Navigator.pop(context, true);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
