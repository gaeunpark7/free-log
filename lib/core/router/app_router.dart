import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/router/login_routes.dart';
import 'package:free_log/core/router/profile_routes.dart';
import 'package:free_log/core/router/route_paths.dart';
import 'package:free_log/di/auth_provider_setup.dart';
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

  return GoRouter(
    initialLocation: RoutePaths.login,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final session = ref.watch(authStateProvider).valueOrNull;
      final isLoggedIn = session != null;
      final isLoginRoute = state.matchedLocation == RoutePaths.login;
      final isPublicAuthRoute =
          state.matchedLocation == RoutePaths.login ||
          state.matchedLocation.startsWith('${RoutePaths.login}/');
      final asyncProfile = ref.watch(profileProvider);
      final nickname = asyncProfile.valueOrNull?.nickname?.trim();
      final hasNickname = nickname != null && nickname.isNotEmpty;

      // 로그인 안됐으면 login으로
      if (!isLoggedIn && !isPublicAuthRoute) return RoutePaths.login;

      // 로그인은 했지만 닉네임이 없으면 profile setting으로
      if (isLoggedIn && !hasNickname && state.matchedLocation != RoutePaths.profileSetting) {
        return RoutePaths.profileSetting;
      }

      // 로그인 됐는데 login 페이지면 home으로
      if (isLoggedIn && isLoginRoute) return RoutePaths.home;

      // 닉네임을 이미 입력한 뒤 profile setting 화면에 있으면 home으로
      if (isLoggedIn && hasNickname && state.matchedLocation == RoutePaths.profileSetting) {
        return RoutePaths.home;
      }

      return null;
    },
    routes: [
      buildLoginRoutes(),
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
