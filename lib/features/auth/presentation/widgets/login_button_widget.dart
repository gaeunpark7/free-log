import 'package:flutter/material.dart';
import 'package:free_log/core/utils/responsive_utils.dart';

class LoginButtonWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  const LoginButtonWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.buttonWidth(context),
      height: 52,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Row(
                children: [
                  Icon(icon, color: Colors.black),
                  SizedBox(width: 8),
                  Text(text, style: TextStyle(color: Colors.black)),
                ],
              ),
      ),
    );
  }
}
