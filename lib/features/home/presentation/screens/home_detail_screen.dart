import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/main/detail_time_entries_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/detail_title_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todos/detail_todos_widget.dart';

class HomeDetailScreen extends ConsumerStatefulWidget {
  final ProjectModel project;
  final String projectId;
  const HomeDetailScreen({super.key, required this.projectId, required this.project});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends ConsumerState<HomeDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        title: DetailTitleWidget(project: widget.project),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DefaultTabController(length: 2, child: DetailTodosWidget(projectId: widget.projectId)),
              const SizedBox(height: 12),
              DetailTimeEntries(projectId: widget.projectId),
              // SectionContainer(title: '작업시간', actionLabel: '+ 추가', child: Text('12h')),
            ],
          ),
        ),
      ),
    );
  }
}
