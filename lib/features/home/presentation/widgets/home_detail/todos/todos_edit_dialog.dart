import 'package:flutter/material.dart';

class TodosEditDialog extends StatelessWidget {
  final TextEditingController controller;
  final Future<void> Function()? onPressed;
  const TodosEditDialog({super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('할 일 수정'),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('취소'),
        ),
        FilledButton(
          onPressed: () async {
            if (onPressed != null) await onPressed!();
            Navigator.pop(context);
          },
          child: const Text('수정'),
        ),
      ],
    );
  }
}
