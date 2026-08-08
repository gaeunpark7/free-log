import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/amount/calculate_amount.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/detail_title_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/expense/detail_expense_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/income/detail_income_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/time_entries/main/detail_time_entries_widget.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todos/detail_todos_widget.dart';

class HomeDetailScreen extends ConsumerStatefulWidget {
  const HomeDetailScreen({
    super.key,
    required this.projectId,
    required this.project,
  });
  final ProjectModel project;
  final String projectId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeDetailScreenState();
}

class _HomeDetailScreenState extends ConsumerState<HomeDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        title: DetailTitleWidget(project: widget.project),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: Responsive.screenPadding(context),
                child: Column(
                  children: [
                    DefaultTabController(
                      length: 2,
                      child: DetailTodosWidget(projectId: widget.projectId),
                    ),
                    const SizedBox(height: 12),
                    DetailTimeEntries(projectId: widget.projectId),
                    const SizedBox(height: 12),
                    DetailExpenseWidget(projectId: widget.projectId),
                    const SizedBox(height: 12),
                    DetailIncomeWidget(projectId: widget.projectId),
                    const SizedBox(height: 12),
                    CalculateAmount(project: widget.project),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
