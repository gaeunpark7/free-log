import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class AppFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;

  const AppFilledButton({super.key, required this.onPressed, required this.text, this.color, this.borderColor, this.textColor});

  const AppFilledButton.add({Key? key, required VoidCallback onPressed}) : this(key: key, onPressed: onPressed, text: '추가', color: AppColors.primary, textColor: Colors.white);

  const AppFilledButton.cancel({Key? key, required VoidCallback onPressed})
    : this(key: key, onPressed: onPressed, text: '취소', color: AppColors.background, borderColor: AppColors.borderDefault, textColor: AppColors.textSecondary);

  const AppFilledButton.delete({Key? key, required VoidCallback onPressed}) : this(key: key, onPressed: onPressed, text: '삭제', color: AppColors.errorSoft, textColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: color,
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        onPressed: onPressed,
        child: Text(text, style: AppTextStyles.bodyBold(context).copyWith(color: textColor ?? Colors.white)),
      ),
    );
  }
}
