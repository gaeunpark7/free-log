import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_handler.dart';
import 'package:free_log/core/error/error_view.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/app_content_layout_widget.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/model/project_status.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/features/home/presentation/widgets/add_dialog/add_project_dialog.dart';
import 'package:free_log/features/home/presentation/widgets/home/empty_project_container.dart';
import 'package:free_log/features/home/presentation/widgets/home/home_button_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home/home_container_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home/home_title_widget.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  ProjectStatus? _selectedStatus;
  Future<void> _openAddProjectDialog() async {
    final message = await showDialog<String>(
      context: context,
      builder: (ctx) => const AddProjectDialog(),
    );

    if (!mounted || message == null || message.isEmpty) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final asyncProject = ref.watch(projectNotifierProvider);
    ref.listen(projectNotifierProvider, (prev, next) {
      if (next is AsyncError && prev is! AsyncError) {
        ErrorHandler.showSnackBar(context, next.error);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: AppContentlayout(
        child: Column(
          children: [
            //home header
            HomeTitleWidget(
              inProgressCount:
                  asyncProject.whenOrNull(
                    data: (projects) =>
                        projects.where((p) => p.status == ProjectStatus.inProgress).length,
                  ) ??
                  0,
              completedCount:
                  asyncProject.whenOrNull(
                    data: (projects) =>
                        projects.where((p) => p.status == ProjectStatus.completed).length,
                  ) ??
                  0,
            ),

            _buildButton(context),

            _buildListView(asyncProject, context),
          ],
        ),
      ),

      //floating button
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: _openAddProjectDialog,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Expanded _buildListView(AsyncValue<List<ProjectModel>> asyncProject, BuildContext context) {
    return Expanded(
      child: asyncProject.when(
        data: (value) {
          if (value.isEmpty) {
            return const EmptyProjectContainer();
          }
          final filterProjects = _selectedStatus == null
              ? value
              : value.where((project) => project.status == _selectedStatus).toList();
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: filterProjects.length,
            itemBuilder: (ctx, index) {
              final project = filterProjects[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: Responsive.horizontalPadding(context),
                  right: Responsive.horizontalPadding(context),
                  bottom: 8,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.push('/detail/${project.id}', extra: project);
                  },
                  child: HomeContainerWidget(project: project, status: project.status),
                ),
              );
            },
          );
        },
        error: (e, _) => ErrorView(message: ErrorHandler.getMessage(context, e)),
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
      ),
    );
  }

  Padding _buildButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          HomeButtonWidget(
            text: AppLocalizations.of(context)!.all,
            isSelected: _selectedStatus == null,
            onPressed: () {
              setState(() {
                _selectedStatus = null;
              });
            },
          ),
          const SizedBox(width: AppSpacing.sm),
          HomeButtonWidget(
            text: AppLocalizations.of(context)!.inProgress,
            isSelected: _selectedStatus == ProjectStatus.inProgress,
            onPressed: () {
              setState(() {
                _selectedStatus = ProjectStatus.inProgress;
              });
            },
          ),
          const SizedBox(width: AppSpacing.sm),
          HomeButtonWidget(
            text: AppLocalizations.of(context)!.completed,
            isSelected: _selectedStatus == ProjectStatus.completed,
            onPressed: () {
              setState(() {
                _selectedStatus = ProjectStatus.completed;
              });
            },
          ),
        ],
      ),
    );
  }
}
