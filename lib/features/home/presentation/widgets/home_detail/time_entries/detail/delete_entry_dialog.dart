import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:free_log/core/utils/time_entry_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DeleteEntryDialog extends ConsumerWidget {
  final TimeEntryModel entry;
  final String projectId;

  const DeleteEntryDialog({super.key, required this.entry, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = entry.workedAt?.toLocal();
    final dateStr = date != null
        ? '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')} (${formatWeekday(date, Localizations.localeOf(context).languageCode)}) ${TimeUtils.format(entry.minutes)}'
        : '';

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
                Text(dateStr, style: AppTextStyles.badgeBold(context).copyWith(fontSize: 14)),
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
                      child: _buildButton(
                        context,
                        AppColors.background,
                        AppColors.borderDefault,
                        AppLocalizations.of(context)!.cancel,
                        AppColors.textSecondary,
                        () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildButton(
                        context,
                        AppColors.errorSoft,
                        AppColors.errorSoft,
                        AppLocalizations.of(context)!.delete,
                        Colors.white,
                        () async {
                          await ref
                              .read(timeEntryNotifierProvider(projectId).notifier)
                              .deleteTimeEntry(entry.id ?? '');
                          if (context.mounted) {
                            Navigator.pop(context, true);
                          }
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

  Widget _buildButton(
    BuildContext context,
    Color backColor,
    Color borderColor,
    String text,
    Color textColor,
    VoidCallback? onPressed,
  ) {
    return SizedBox(
      height: 48,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: backColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
            side: BorderSide(color: borderColor),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: AppTextStyles.bodyBold(context).copyWith(color: textColor)),
      ),
    );
  }
}
