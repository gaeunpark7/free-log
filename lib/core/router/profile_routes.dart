import 'package:free_log/core/router/route_paths.dart';
import 'package:free_log/features/profile/presentation/screens/delete_user_screen.dart';
import 'package:free_log/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:free_log/features/profile/presentation/screens/profile_detail_screen.dart';
import 'package:free_log/features/profile/presentation/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

GoRoute buildProfileRoutes() => GoRoute(
  path: RoutePaths.profile,
  builder: (_, _) => ProfileScreen(),
  routes: [
    GoRoute(
      path: RoutePaths.profileDetail,
      builder: (_, _) => ProfileDetailScreen(),
      routes: [
        GoRoute(path: RoutePaths.privacy, builder: (_, _) => PrivacyPolicyScreen()),
        GoRoute(path: RoutePaths.deleteUser, builder: (_, _) => DeleteUserScreen()),
      ],
    ),
  ],
);
