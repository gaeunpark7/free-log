import 'package:flutter/material.dart';
import 'package:free_log/core/widgets/date_picker_field.dart';
import 'package:free_log/core/widgets/hour_text_field.dart';

class AddContainer extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final TextEditingController controller;
  final VoidCallback add;

  const AddContainer({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
    required this.controller,
    required this.add,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        DatePickerField(selectedDate: selectedDate, onDateChanged: onDateChanged),
        const SizedBox(height: 8),
        HourTextField(controller: controller),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: FilledButton(onPressed: add, child: const Text('추가')),
        ),
      ],
    );
  }
}
