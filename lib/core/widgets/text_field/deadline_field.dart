import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DeadlineField extends StatelessWidget {
  const DeadlineField({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.onDateChanged,
  });
  final TextEditingController controller;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    final hasDate = selectedDate != null;
    return TextFormField(
      style: AppTextStyles.body(context),
      controller: controller,

      //valid
      validator: (value) {
        if (value == null || value.isEmpty) return AppLocalizations.of(context)!.deadlineError;
        return null;
      },

      //decoration
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.deadlineHint,
        hintStyle: AppTextStyles.body(
          context,
        ).copyWith(color: hasDate ? null : AppColors.textTertiary),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.errorSoft, width: 1.5),
        ),
        filled: true,
        fillColor: AppColors.background,

        //icon
        suffixIcon: const Icon(Icons.event, color: AppColors.textTertiary, size: 23),
        suffixIconColor: AppColors.textTertiary,
      ),
      maxLines: 1,

      readOnly: true,

      //onTap
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          lastDate: DateTime(2100),
          firstDate: DateTime(2020),
        );

        if (picked != null) onDateChanged(picked);
      },
    );
  }
}
