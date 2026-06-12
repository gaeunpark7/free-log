import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class DatePickerField extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final IconData? icon;

  const DatePickerField({super.key, required this.selectedDate, required this.onDateChanged, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2020), lastDate: DateTime(2100));
        if (picked != null) onDateChanged(picked);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(color: AppColors.borderDefault),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDate.year}.'
              '${selectedDate.month.toString().padLeft(2, '0')}.'
              '${selectedDate.day.toString().padLeft(2, '0')}',
              style: AppTextStyles.bodyBold(context),
            ),
            Icon(icon, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }
}
