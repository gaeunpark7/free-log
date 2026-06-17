import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';

class AddTextField extends StatefulWidget {
  const AddTextField({super.key, required this.controller, this.errorText, required this.hintText, required this.maxLength});

  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final int maxLength;

  @override
  State<AddTextField> createState() => _AddTextFieldState();
}

class _AddTextFieldState extends State<AddTextField> {
  final FocusNode _focusNode = FocusNode();

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
          style: const TextStyle(color: AppColors.primary),
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
              borderSide: BorderSide(color: isFocused ? AppColors.primary : AppColors.borderDefault),
            ),
            filled: true,
            fillColor: isFocused ? Colors.white : AppColors.background,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey),
            counterText: '',
          ),
          maxLength: widget.maxLength,
          buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null,
          maxLines: 1,
        ),
        if (widget.errorText != null) ...[const SizedBox(height: 4), Text(widget.errorText!, style: const TextStyle(color: AppColors.error, fontSize: 12))],
      ],
    );
  }
}
