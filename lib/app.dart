import 'package:flutter/material.dart';
import 'package:free_log/core/router/app_router.dart';
import 'package:free_log/core/theme/app_theme.dart';

class FrelogApp extends StatelessWidget {
  const FrelogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //다국어
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,

      // 라우팅
      routerConfig: appRouter,

      // 테마
      theme: AppTheme.lightTheme,
    );
  }
}
