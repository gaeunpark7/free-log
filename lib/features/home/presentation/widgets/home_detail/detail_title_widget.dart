import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/status_badge.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';

class DetailTitleWidget extends StatelessWidget {
  final ProjectModel project;

  const DetailTitleWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(project.title, style: AppTextStyles.headline(context).copyWith(color: Colors.white)),
        StatusBadge(status: project.status),
      ],
    );
  }
}
