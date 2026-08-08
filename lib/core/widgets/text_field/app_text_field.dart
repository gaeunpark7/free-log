import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/l10n/app_localizations.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.valieText,
    required this.hintText,
    this.icon,
    required this.maxLenth,
    this.read,
    this.validate = true,
  });
  final TextEditingController controller;
  final String valieText;
  final String hintText;
  final Icon? icon;
  final int maxLenth;
  final bool? read;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: read == true
          ? AppTextStyles.bodyBold(
              context,
            ).copyWith(color: AppColors.textTertiary)
          : AppTextStyles.body(context),
      controller: controller,
      validator: validate
          ? (value) {
              if (value == null || value.isEmpty) return valieText;
              if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                return AppLocalizations.of(context)!.nicknameSpecialCharError;
              }
              return null;
            }
          : null,

      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.textTertiary),
        suffixStyle: const TextStyle(color: AppColors.textTertiary),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: read == true ? Colors.transparent : AppColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.errorSoft, width: 1.5),
        ),
        filled: true,
        fillColor: read == true ? AppColors.surfaceTint : AppColors.background,
        suffixIcon: icon,
        suffixIconColor: AppColors.textTertiary,
      ),
      maxLength: maxLenth,
      maxLines: 1,
      readOnly: read ?? false,
    );
  }
}
