import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/utils/d_day_info.dart';
import 'package:free_log/core/widgets/badge/d_day_badge.dart';
import 'package:free_log/core/widgets/badge/status_badge.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/model/project_status.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/features/home/presentation/providers/time_entry_provider.dart';
import 'package:free_log/features/home/presentation/widgets/home/delete_project_dialog.dart';
import 'package:free_log/features/home/presentation/widgets/home/edit_project_dialog.dart';
import 'package:free_log/l10n/app_localizations.dart';

class HomeContainerWidget extends ConsumerWidget {
  final ProjectModel project;
  final ProjectStatus status;
  const HomeContainerWidget({super.key, required this.project, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncEntries = ref.watch(timeEntryNotifierProvider(project.id!));
    final totalHours = asyncEntries.whenOrNull(
      data: (entries) => entries.fold(0.0, (sum, e) => sum + e.hours),
    );
    final ddayInfo = project.deadline != null ? DDayInfo.from(project.deadline!) : null;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(project.title, style: AppTextStyles.subTitleBold(context)),
                PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: AppColors.borderDefault),
                  ),
                  position: PopupMenuPosition.under,
                  onSelected: (value) {
                    if (value == 'edit') {
                      showDialog(
                        context: context,
                        builder: (ctx) => EditProjectDialog(
                          project: ProjectModel(
                            id: project.id,
                            title: project.title,
                            deadline: project.deadline,
                            hourlyRate: project.hourlyRate,
                            status: status,
                          ),
                        ),
                      );
                    } else if (value == 'complete') {
                      ref.read(projectNotifierProvider.notifier).completeProject(project.id!);
                    } else if (value == 'delete') {
                      showDialog(
                        context: context,
                        builder: (ctx) => DeleteProjectDialog(projectId: project.id!),
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text(
                        AppLocalizations.of(context)!.editProject,
                        style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'complete',
                      child: Text(
                        AppLocalizations.of(context)!.markAsCompleted,
                        style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const PopupMenuDivider(color: AppColors.borderDefault),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(
                        AppLocalizations.of(context)!.deleteProject,
                        style: TextStyle(color: AppColors.errorSoft, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  child: const Icon(Icons.more_vert_outlined, size: 18, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.event, size: 13, color: Colors.grey),
                    SizedBox(width: 2),
                    Text(
                      project.deadline != null
                          ? '${project.deadline!.month.toString()}/${project.deadline!.day.toString().padLeft(2, '0')}'
                          : 'no deadline',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    const Icon(Icons.access_time, size: 13, color: Colors.grey),
                    SizedBox(width: 2),
                    Text(
                      totalHours != null
                          ? '${totalHours % 1 == 0 ? totalHours.toInt() : totalHours.toStringAsFixed(1)}h'
                          : '-',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    // SizedBox(width: AppSpacing.sm),
                  ],
                ),
                Row(
                  children: [
                    StatusBadge(status: status),
                    if (status != ProjectStatus.completed && ddayInfo != null) ...[
                      SizedBox(width: AppSpacing.sm),
                      DDayBadge(info: ddayInfo),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
