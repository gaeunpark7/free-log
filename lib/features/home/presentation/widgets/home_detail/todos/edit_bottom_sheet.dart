import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditBottomSheet extends StatelessWidget {
  VoidCallback editOnTap;
  VoidCallback deleteOnTap;
  EditBottomSheet({super.key, required this.editOnTap, required this.deleteOnTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(leading: const Icon(Icons.edit_outlined), title: const Text('수정'), onTap: () => editOnTap()),
        ListTile(leading: const Icon(Icons.delete_outline), title: const Text('삭제'), onTap: () => deleteOnTap()),
      ],
    );
  }
}
