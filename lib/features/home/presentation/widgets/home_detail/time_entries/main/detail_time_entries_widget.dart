import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:free_log/features/home/presentation/screens/time_entry_screen.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/main/add_container.dart';

class DetailTimeEntries extends ConsumerStatefulWidget {
  final String projectId;
  const DetailTimeEntries({super.key, required this.projectId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailTimeEntriesState();
}

class _DetailTimeEntriesState extends ConsumerState<DetailTimeEntries> {
  bool _isAdding = false;
  DateTime _seletedDate = DateTime.now();
  final _hoursController = TextEditingController();

  @override
  void dispose() {
    _hoursController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(context: context, initialDate: _seletedDate, firstDate: DateTime(2026), lastDate: DateTime(2050));
    if (picked != null) setState(() => _seletedDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    final asyncEntries = ref.watch(timeEntryNotifierProvider(widget.projectId));
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => TimeEntryScreen(projectId: widget.projectId)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  asyncEntries.when(
                    loading: () => Text('작업 시간'),
                    error: (_, _) => Text('작업 시간'),
                    data: (entries) {
                      final total = entries.fold<double>(0.0, (sum, e) => sum + (e.hours));
                      return Text('작업 시간 ${total}h', style: AppTextStyles.subTitle(context));
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() => _isAdding = !_isAdding);
                    },
                    child: Text('+ 추가', style: AppTextStyles.caption(context).copyWith(color: AppColors.primary)),
                  ),
                ],
              ),
            ),
            if (_isAdding) ...[
              AddContainer(
                onTap: () {
                  _pickDate();
                },
                selectedDate: _seletedDate,
                controller: _hoursController,
                add: () async {
                  if (_hoursController.text.trim().isEmpty) return;
                  await ref.read(timeEntryNotifierProvider(widget.projectId).notifier).addTimeEntry(_seletedDate, double.tryParse(_hoursController.text) ?? 0);
                  _hoursController.clear();
                  setState(() {
                    _isAdding = false;
                    _seletedDate = DateTime.now();
                  });
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
