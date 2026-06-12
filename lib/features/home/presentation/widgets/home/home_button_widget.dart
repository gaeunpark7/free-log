import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';

class HomeButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isSelected;
  const HomeButtonWidget({super.key, required this.text, required this.onPressed, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? AppColors.primary : Colors.white,
        elevation: 0,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: isSelected ? AppColors.primary : AppColors.borderDefault),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: isSelected ? Colors.white : AppColors.textSecondary)),
    );
  }
}
