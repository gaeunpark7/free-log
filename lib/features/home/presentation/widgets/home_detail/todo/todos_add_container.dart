import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';

class TodosAddContainer extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;
  final VoidCallback onPressed;
  const TodosAddContainer({
    super.key,
    required this.controller,
    required this.formkey,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '할 일을 입력해주세요';
              }
              return null;
            },
            autofocus: true,
            decoration: InputDecoration(
              hintText: '할 일 입력',
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.primaryDark, width: 2),
              ),
            ),
            maxLength: 15,
            maxLines: 1,
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onPressed,
              child: const Text('추가'),
            ),
          ),
        ],
      ),
    );
  }
}
