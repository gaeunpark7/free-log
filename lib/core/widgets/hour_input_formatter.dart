import 'package:flutter/services.dart';

class HourInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // 'h' 제거 후 숫자/소수점만 허용
    String digits = newValue.text.replaceAll('h', '').replaceAll(RegExp(r'[^0-9.]'), '');
    if (digits.isEmpty) return const TextEditingValue(text: '');

    final newText = '${digits}h';
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: digits.length), // 커서는 'h' 앞에
    );
  }
}
