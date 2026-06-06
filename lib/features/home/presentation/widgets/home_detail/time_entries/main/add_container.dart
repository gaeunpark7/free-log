import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class AddContainer extends StatelessWidget {
  final VoidCallback onTap;
  final DateTime selectedDate;
  final TextEditingController controller;
  final VoidCallback add;
  const AddContainer({super.key, required this.onTap, required this.selectedDate, required this.controller, required this.add});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${selectedDate.year}-'
              '${selectedDate.month.toString().padLeft(2, '0')}-'
              '${selectedDate.day.toString().padLeft(2, '0')}',
              style: AppTextStyles.body(context),
            ),
          ),
        ),

        const SizedBox(height: 8),

        //시간 입력
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '시간 (ex: 2.5)',
            suffixText: 'h',
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: FilledButton(onPressed: add, child: const Text('추가')),
        ),
      ],
    );
  }
}
