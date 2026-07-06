import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_handler.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/core/widgets/text_field/date_picker_field.dart';
import 'package:free_log/core/widgets/text_field/time_input_widget.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:free_log/features/home/presentation/screens/time_entry_screen.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DetailTimeEntries extends ConsumerStatefulWidget {
  final String projectId;
  const DetailTimeEntries({super.key, required this.projectId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailTimeEntriesState();
}

class _DetailTimeEntriesState extends ConsumerState<DetailTimeEntries> {
  bool _isAdding = false;
  DateTime _selectedDate = DateTime.now();
  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncEntries = ref.watch(timeEntryNotifierProvider(widget.projectId));
    ref.listen<AsyncValue<List<TimeEntryModel>>>(timeEntryNotifierProvider(widget.projectId), (
      previous,
      next,
    ) {
      if (next is AsyncError && previous is! AsyncError) {
        ErrorHandler.showSnackBar(context, next.error);
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => TimeEntryScreen(projectId: widget.projectId),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    asyncEntries.whenOrNull(
                          data: (entries) {
                            final total = entries.fold<int>(0, (sum, e) => sum + e.minutes);
                            return Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.timeEntryTitle,
                                  style: AppTextStyles.subTitleBold(context),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  TimeUtils.format(total),
                                  style: AppTextStyles.subTitle(
                                    context,
                                  ).copyWith(color: Colors.grey),
                                ),
                              ],
                            );
                          },
                        ) ??
                        Text(
                          AppLocalizations.of(context)!.timeEntryTitle,
                          style: AppTextStyles.subTitleBold(context),
                        ),
                    GestureDetector(
                      onTap: () {
                        setState(() => _isAdding = !_isAdding);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.addTodo,
                        style: AppTextStyles.body(context).copyWith(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              if (_isAdding) ...[
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(context)!.date,
                  style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
                ),
                DatePickerField(
                  icon: Icons.today,
                  selectedDate: _selectedDate,
                  onDateChanged: (picked) => setState(() => _selectedDate = picked),
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.hours,
                  style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
                ),
                // HourTextField(controller: _hoursController, hintText: 'ex: 10.5 (10시간 30분)'),
                TimeInputWidget(
                  hoursController: _hoursController,
                  minutesController: _minutesController,
                ),
                const SizedBox(height: 12),
                AppFilledButton(
                  onPressed: () async {
                    final hours = int.tryParse(_hoursController.text) ?? 0;
                    final minutes = int.tryParse(_minutesController.text) ?? 0;

                    if (hours == 0 && minutes == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(AppLocalizations.of(context)!.enterHoursOrMinutes)),
                      );
                      return;
                    }

                    await ref
                        .read(timeEntryNotifierProvider(widget.projectId).notifier)
                        .addTimeEntry(_selectedDate, hours, minutes);

                    _hoursController.clear();
                    _minutesController.clear();

                    setState(() {
                      _isAdding = false;
                      _selectedDate = DateTime.now();
                    });
                  },
                  text: AppLocalizations.of(context)!.add,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
