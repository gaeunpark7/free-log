import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/features/home/presentation/providers/todos_provider.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todos/delete_todo_dialog.dart';

class EditTodoDialog extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final String projectId;
  final String todoId;

  const EditTodoDialog({super.key, required this.controller, required this.projectId, required this.todoId});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditTodoDialogState();
}

class _EditTodoDialogState extends ConsumerState<EditTodoDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 480),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(color: const Color.fromARGB(255, 230, 237, 248), borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.edit_document, color: AppColors.primary),
                    ),
                    SizedBox(width: 10),
                    Text('할 일 수정', style: AppTextStyles.title(context)),
                  ],
                ),
                const SizedBox(height: 12),
                // Text('내용', style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary)),
                // const SizedBox(height: 6),
                AppTextField(controller: widget.controller, valieText: '할 일을 입력하세요.', hintText: '할 일 입력', icon: Icon(Icons.edit_note, size: 23), maxLenth: 15),
                const SizedBox(height: 12),

                Row(
                  children: [
                    // 삭제 버튼
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.errorBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.borderError),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          final deleted = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => DeleteTodoDialog(todoId: widget.todoId, projectId: widget.projectId),
                          );
                          if (deleted == true && context.mounted) Navigator.pop(context);
                        },
                        icon: Icon(Icons.delete_outline_outlined, color: AppColors.errorSoft),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // 수정 버튼
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: FilledButton(
                          style: FilledButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;
                            await ref.read(todoNotifierProvider(widget.projectId).notifier).updateTodo(widget.todoId, widget.controller.text);
                            if (ref.read(todoNotifierProvider(widget.projectId)).hasError) return;
                            if (context.mounted) Navigator.pop(context);
                          },
                          child: Text('수정', style: AppTextStyles.bodyBold(context).copyWith(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
