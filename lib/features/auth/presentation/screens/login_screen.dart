import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_handler.dart';
import 'package:free_log/core/router/route_paths.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/auth/presentation/providers/auth_provider.dart';
import 'package:free_log/features/auth/presentation/widgets/login_button_widget.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (prev, next) {
      if (prev != next && next is AsyncError) {
        ErrorHandler.showSnackBar(context, next.error);
      }
    });

    // final authState = ref.watch(authStateProvider);
    final googleLoading = ref.watch(googleLoadingProvider);
    final kakaoLoading = ref.watch(kakaoLoadingProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'assets/icon/splash_icon2.png',
                  width: 90,
                  height: 90,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Freelog',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.loginSubTitle,
                style: AppTextStyles.subTitleBold(
                  context,
                ).copyWith(color: const Color(0xFFA89B89)),
              ),

              const SizedBox(height: 50),
              LoginButtonWidget(
                color: const Color(0xfff2f2f2),
                image: 'assets/icon/google_icon.png',
                text: AppLocalizations.of(context)!.loginGoogle,
                isLoading: googleLoading,
                onPressed: () =>
                    ref.read(authNotifierProvider.notifier).signInWithGoogle(),
              ),
              const SizedBox(height: 8),
              LoginButtonWidget(
                color: const Color(0xffFEE500),
                image: 'assets/icon/kakao_icon.png',
                text: AppLocalizations.of(context)!.loginKakao,
                isLoading: kakaoLoading,
                onPressed: () =>
                    ref.read(authNotifierProvider.notifier).signInWithKakao(),
              ),
              const SizedBox(height: 2),
              InkWell(
                onTap: () {
                  context.push('${RoutePaths.login}/${RoutePaths.privacy}');
                },
                child: Text(
                  AppLocalizations.of(context)!.privacyPolicy,
                  style: AppTextStyles.caption(
                    context,
                  ).copyWith(color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
