import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/app_filled_button.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';

class DeleteProjectDialog extends ConsumerWidget {
  final String projectId;
  const DeleteProjectDialog({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final projectAsync = ref.watch(projectNotifierProvider);
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
              Text('작업을 삭제할까요?', style: AppTextStyles.title(context)),
              SizedBox(height: 5),
              Text('작업이 영구적으로 삭제됩니다.', style: AppTextStyles.badge(context).copyWith(color: AppColors.textSecondary, fontSize: 14)),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppFilledButton.cancel(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: AppFilledButton.delete(
                      onPressed: () async {
                        await ref.read(projectNotifierProvider.notifier).deleteProject(projectId);
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
    );
  }
}
