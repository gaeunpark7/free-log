import 'package:flutter/material.dart';
import 'package:free_log/core/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/services/fcm_service.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FrelogApp extends ConsumerWidget {
  const FrelogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authStateProvider, (prev, next) {
      next.whenData((session) async {
        // 로그인 됐을 때 FCM 토큰 저장
        final fcmService = FcmService(Supabase.instance.client);
        await fcmService.initialize();
      });
    });
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      //다국어
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // 라우팅
      routerConfig: router,

      // 테마
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: Colors.white,
          surface: AppColors.background,
          onSurface: AppColors.textPrimary,
        ),
      ),
    );
  }
}
