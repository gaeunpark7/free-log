import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';

class HomeButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const HomeButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.borderDefault),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: AppColors.textSecondary)),
    );
  }
}
