import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/l10n/app_localizations.dart';

class MarginRateField extends StatelessWidget {
  final TextEditingController controller;
  const MarginRateField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.body(context),
      controller: controller,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.primary,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) return AppLocalizations.of(context)!.marginRateError;
        return null;
      },
      decoration: InputDecoration(
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
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorSoft, width: 1.5),
        ),
        filled: true,
        fillColor: AppColors.background,
        hintText: '0',
        hintStyle: TextStyle(color: AppColors.textTertiary),
        suffixText: '%',
        suffixStyle: TextStyle(color: AppColors.textTertiary),
      ),
      maxLines: 1,
    );
  }
}
