import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/detail_time_entries.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/detail_title_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todo/detail_todos_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/section_container.dart';

class HomeDetailScreen extends ConsumerStatefulWidget {
  final String projectId;
  const HomeDetailScreen({super.key, required this.projectId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeDetailScreenState();
}

class _HomeDetailScreenState extends ConsumerState<HomeDetailScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: DetailTitleWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DefaultTabController(
                length: 2,
                child: DetailTodosWidget(projectId: widget.projectId),
              ),
              const SizedBox(height: 12),
              DetailTimeEntries(),
              SectionContainer(
                title: '작업시간',
                actionLabel: '+ 추가',
                child: Text('12h'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
