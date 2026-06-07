import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class AppFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const AppFilledButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12))),
        onPressed: onPressed,
        child: Text(text, style: AppTextStyles.bodyBold(context).copyWith(color: Colors.white)),
      ),
    );
  }
}
