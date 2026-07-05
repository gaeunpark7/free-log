import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_log/core/theme/app_colors.dart';

class TimeInputWidget extends StatelessWidget {
  final TextEditingController hoursController;
  final TextEditingController minutesController;

  const TimeInputWidget({
    super.key,
    required this.hoursController,
    required this.minutesController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 시간
        Expanded(
          child: TextFormField(
            controller: hoursController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: _inputDecoration(context, 'H'),
            maxLength: 2,
            maxLines: 1,
            validator: (value) {
              return null;
            },
          ),
        ),
        const SizedBox(width: 8), // 분
        Expanded(
          child: TextFormField(
            controller: minutesController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              _MaxValueFormatter(60), // 60초과 입력 불가
            ],
            decoration: _inputDecoration(context, 'M'),
            maxLength: 2,
            maxLines: 1,
            validator: (value) {
              return null;
            },
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(BuildContext context, String suffix) {
    return InputDecoration(
      counterText: '',
      filled: true,
      fillColor: AppColors.background,
      hintText: '0',
      suffixText: suffix,
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
    );
  }
}

// 최대값 제한
class _MaxValueFormatter extends TextInputFormatter {
  final int maxValue;
  _MaxValueFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;
    final value = int.tryParse(newValue.text) ?? 0;
    if (value > maxValue) return oldValue; // 초과하면 이전 값 유지
    return newValue;
  }
}
