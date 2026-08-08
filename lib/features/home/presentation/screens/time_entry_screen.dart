import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_handler.dart';
import 'package:free_log/core/error/error_view.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/utils/time_entry_utils.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/core/widgets/app_content_layout_widget.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/edit_entry_dialog.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/empty_time_entry_container.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/detail/time_entry_list_view.dart';
import 'package:free_log/l10n/app_localizations.dart';

class TimeEntryScreen extends ConsumerWidget {
  const TimeEntryScreen({super.key, required this.projectId});
  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncEntries = ref.watch(timeEntryNotifierProvider(projectId));
    final projectName =
        ref
            .watch(projectNotifierProvider)
            .valueOrNull
            ?.firstWhere(
              (p) => p.id == projectId,
              orElse: () => const ProjectModel(title: ''),
            )
            .title ??
        '';

    ref.listen(projectNotifierProvider, (prve, next) {
      next.whenOrNull(
        error: (error, _) => ErrorHandler.showSnackBar(context, error),
      );
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.timeEntryTitle,
          style: AppTextStyles.headline(context).copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: AppContentlayout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 총 작업시간 카드
              Expanded(
                child: Padding(
                  padding: Responsive.screenPadding(context),
                  child: Column(
                    children: [
                      Container(
                        padding: Responsive.cardPadding(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.borderDefault),
                        ),
                        child: switch (asyncEntries) {
                          AsyncError(:final error) => ErrorView(
                            message: ErrorHandler.getMessage(context, error),
                          ),
                          AsyncLoading() => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                          AsyncData(value: final entries) => Builder(
                            builder: (context) {
                              final totalMinutes = entries.fold(
                                0,
                                (sum, e) => sum + e.minutes,
                              );
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(
                                          context,
                                        )!.totalTimeEntries,
                                        style: AppTextStyles.bodyBold(context),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '$projectName ⦁ ${entries.length}',
                                            style: AppTextStyles.caption(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    TimeUtils.format(totalMinutes),
                                    style: AppTextStyles.title(context)
                                        .copyWith(
                                          color: totalMinutes == 0
                                              ? Colors.grey
                                              : AppColors.textPrimary,
                                        ),
                                  ),
                                ],
                              );
                            },
                          ),
                          _ => const SizedBox.shrink(),
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.timeEntries,
                            style: AppTextStyles.subTitleBold(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      //시간 listView
                      switch (asyncEntries) {
                        AsyncLoading() => const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                        AsyncError(:final error) => ErrorView(
                          message: ErrorHandler.getMessage(context, error),
                        ),
                        AsyncData(value: final entries) =>
                          entries.isEmpty
                              ? const EmptyTimeEntryContainer()
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount: entries.length,
                                    itemBuilder: (ctx, index) {
                                      final entry = entries[index];
                                      return GestureDetector(
                                        onTap: () => showDialog(
                                          context: context,
                                          builder: (_) => TimeEntryDialog(
                                            entry: entry,
                                            projectId: projectId,
                                          ),
                                        ),
                                        child: TimeEntryListView(
                                          entry: entry,
                                          weekdayLabel: (dt) => formatWeekday(
                                            dt,
                                            Localizations.localeOf(
                                              context,
                                            ).languageCode,
                                          ),
                                          formatHours: formatHours,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        _ => const SizedBox.shrink(),
                      },
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
