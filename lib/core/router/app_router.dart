import 'package:free_log/core/router/route_paths.dart';
import 'package:free_log/features/auth/presentation/screens/home_screen.dart';
import 'package:free_log/features/auth/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: RoutePaths.login,

  redirect: (context, state) {
    return null;
  },

  routes: [
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
