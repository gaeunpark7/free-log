import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/features/home/domain/model/project_status.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';
import 'package:free_log/features/home/presentation/widgets/add_dialog/add_project_dialog.dart';
import 'package:free_log/features/home/presentation/widgets/home/home_button_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home/home_container_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home/home_title_widget.dart';

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

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final asyncProject = ref.watch(projectNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          HomeTitleWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                HomeButtonWidget(
                  text: '전체',
                  onPressed: () {
                    setState(() {
                      _selectedStatus = null;
                    });
                  },
                ),
                SizedBox(width: AppSpacing.sm),
                HomeButtonWidget(
                  text: '진행중',
                  onPressed: () {
                    setState(() {
                      _selectedStatus = ProjectStatus.inProgress;
                    });
                  },
                ),
                SizedBox(width: AppSpacing.sm),
                HomeButtonWidget(
                  text: '완료',
                  onPressed: () {
                    setState(() {
                      _selectedStatus = ProjectStatus.completed;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: asyncProject.when(
              data: (value) {
                final filterProjects = _selectedStatus == null
                    ? value
                    : value
                          .where((project) => project.status == _selectedStatus)
                          .toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: filterProjects.length,
                  itemBuilder: (ctx, index) {
                    final project = filterProjects[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                        bottom: 8,
                        left: 16,
                        right: 16,
                      ),
                      child: HomeContainerWidget(
                        title: project.title,
                        deadline: project.deadline,
                        hourlyRate: project.hourlyRate,
                        status: project.status,
                      ),
                    );
                  },
                );
              },
              error: (e, _) => Center(child: Text('에러 발생: $e')),
              loading: () => Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: _openAddProjectDialog,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
