import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DeleteProjectDialog extends ConsumerWidget {
  const DeleteProjectDialog({super.key, required this.projectId});
  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final projectAsync = ref.watch(projectNotifierProvider);
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
                const CircleAvatar(
                  backgroundColor: AppColors.errorBg,
                  radius: 30,
                  child: Icon(
                    Icons.delete,
                    color: AppColors.errorSoft,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  AppLocalizations.of(context)!.deleteConfirm,
                  style: AppTextStyles.title(context),
                ),
                const SizedBox(height: 5),
                Text(
                  AppLocalizations.of(context)!.deleteWarning,
                  style: AppTextStyles.badge(
                    context,
                  ).copyWith(color: AppColors.textSecondary, fontSize: 14),
                ),
                const SizedBox(height: 12),
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
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppFilledButton.delete(
                        text: AppLocalizations.of(context)!.delete,
                        onPressed: () async {
                          await ref
                              .read(projectNotifierProvider.notifier)
                              .deleteProject(projectId);
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
