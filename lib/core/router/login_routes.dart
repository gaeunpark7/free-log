import 'package:free_log/core/router/route_paths.dart';
import 'package:free_log/features/auth/presentation/screens/login_screen.dart';
import 'package:free_log/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:go_router/go_router.dart';

GoRoute buildLoginRoutes() => GoRoute(
  path: RoutePaths.login,
  builder: (_, _) => const LoginScreen(),
  routes: [GoRoute(path: RoutePaths.privacy, builder: (_, _) => const PrivacyPolicyScreen())],
);
