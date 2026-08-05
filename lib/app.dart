import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_log/core/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/services/fcm_service.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/auth/domain/model/auth_status.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FrelogApp extends ConsumerWidget {
  const FrelogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authStateProvider, (prev, next) {
      final prevStatus = prev?.valueOrNull;
      final nextStatus = next.valueOrNull;
      // 로그아웃 상태에서 로그인 상태로 실제로 전환될 때만 FCM 토큰 저장
      if (nextStatus == AuthStatus.authenticated && prevStatus != AuthStatus.authenticated) {
        FcmService(Supabase.instance.client).initialize();
      }
    });
    final router = ref.watch(appRouterProvider);

    return ScreenUtilInit(
      designSize: const Size(411, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
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
      ),
    );
  }
}
