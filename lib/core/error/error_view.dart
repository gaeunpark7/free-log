import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorView({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          const Icon(Icons.error_outline, size: 48, color: AppColors.errorSoft),
          const SizedBox(height: 5),
          Text(message, style: AppTextStyles.badgeBold(context).copyWith(color: AppColors.textPrimary)),
          if (onRetry != null) ...[const SizedBox(height: 16), ElevatedButton(onPressed: onRetry, child: const Text('다시 시도'))],
        ],
      ),
    );
  }
}
