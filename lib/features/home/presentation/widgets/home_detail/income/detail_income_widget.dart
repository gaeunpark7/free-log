import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_view.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/app_filled_button.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/core/widgets/text_field/date_picker_field.dart';
import 'package:free_log/core/widgets/text_field/hourly_rate_field_widget.dart';
import 'package:free_log/features/home/presentation/providers/income_provider.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/income/income_list_view.dart';

class DetailIncomeWidget extends ConsumerStatefulWidget {
  final String projectId;
  const DetailIncomeWidget({super.key, required this.projectId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailIncomeWidgetState();
}

class _DetailIncomeWidgetState extends ConsumerState<DetailIncomeWidget> {
  bool _isAdding = false;
  DateTime _selectedDate = DateTime.now();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _add() async {
    if (!_formKey.currentState!.validate()) return;

    if (_titleController.text.trim().isEmpty) return;
    if (_amountController.text.trim().isEmpty) return;
    await ref.read(incomeNotifierProvider(widget.projectId).notifier).addIncome(_titleController.text.trim(), int.parse(_amountController.text.replaceAll(',', '')), _selectedDate);

    _titleController.clear();
    _amountController.clear();
    setState(() {
      _isAdding = false;
      _selectedDate = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncIncome = ref.watch(incomeNotifierProvider(widget.projectId));
    ref.listen(incomeNotifierProvider(widget.projectId), (prev, next) {
      if (next is AsyncError && prev is! AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.error.toString())));
      }
    });
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('받은 금액', style: AppTextStyles.subTitleBold(context)),
                  // SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() => _isAdding = !_isAdding);
                    },
                    child: Text('+ 추가', style: AppTextStyles.body(context).copyWith(color: AppColors.primary)),
                  ),
                ],
              ),
              if (_isAdding) ...[
                const SizedBox(height: 12),
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
                AppFilledButton(
                  onPressed: () {
                    _add();
                  },
                  text: '추가',
                ),
              ],
              if (!_isAdding) ...[SizedBox(height: 2), Divider(thickness: 0.5, color: AppColors.textTertiary)],
              asyncIncome.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (value) => ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 230),
                  child: IncomeListView(income: value),
                ),
                error: (error, _) => ErrorView(message: '$error'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
