import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/features/home/domain/model/todos_model.dart';

class TodosListView extends StatelessWidget {
  final List<TodosModel> items;
  final void Function(TodosModel item, bool? value) onChanged;
  final void Function(TodosModel item) onTap;
  const TodosListView({super.key, required this.items, required this.onChanged, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: items.length > 4 ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (ctx, index) {
        final todo = items[index];
        return GestureDetector(
          onTap: () => onTap(todo),
          child: Row(
            children: [
              Checkbox(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: todo.isDone,
                onChanged: (v) => onChanged(todo, v),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                side: const BorderSide(color: Colors.grey),
                activeColor: AppColors.primary,
              ),
              Expanded(
                child: Text(
                  todo.content,
                  style: AppTextStyles.body(context).copyWith(decoration: todo.isDone ? TextDecoration.lineThrough : null, color: todo.isDone ? Colors.grey : AppColors.textPrimary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
