import 'package:flutter/material.dart';
import 'package:free_log/core/router/route_paths.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/widgets/app_content_layout_widget.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final Widget child;
  const BottomNavBar({super.key, required this.child});

  int _selectedIndex(String location) {
    if (location.startsWith(RoutePaths.home)) return 0;
    if (location.startsWith(RoutePaths.calendar)) return 1;
    if (location.startsWith(RoutePaths.calculator)) return 2;
    if (location.startsWith(RoutePaths.profile)) return 3;
    return 0;
  }

  void _onTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(RoutePaths.home);
        break;
      case 1:
        context.go(RoutePaths.calendar);
        break;
      case 2:
        context.go(RoutePaths.calculator);
        break;
      case 3:
        context.go(RoutePaths.profile);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    return Scaffold(
      body: AppContentlayout(child: child),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.white,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(color: AppColors.primary);
          }
          return const TextStyle(color: Colors.grey);
        }),
        selectedIndex: _selectedIndex(location),
        onDestinationSelected: (index) => _onTap(index, context),
        animationDuration: const Duration(milliseconds: 300),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.grey),
            selectedIcon: Icon(Icons.home, color: AppColors.primary),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined, color: Colors.grey),
            selectedIcon: Icon(Icons.calendar_today, color: AppColors.primary),
            label: '캘린더',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate_outlined, color: Colors.grey),
            selectedIcon: Icon(Icons.calculate, color: AppColors.primary),
            label: '계산기',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: Colors.grey),
            selectedIcon: Icon(Icons.person, color: AppColors.primary),
            label: '내 정보',
          ),
        ],
      ),
    );
  }
}
