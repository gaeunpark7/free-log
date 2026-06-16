import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/delete_dialog.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/core/widgets/text_field/date_picker_field.dart';
import 'package:free_log/core/widgets/text_field/hourly_rate_field_widget.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/presentation/providers/expense_provider.dart';

class EditExpenseDialog extends ConsumerStatefulWidget {
  final ExpenseModel expense;

  const EditExpenseDialog({super.key, required this.expense});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditExpenseDialogState();
}

class _EditExpenseDialogState extends ConsumerState<EditExpenseDialog> {
  late TextEditingController _titleController;
  late TextEditingController _amountController;
  late DateTime _selectedDate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.expense.description);
    _amountController = TextEditingController(text: widget.expense.amount.toStringAsFixed(0));
    _selectedDate = widget.expense.spentAt;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                  Text('지출 수정', style: AppTextStyles.title(context)),
                ],
              ),
              SizedBox(height: 12),
              Text('항목', style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary)),
              const SizedBox(height: 4),
              AppTextField(controller: _titleController, valieText: '항목을 입력하세요.', hintText: '항목명', maxLenth: 15, icon: Icon(Icons.edit_note, size: 23)),
              const SizedBox(height: 8),
              //금액
              Text('금액', style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary)),
              const SizedBox(height: 4),
              HourlyRateField(controller: _amountController, hintText: '금액', errorText: '금액을 입력하세요', maxDigits: 8, icon: Icon(Icons.attach_money_outlined, size: 23)),
              const SizedBox(height: 8),
              //날짜
              Text('날짜', style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary)),
              const SizedBox(height: 4),
              DatePickerField(selectedDate: _selectedDate, icon: Icons.event, onDateChanged: (picked) => setState(() => _selectedDate = picked)),
              const SizedBox(height: 12),
              Row(
                children: [
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
                        showDialog(
                          context: context,
                          builder: (ctx) => DeleteDialog(
                            onDelete: () async {
                              await ref.read(expenseNotifierProvider(widget.expense.projectId ?? '').notifier).deleteExpense(widget.expense.id ?? '');
                              if (context.mounted) Navigator.pop(context);
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.delete_outline_outlined, color: AppColors.errorSoft),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: FilledButton(
                        style: FilledButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          await ref
                              .read(expenseNotifierProvider(widget.expense.projectId ?? '').notifier)
                              .updateExpense(widget.expense.id ?? '', _titleController.text.trim(), double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0, _selectedDate);
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
    );
  }
}
