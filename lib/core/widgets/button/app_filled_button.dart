import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton.cancel({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) : this(
         key: key,
         onPressed: onPressed,
         text: text,
         color: AppColors.background,
         borderColor: AppColors.borderDefault,
         textColor: AppColors.textSecondary,
       );

  const AppFilledButton.delete({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) : this(
         key: key,
         onPressed: onPressed,
         text: text,
         color: AppColors.errorSoft,
         textColor: Colors.white,
       );
  const AppFilledButton.delete2({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) : this(
         key: key,
         onPressed: onPressed,
         text: text,
         color: AppColors.errorBg,
         // borderColor: AppColors.borderError,
         textColor: AppColors.textSecondary,
       );
  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.borderColor,
    this.textColor,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: color,
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.bodyBold(
            context,
          ).copyWith(color: textColor ?? Colors.white),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
