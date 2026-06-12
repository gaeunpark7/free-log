import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/app_filled_button.dart';
import 'package:free_log/core/widgets/app_text_field.dart';
import 'package:free_log/core/widgets/date_picker_field.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/core/widgets/hourly_rate_field_widget.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';

class EditProjectDialog extends ConsumerStatefulWidget {
  final ProjectModel project;
  const EditProjectDialog({super.key, required this.project});

  @override
  ConsumerState<EditProjectDialog> createState() => _EditProjectDialogState();
}

class _EditProjectDialogState extends ConsumerState<EditProjectDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _hourlyRateController;
  DateTime? _selectedDeadline;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.project.title);
    _hourlyRateController = TextEditingController(text: widget.project.hourlyRate == 0 ? '' : widget.project.hourlyRate.toString());
    _selectedDeadline = widget.project.deadline;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _hourlyRateController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final hourlyRate = int.tryParse(_hourlyRateController.text.replaceAll(',', ''));
    if (hourlyRate == null) return;

    final updated = widget.project.copyWith(title: _titleController.text.trim(), hourlyRate: hourlyRate, deadline: _selectedDeadline);

    await ref.read(projectNotifierProvider.notifier).updateProject(updated);
    if (ref.read(projectNotifierProvider).hasError) return;
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 230, 237, 248), borderRadius: BorderRadius.circular(12)),
                    child: Icon(Icons.edit_document, color: AppColors.primary),
                  ),
                  SizedBox(width: 10),
                  Text('작업 수정', style: AppTextStyles.title(context)),
                ],
              ),
              const SizedBox(height: 16),
              //작업명
              Text('작업명', style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary)),
              const SizedBox(height: 6),
              AppTextField(controller: _titleController, valieText: '작업명을 입력하세요.', hintText: '작업명을 입력하세요.', maxLenth: 12),
              const SizedBox(height: 12),

              //시급
              Text('시급', style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary)),
              const SizedBox(height: 6),
              HourlyRateField(controller: _hourlyRateController),
              const SizedBox(height: 12),

              //마감일
              Text('마감일', style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary)),
              const SizedBox(height: 6),
              DatePickerField(selectedDate: _selectedDeadline ?? DateTime.now(), onDateChanged: (date) => setState(() => _selectedDeadline = date)),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: AppFilledButton.cancel(onPressed: () => Navigator.pop(context))),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppFilledButton(onPressed: _save, text: '수정', color: AppColors.primary, textColor: Colors.white),
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
