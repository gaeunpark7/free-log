import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/empty_time_entry_container.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/edit_entry_dialog.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/time_entry_list_view.dart';

class TimeEntryScreen extends ConsumerWidget {
  final String projectId;
  const TimeEntryScreen({super.key, required this.projectId});

  String _weekdayLabel(DateTime? dt) {
    if (dt == null) return '';
    const labels = ['월', '화', '수', '목', '금', '토', '일'];
    return '${labels[dt.toLocal().weekday - 1]}요일';
  }

  String _formatHours(double hours) {
    return hours == hours.truncateToDouble() ? '${hours.toInt()}h' : '${hours}h';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncEntries = ref.watch(timeEntryNotifierProvider(projectId));
    final projectName = ref.watch(projectNotifierProvider).valueOrNull?.firstWhere((p) => p.id == projectId, orElse: () => const ProjectModel(title: '')).title ?? '';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Text('작업 시간', style: AppTextStyles.headline(context).copyWith(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 총 작업시간 카드
            Container(
              padding: Responsive.cardPadding(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderDefault),
              ),
              child: switch (asyncEntries) {
                AsyncError() => Text('로드 실패', style: AppTextStyles.caption(context)),
                AsyncLoading() => Center(child: CircularProgressIndicator(color: AppColors.primary)),
                AsyncData(value: final entries) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('총 작업 시간', style: AppTextStyles.bodyBold(context)),
                        Row(
                          children: [
                            Text(projectName, style: AppTextStyles.caption(context)),
                            const SizedBox(width: 2),
                            const Text('●', style: TextStyle(fontSize: 10, color: Colors.grey)),
                            const SizedBox(width: 2),
                            Text('${entries.length}건', style: AppTextStyles.caption(context)),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      _formatHours(entries.fold(0.0, (sum, e) => sum + e.hours)),
                      style: AppTextStyles.headline(context).copyWith(color: entries.fold(0.0, (sum, e) => sum + e.hours) == 0.0 ? Colors.grey : AppColors.textPrimary),
                    ),
                  ],
                ),
                AsyncValue<List<TimeEntryModel>>() => throw UnimplementedError(),
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('기록내역', style: AppTextStyles.subTitleBold(context))],
            ),
            const SizedBox(height: 8),
            //시간 listView
            switch (asyncEntries) {
              AsyncLoading() => Center(child: CircularProgressIndicator(color: AppColors.primary)),
              AsyncError(:final error) => Center(child: Text('에러: $error')),
              AsyncData(value: final entries) =>
                entries.isEmpty
                    ? EmptyTimeEntryContainer()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: entries.length,
                          itemBuilder: (ctx, index) {
                            final entry = entries[index];
                            return GestureDetector(
                              onTap: () => showDialog(
                                context: context,
                                builder: (_) => TimeEntryDialog(entry: entry, projectId: projectId),
                              ),
                              child: TimeEntryListView(entry: entry, weekdayLabel: _weekdayLabel, formatHours: _formatHours),
                            );
                          },
                        ),
                      ),
              AsyncValue<List<TimeEntryModel>>() => throw UnimplementedError(),
            },
          ],
        ),
      ),
    );
  }
}
