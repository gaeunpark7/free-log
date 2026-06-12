import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/features/home/presentation/widgets/add_dialog/add_button_widget.dart';
import 'package:free_log/features/home/presentation/widgets/add_dialog/add_text_field_widget.dart';
import 'package:free_log/features/home/presentation/widgets/add_dialog/deadline_container_widget.dart';
import 'package:free_log/core/widgets/hourly_rate_field_widget.dart';
import 'package:free_log/features/home/presentation/widgets/add_dialog/add_title_widget.dart';

class AddProjectDialog extends ConsumerStatefulWidget {
  const AddProjectDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddProjectDialogState();
}

class _AddProjectDialogState extends ConsumerState<AddProjectDialog> {
  final _titleController = TextEditingController();
  final _hourlyRateController = TextEditingController();
  DateTime? _selectedDeadline;
  String? _titleError;
  String? _hourlyRateError;
  String? _deadlineError;

  @override
  void dispose() {
    _titleController.dispose();
    _hourlyRateController.dispose();
    super.dispose();
  }

  Future<void> _pickDeadline() async {
    final picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        _selectedDeadline = picked;
        _deadlineError = null;
      });
    }
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    final hourlyRateText = _hourlyRateController.text.trim();
    final hourlyRateValue = hourlyRateText.replaceAll(',', '');
    final hourlyRate = int.tryParse(hourlyRateValue);

    setState(() {
      _titleError = title.isEmpty ? '작업명을 입력해주세요' : null;
      _hourlyRateError = hourlyRateText.isEmpty ? '시급을 입력해주세요' : null;
      _deadlineError = _selectedDeadline == null ? '마감일을 선택해주세요' : null;
    });

    if (_titleError != null || _hourlyRateError != null || _deadlineError != null) {
      return;
    }

    if (hourlyRate == null) {
      setState(() {
        _hourlyRateError = '숫자만 입력해주세요';
      });
      return;
    }

    final project = ProjectModel(title: title, hourlyRate: hourlyRate, deadline: _selectedDeadline);

    try {
      await ref.read(projectNotifierProvider.notifier).createProject(project);
      if (!mounted) return;

      Navigator.of(context).pop('프로젝트 추가 완료');
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop('저장에 실패하였습니다: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: Responsive.cardPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AddTitle(),
              _buildText('작업명'),
              const SizedBox(height: 2),
              AddTextField(controller: _titleController, errorText: _titleError, hintText: '작업명을 입력하세요', maxLength: 12),
              _buildSizedBox(context),
              _buildText('시급'),
              const SizedBox(height: 2),
              HourlyRateField(controller: _hourlyRateController, icon: Icon(Icons.paid)),
              _buildSizedBox(context),
              _buildText('마감일'),
              const SizedBox(height: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _pickDeadline,
                    child: DeadlineContainerWidget(seletedDeadline: _selectedDeadline),
                  ),
                  if (_deadlineError != null) ...[const SizedBox(height: 4), Text(_deadlineError!, style: const TextStyle(color: AppColors.error, fontSize: 12))],
                ],
              ),
              _buildSizedBox(context),
              AddButtonWidget(onPressed: _save),
            ],
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
