import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/router/login_routes.dart';
import 'package:free_log/core/router/profile_routes.dart';
import 'package:free_log/core/router/route_paths.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/auth/domain/model/auth_status.dart';
import 'package:free_log/features/auth/presentation/screens/loading_screen.dart';
import 'package:free_log/features/auth/presentation/screens/profile_setting_screen.dart';
import 'package:free_log/features/calculator/presentation/screen/calculator_screen.dart';
import 'package:free_log/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/presentation/screens/home_detail_screen.dart';
import 'package:free_log/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:free_log/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:free_log/features/profile/presentation/providers/profile_provider.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = ValueNotifier<int>(0);
  ref.onDispose(refreshNotifier.dispose);

  ref.listen(authStateProvider, (prev, next) {
    ref.invalidate(profileProvider);
    refreshNotifier.value++;
  });
  ref.listen(profileProvider, (prev, next) {
    refreshNotifier.value++;
  });

  return GoRouter(
    initialLocation: RoutePaths.login,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final authStatus = ref.watch(authStateProvider).valueOrNull;
      final isLoggedIn = authStatus == AuthStatus.authenticated;

      final matchedLocation = state.matchedLocation;
      final isLoginRoute = matchedLocation == RoutePaths.login;
      final isPublicAuthRoute =
          matchedLocation == RoutePaths.login || matchedLocation.startsWith('${RoutePaths.login}/');
      final isLoadingRoute = matchedLocation == RoutePaths.loading;
      final isProfileSettingRoute = matchedLocation == RoutePaths.profileSetting;
      final asyncProfile = ref.watch(profileProvider);
      final nickname = asyncProfile.valueOrNull?.nickname?.trim();
      final hasNickname = nickname != null && nickname.isNotEmpty;

      // 로그인 안됐으면 login으로
      if (!isLoggedIn && !isPublicAuthRoute) return RoutePaths.login;

      if (!isLoggedIn) return null;

      // 로그인 직후 프로필 확인 중이거나, 프로필 저장 중이면 로딩 화면으로
      if (asyncProfile.isLoading) {
        return isLoadingRoute ? null : RoutePaths.loading;
      }

      // 닉네임이 없으면 profile setting으로
      if (!hasNickname) {
        return isProfileSettingRoute ? null : RoutePaths.profileSetting;
      }

      // 닉네임이 있는데 login/loading/profile setting 화면에 있으면 home으로
      if (isLoginRoute || isLoadingRoute || isProfileSettingRoute) {
        return RoutePaths.home;
      }

      return null;
    },
    routes: [
      buildLoginRoutes(),
      GoRoute(path: RoutePaths.loading, builder: (_, _) => const LoadingScreen()),
      GoRoute(path: RoutePaths.profileSetting, builder: (_, _) => ProfileSettingsScreen()),
      ShellRoute(
        builder: (context, state, child) => BottomNavBar(child: child),
        routes: [
          GoRoute(path: RoutePaths.home, builder: (_, _) => const HomeScreen()),
          GoRoute(path: RoutePaths.calendar, builder: (_, _) => const CalendarScreen()),
          GoRoute(path: RoutePaths.calculator, builder: (_, _) => const CalculatorScreen()),
          buildProfileRoutes(),
        ],
      ),
      GoRoute(
        path: RoutePaths.homeDetail,
        builder: (context, state) {
          final projectId = state.pathParameters['projectId']!;
          final project = state.extra as ProjectModel;
          return HomeDetailScreen(projectId: projectId, project: project);
        },
      ),
    ],
  );
});
