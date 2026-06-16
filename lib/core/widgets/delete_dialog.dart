import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/app_filled_button.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onDelete;
  const DeleteDialog({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
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
              Text('기록을 삭제할까요?', style: AppTextStyles.title(context)),
              SizedBox(height: 5),
              Text('기록이 영구적으로 삭제됩니다.', style: AppTextStyles.badge(context).copyWith(color: AppColors.textSecondary, fontSize: 14)),
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
    );
  }
}
