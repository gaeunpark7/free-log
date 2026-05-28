import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:free_log/core/theme/app_colors.dart';

class HourlyRateField extends StatefulWidget {
  const HourlyRateField({
    super.key,
    required this.controller,
    this.errorText,
    this.hintText = '시급을 입력하세요',
    this.maxDigits = 7,
  });

  final TextEditingController controller;
  final String? errorText;
  final String hintText;
  final int maxDigits;

  @override
  State<HourlyRateField> createState() => _HourlyRateFieldState();
}

class _HourlyRateFieldState extends State<HourlyRateField> {
  final FocusNode _focusNode = FocusNode();
  late final TextInputFormatter _currencyFormatter = _CurrencyFormatter(
    maxDigits: widget.maxDigits,
  );

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: AppColors.primary),
          cursorColor: AppColors.primary,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            _currencyFormatter,
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderDefault),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isFocused ? AppColors.primary : AppColors.borderDefault,
              ),
            ),
            filled: true,
            fillColor: isFocused ? Colors.white : AppColors.background,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            counterText: '',
          ),
          maxLines: 1,
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.errorText!,
            style: const TextStyle(color: AppColors.error, fontSize: 12),
          ),
        ],
      ],
    );
  }
}

class _CurrencyFormatter extends TextInputFormatter {
  _CurrencyFormatter({required this.maxDigits});

  final int maxDigits;
  final _numberFormat = NumberFormat('#,###');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(',', '');
    if (digitsOnly.isEmpty) {
      return const TextEditingValue();
    }

    final trimmedDigits = digitsOnly.length > maxDigits
        ? digitsOnly.substring(0, maxDigits)
        : digitsOnly;
    final formatted = _numberFormat.format(int.parse(trimmedDigits));

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
