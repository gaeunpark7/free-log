import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:intl/intl.dart';
import 'package:free_log/core/theme/app_colors.dart';

class HourlyRateField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxDigits;
  final Icon? icon;
  HourlyRateField({super.key, required this.controller, this.hintText = '시급을 입력하세요', this.maxDigits = 7, this.icon});

  late final TextInputFormatter _currencyFormatter = _CurrencyFormatter(maxDigits: maxDigits);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: AppTextStyles.bodyBold(context),
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) return '시급을 입력하세요.';
            return null;
          },
          keyboardType: TextInputType.number,
          cursorColor: AppColors.primary,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly, _currencyFormatter],
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
            // fillColor: isFocused ? Colors.white : AppColors.background,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.textTertiary),
            suffixIcon: icon,
            suffixIconColor: AppColors.textTertiary,
          ),
          maxLines: 1,
        ),
        // if (errorText != null) ...[const SizedBox(height: 4), Text(errorText!, style: const TextStyle(color: AppColors.errorSoft, fontSize: 12))],
      ],
    );
  }
}

class _CurrencyFormatter extends TextInputFormatter {
  _CurrencyFormatter({required this.maxDigits});

  final int maxDigits;
  final _numberFormat = NumberFormat('#,###');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(',', '');
    if (digitsOnly.isEmpty) {
      return const TextEditingValue();
    }

    final trimmedDigits = digitsOnly.length > maxDigits ? digitsOnly.substring(0, maxDigits) : digitsOnly;
    final formatted = _numberFormat.format(int.parse(trimmedDigits));

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
