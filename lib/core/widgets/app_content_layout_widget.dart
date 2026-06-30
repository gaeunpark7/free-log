import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';

class AppContentlayout extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;

  const AppContentlayout({super.key, required this.child, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: ColoredBox(color: AppColors.background, child: child),
      ),
    );
  }
}
