import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_view.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/utils/time_entry_utils.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/empty_time_entry_container.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/edit_entry_dialog.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/time_entry_list_view.dart';

class TimeEntryScreen extends ConsumerWidget {
  final String projectId;
  const TimeEntryScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncEntries = ref.watch(timeEntryNotifierProvider(projectId));
    final projectName = ref.watch(projectNotifierProvider).valueOrNull?.firstWhere((p) => p.id == projectId, orElse: () => const ProjectModel(title: '')).title ?? '';

    ref.listen(projectNotifierProvider, (prve, next) {
      next.whenOrNull(error: (error, _) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString()))));
    });
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
                AsyncError(:final error) => ErrorView(message: error.toString()),
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
                      formatHours(entries.fold(0.0, (sum, e) => sum + e.hours)),
                      style: AppTextStyles.headline(context).copyWith(color: entries.fold(0.0, (sum, e) => sum + e.hours) == 0.0 ? Colors.grey : AppColors.textPrimary),
                    ),
                  ],
                ),
                _ => const SizedBox.shrink(),
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
              AsyncError(:final error) => ErrorView(message: error.toString()),
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
                              child: TimeEntryListView(entry: entry, weekdayLabel: formatWeekday, formatHours: formatHours),
                            );
                          },
                        ),
                      ),
              _ => const SizedBox.shrink(),
            },
          ],
        ),
      ),
    );
  }
}
