import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/hour_input_formatter.dart';

class HourTextField extends StatelessWidget {
  final TextEditingController controller;
  // final List<TextInputFormatter>? inputFormatters;
  const HourTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.body(context),
      controller: controller,
      inputFormatters: [HourInputFormatter()],
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) return '시간을 입력하세요.';
        final digits = value.replaceAll('h', '');
        final hours = double.tryParse(digits);
        if (hours == null || hours <= 0) return '0보다 큰 시간을 입력하세요.';
        return null;
      },
      decoration: InputDecoration(
        counterText: '',
        hintText: '시간을 입력하세요',
        hintStyle: TextStyle(color: AppColors.textTertiary),
        suffixStyle: TextStyle(color: AppColors.textTertiary),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorSoft, width: 1.5),
        ),
        filled: true,
        fillColor: AppColors.background,
        suffixIcon: Icon(Icons.alarm, color: AppColors.textTertiary, size: 23),
      ),
      maxLength: 5,
    );
  }
}
