import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/app_filled_button.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/core/widgets/text_field/date_picker_field.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/core/widgets/text_field/hourly_rate_field_widget.dart';
import 'package:free_log/features/home/presentation/widgets/add_dialog/add_title_widget.dart';

class AddProjectDialog extends ConsumerStatefulWidget {
  const AddProjectDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddProjectDialogState();
}

class _AddProjectDialogState extends ConsumerState<AddProjectDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _hourlyRateController = TextEditingController();
  DateTime? _selectedDeadline;
  String? _deadlineError;

  @override
  void dispose() {
    _titleController.dispose();
    _hourlyRateController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final isFormValid = _formKey.currentState!.validate();
    setState(() => _deadlineError = _selectedDeadline == null ? '연도-월-일' : null);

    if (!isFormValid || _deadlineError != null) return;

    final hourlyRate = int.parse(_hourlyRateController.text.replaceAll(',', ''));
    final project = ProjectModel(title: _titleController.text.trim(), hourlyRate: hourlyRate, deadline: _selectedDeadline);

    await ref.read(projectNotifierProvider.notifier).createProject(project);
    if (!mounted) return;
    Navigator.of(context).pop('프로젝트 추가 완료');
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: Responsive.cardPadding(context),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AddTitle(),
                _buildText('작업명'),
                const SizedBox(height: 2),
                AppTextField(controller: _titleController, valieText: '작업명을 입력하세요.', hintText: '작업명을 입력하세요.', maxLenth: 12, icon: Icon(Icons.edit_note, size: 23)),
                _buildSizedBox(context),
                _buildText('시급'),
                const SizedBox(height: 2),
                HourlyRateField(controller: _hourlyRateController, icon: Icon(Icons.attach_money, size: 23), hintText: '시급을 입력하세요', errorText: '시급을 입력하세요', maxDigits: 7),
                _buildSizedBox(context),
                _buildText('마감일'),
                const SizedBox(height: 2),
                DatePickerField(
                  icon: Icons.today,
                  selectedDate: _selectedDeadline,
                  onDateChanged: (picked) => setState(() {
                    _selectedDeadline = picked;
                    _deadlineError = null;
                  }),
                ),
                if (_deadlineError != null) ...[const SizedBox(height: 4), Text(_deadlineError!, style: const TextStyle(color: AppColors.error, fontSize: 12))],
                _buildSizedBox(context),
                AppFilledButton(onPressed: _save, text: '저장'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildText(String text) {
    return Text(
      text,
      style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
    );
  }

  SizedBox _buildSizedBox(BuildContext context) {
    return SizedBox(height: Responsive.sizedBoxHeight(context, AppSpacing.itemSpacing));
  }
}
