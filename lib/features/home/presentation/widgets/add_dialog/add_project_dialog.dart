import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/core/widgets/text_field/date_picker_field.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/core/widgets/text_field/hourly_rate_field_widget.dart';
import 'package:free_log/features/home/presentation/widgets/add_dialog/add_title_widget.dart';
import 'package:free_log/features/profile/presentation/providers/profile_provider.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

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
    setState(
      () => _deadlineError = _selectedDeadline == null
          ? AppLocalizations.of(context)!.deadlineError
          : null,
    );

    if (!isFormValid || _deadlineError != null) return;

    final hourlyRate = int.parse(_hourlyRateController.text.replaceAll(',', ''));
    final project = ProjectModel(
      title: _titleController.text.trim(),
      hourlyRate: hourlyRate,
      deadline: _selectedDeadline,
    );

    await ref.read(projectNotifierProvider.notifier).createProject(project);
    if (!mounted) return;
    Navigator.of(context).pop(AppLocalizations.of(context)!.projectAdded);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(profileProvider).valueOrNull;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
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
                  AddTitle(),
                  _buildText(AppLocalizations.of(context)!.projectName),
                  const SizedBox(height: 2),
                  AppTextField(
                    controller: _titleController,
                    valieText: AppLocalizations.of(context)!.projectNameError,
                    hintText: AppLocalizations.of(context)!.projectNameHint,
                    maxLenth: 12,
                    icon: Icon(Icons.edit_note, size: 23),
                  ),
                  _buildSizedBox(context),
                  _buildText(AppLocalizations.of(context)!.hourlyRate),
                  const SizedBox(height: 2),
                  HourlyRateField(
                    controller: _hourlyRateController,
                    icon: Icon(Icons.attach_money, size: 23),
                    hintText: user?.hourlyRate != null && user!.hourlyRate > 0
                        ? NumberFormat('#,###').format(user.hourlyRate)
                        : AppLocalizations.of(context)!.hourlyRateHint,
                    errorText: AppLocalizations.of(context)!.hourlyRateError,
                    maxDigits: 7,
                  ),
                  _buildSizedBox(context),
                  _buildText(AppLocalizations.of(context)!.deadline),
                  const SizedBox(height: 2),
                  DatePickerField(
                    icon: Icons.today,
                    selectedDate: _selectedDeadline,
                    onDateChanged: (picked) => setState(() {
                      _selectedDeadline = picked;
                      _deadlineError = null;
                    }),
                  ),
                  if (_deadlineError != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      _deadlineError!,
                      style: const TextStyle(color: AppColors.error, fontSize: 12),
                    ),
                  ],
                  _buildSizedBox(context),
                  AppFilledButton(onPressed: _save, text: AppLocalizations.of(context)!.save),
                ],
              ),
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
