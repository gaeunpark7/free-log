import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/text_field/date_picker_field.dart';
import 'package:free_log/core/widgets/text_field/hour_text_field.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/delete_entry_dialog.dart';

class TimeEntryDialog extends ConsumerStatefulWidget {
  final TimeEntryModel entry; // 수정할 항목
  final String projectId;

  const TimeEntryDialog({super.key, required this.entry, required this.projectId});

  @override
  ConsumerState<TimeEntryDialog> createState() => _TimeEntryDialogState();
}

class _TimeEntryDialogState extends ConsumerState<TimeEntryDialog> {
  late TextEditingController _hoursController;
  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;
  bool _isEditing = false; // 편집 여부

  @override
  void initState() {
    super.initState();
    final hours = widget.entry.hours;
    _hoursController = TextEditingController(text: hours == 0.0 ? '' : '${hours}h');
    _selectedDate = widget.entry.workedAt ?? DateTime.now().toLocal();

    // 텍스트 변경 감지
    _hoursController.addListener(_onChanged);
  }

  void _onChanged() {
    setState(() => _isEditing = true);
  }

  @override
  void dispose() {
    _hoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
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
                      decoration: BoxDecoration(color: const Color.fromARGB(255, 230, 237, 248), borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.schedule, color: AppColors.primary),
                    ),
                    SizedBox(width: 10),
                    Text('작업 시간 기록', style: AppTextStyles.title(context)),
                  ],
                ),
                const SizedBox(height: 16),

                // 날짜
                Text('날짜', style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary)),
                const SizedBox(height: 6),
                DatePickerField(
                  icon: Icons.event,
                  selectedDate: _selectedDate,
                  onDateChanged: (picked) {
                    setState(() {
                      _selectedDate = picked;
                      _isEditing = true;
                    });
                  },
                ),
                const SizedBox(height: 12),
                // 시간
                Text('작업 시간', style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary)),
                const SizedBox(height: 6),
                HourTextField(controller: _hoursController),
                const SizedBox(height: 12),

                // 버튼
                if (_isEditing)
                  // 편집 중 >  저장하기
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))),
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;
                        final hours = double.tryParse(_hoursController.text.replaceAll('h', '')) ?? 0;
                        ref.read(timeEntryNotifierProvider(widget.projectId).notifier).updateTimeEntry(widget.entry.id ?? '', _selectedDate, hours);
                        if (context.mounted) Navigator.pop(context);
                      },
                      child: Text('저장하기', style: AppTextStyles.bodyBold(context).copyWith(color: Colors.white)),
                    ),
                  )
                else
                  // 기본 상태 > 삭제 + 닫기
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
                              builder: (ctx) => DeleteEntryDialog(entry: widget.entry, projectId: widget.projectId),
                            );
                            if (deleted == true && context.mounted) Navigator.pop(context);
                          },
                          icon: Icon(Icons.delete_outline_outlined, color: AppColors.errorSoft),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // 닫기 버튼
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: FilledButton(
                            style: FilledButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                            onPressed: () => Navigator.pop(context),
                            child: Text('확인', style: AppTextStyles.bodyBold(context).copyWith(color: Colors.white)),
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
