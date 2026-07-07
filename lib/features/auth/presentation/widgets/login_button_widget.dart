import 'package:flutter/material.dart';
import 'package:free_log/core/utils/responsive_utils.dart';

class LoginButtonWidget extends StatelessWidget {
  final Color color;
  final String image;
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  const LoginButtonWidget({
    super.key,
    required this.color,
    required this.image,
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image, width: 20, height: 20),
                  SizedBox(width: 10),
                  Text(text, style: TextStyle(color: Colors.black)),
                ],
              ),
      ),
    );
  }
}
