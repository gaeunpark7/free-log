import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/core/widgets/text_field/deadline_field.dart';
import 'package:free_log/core/widgets/text_field/hourly_rate_field_widget.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/l10n/app_localizations.dart';

class EditProjectDialog extends ConsumerStatefulWidget {
  const EditProjectDialog({super.key, required this.project});
  final ProjectModel project;

  @override
  ConsumerState<EditProjectDialog> createState() => _EditProjectDialogState();
}

class _EditProjectDialogState extends ConsumerState<EditProjectDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _hourlyRateController;
  late final TextEditingController _deadlineController;
  DateTime? _selectedDeadline;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.project.title);
    _hourlyRateController = TextEditingController(
      text: widget.project.hourlyRate == 0 ? '' : widget.project.hourlyRate.toString(),
    );
    _selectedDeadline = widget.project.deadline;
    _deadlineController = TextEditingController(
      text: _selectedDeadline != null
          ? '${_selectedDeadline!.year}.${_selectedDeadline!.month.toString().padLeft(2, '0')}.${_selectedDeadline!.day.toString().padLeft(2, '0')}'
          : '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _hourlyRateController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final hourlyRate = int.tryParse(_hourlyRateController.text.replaceAll(',', '')) ?? 0;
    final noChange =
        _titleController.text.trim() == widget.project.title &&
        hourlyRate == widget.project.hourlyRate &&
        _selectedDeadline == widget.project.deadline;

    if (noChange) {
      if (mounted) Navigator.pop(context);
      return;
    }

    final updated = widget.project.copyWith(
      title: _titleController.text.trim(),
      hourlyRate: hourlyRate,
      deadline: _selectedDeadline,
    );

    await ref.read(projectNotifierProvider.notifier).updateProject(updated);
    if (ref.read(projectNotifierProvider).hasError) return;
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  _buildHeader(context),
                  const SizedBox(height: 16),

                  //작업명
                  _buildTitle(context, AppLocalizations.of(context)!.projectName),
                  const SizedBox(height: 6),
                  AppTextField(
                    controller: _titleController,
                    valieText: AppLocalizations.of(context)!.projectNameError,
                    hintText: AppLocalizations.of(context)!.projectNameHint,
                    maxLenth: 12,
                  ),
                  const SizedBox(height: 12),

                  //시급
                  _buildTitle(context, AppLocalizations.of(context)!.hourlyRate),
                  const SizedBox(height: 6),
                  HourlyRateField(
                    controller: _hourlyRateController,
                    hintText: AppLocalizations.of(context)!.hourlyRateHint,
                    errorText: AppLocalizations.of(context)!.hourlyRateError,
                    maxDigits: 7,
                  ),
                  const SizedBox(height: 12),

                  //마감일
                  _buildTitle(context, AppLocalizations.of(context)!.deadline),
                  const SizedBox(height: 6),
                  DeadlineField(
                    controller: _deadlineController,
                    selectedDate: _selectedDeadline ?? DateTime.now(),
                    onDateChanged: (date) => setState(() {
                      _selectedDeadline = date;
                      _deadlineController.text =
                          '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
                    }),
                  ),
                  const SizedBox(height: 20),

                  //저장
                  _buildButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppFilledButton.cancel(
            text: AppLocalizations.of(context)!.cancel,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AppFilledButton(
            onPressed: _save,
            text: AppLocalizations.of(context)!.update,
            color: AppColors.primary,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Text _buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 237, 248),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.edit_document, color: AppColors.primary),
        ),
        const SizedBox(width: 10),
        Text(AppLocalizations.of(context)!.editProject, style: AppTextStyles.title(context)),
      ],
    );
  }
}
