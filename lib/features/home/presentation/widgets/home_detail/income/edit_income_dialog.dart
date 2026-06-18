import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/delete_dialog.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/core/widgets/text_field/date_picker_field.dart';
import 'package:free_log/core/widgets/text_field/hourly_rate_field_widget.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/presentation/providers/income_provider.dart';

class EditIncomeDialog extends ConsumerStatefulWidget {
  final IncomeModel income;
  const EditIncomeDialog({super.key, required this.income});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditIncomeDialogState();
}

class _EditIncomeDialogState extends ConsumerState<EditIncomeDialog> {
  late TextEditingController _titleController;
  late TextEditingController _amountController;
  late DateTime _selectedDate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.income.description);
    _amountController = TextEditingController(text: widget.income.amount.toString());
    _selectedDate = widget.income.receivedAt;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
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
                    Text('수입 수정', style: AppTextStyles.title(context)),
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
                                await ref.read(incomeNotifierProvider(widget.income.projectId ?? '').notifier).deleteExpense(widget.income.id ?? '');
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
                                .read(incomeNotifierProvider(widget.income.projectId ?? '').notifier)
                                .updateIncome(widget.income.id ?? '', _titleController.text.trim(), int.tryParse(_amountController.text.replaceAll(',', '')) ?? 0, _selectedDate);
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
