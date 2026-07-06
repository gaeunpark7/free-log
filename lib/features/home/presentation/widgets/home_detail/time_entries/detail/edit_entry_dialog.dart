import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/core/widgets/text_field/date_picker_field.dart';
import 'package:free_log/core/widgets/text_field/time_input_widget.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/delete_entry_dialog.dart';
import 'package:free_log/l10n/app_localizations.dart';

class TimeEntryDialog extends ConsumerStatefulWidget {
  final TimeEntryModel entry; // 수정할 항목
  final String projectId;

  const TimeEntryDialog({super.key, required this.entry, required this.projectId});

  @override
  ConsumerState<TimeEntryDialog> createState() => _TimeEntryDialogState();
}

class _TimeEntryDialogState extends ConsumerState<TimeEntryDialog> {
  late TextEditingController _hoursController;
  late TextEditingController _minutesController;

  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    final totalMinutes = widget.entry.minutes;

    _hoursController = TextEditingController(text: TimeUtils.toHours(totalMinutes).toString());
    _minutesController = TextEditingController(text: TimeUtils.toMinutes(totalMinutes).toString());

    _selectedDate = widget.entry.workedAt ?? DateTime.now().toLocal();
    _hoursController.addListener(() => setState(() {}));
    _minutesController.addListener(() => setState(() {}));
  }

  // 원본 값과 현재 값을 비교해 실제 변경이 있을 때만 true
  bool get _hasChanges {
    final currentHours = int.tryParse(_hoursController.text) ?? 0;
    final currentminutes = int.tryParse(_minutesController.text) ?? 0;

    final original = widget.entry.workedAt ?? DateTime.now().toLocal();
    final dateChanged =
        _selectedDate.year != original.year ||
        _selectedDate.month != original.month ||
        _selectedDate.day != original.day;
    return currentHours != TimeUtils.toHours(widget.entry.minutes) ||
        currentminutes != TimeUtils.toMinutes(widget.entry.minutes) ||
        dateChanged;
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
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 237, 248),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.schedule, color: AppColors.primary),
                    ),
                    SizedBox(width: 10),
                    Text(
                      AppLocalizations.of(context)!.editTimeEntry,
                      style: AppTextStyles.title(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 날짜
                Text(
                  AppLocalizations.of(context)!.date,
                  style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
                ),
                const SizedBox(height: 6),
                DatePickerField(
                  icon: Icons.event,
                  selectedDate: _selectedDate,
                  onDateChanged: (picked) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  },
                ),
                const SizedBox(height: 12),
                // 시간
                Text(
                  AppLocalizations.of(context)!.hours,
                  style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
                ),
                const SizedBox(height: 6),
                TimeInputWidget(
                  hoursController: _hoursController,
                  minutesController: _minutesController,
                ),
                const SizedBox(height: 12),

                // 버튼
                if (_hasChanges)
                  // 편집 중 >  저장하기
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;
                        final hours = int.tryParse(_hoursController.text) ?? 0;
                        final minutes = int.tryParse(_minutesController.text) ?? 0;
                        final totalMinutes = TimeUtils.toTotalMinutes(hours, minutes);

                        if (totalMinutes == 0) return;

                        ref
                            .read(timeEntryNotifierProvider(widget.projectId).notifier)
                            .updateTimeEntry(widget.entry.id ?? '', _selectedDate, hours, minutes);
                        if (context.mounted) Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.save,
                        style: AppTextStyles.bodyBold(context).copyWith(color: Colors.white),
                      ),
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
                              builder: (ctx) => DeleteEntryDialog(
                                entry: widget.entry,
                                projectId: widget.projectId,
                              ),
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
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              AppLocalizations.of(context)!.ok,
                              style: AppTextStyles.bodyBold(context).copyWith(color: Colors.white),
                            ),
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
