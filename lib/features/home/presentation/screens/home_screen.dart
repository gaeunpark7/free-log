import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_spacing.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/home/presentation/widgets/add_dialog/add_project_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: Responsive.containerHeight(context, 0.2),
            color: AppColors.primary,
            child: Padding(
              padding: Responsive.screenPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '내 작업',
                    style: TextStyle(
                      fontSize: AppTextStyles.displaySize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '진행중',
                        style: TextStyle(
                          fontSize: Responsive.fontSize(
                            context,
                            AppTextStyles.titleSize,
                          ),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        '5',
                        style: TextStyle(
                          fontSize: Responsive.fontSize(
                            context,
                            AppTextStyles.titleSize,
                          ),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Text('●', style: TextStyle(color: Colors.white)),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        '완료',
                        style: TextStyle(
                          fontSize: Responsive.fontSize(
                            context,
                            AppTextStyles.titleSize,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: _openAddProjectDialog,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
