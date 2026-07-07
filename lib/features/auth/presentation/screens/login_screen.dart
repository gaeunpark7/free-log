import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/auth/presentation/providers/auth_provider.dart';
import 'package:free_log/features/auth/presentation/widgets/login_button_widget.dart';
import 'package:free_log/l10n/app_localizations.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (prev, next) {
      if (prev != next && next is AsyncError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('로그인 실패: ${next.error}')));
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
              Image.asset('assets/icon/icon_log.png', width: 90, height: 90),
              // Icon(Icons.book, size: 70, color: AppColors.primary),
              SizedBox(height: 2),
              Text('Free Log', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),

              LoginButtonWidget(
                color: Color(0xfff2f2f2),
                image: 'assets/icon/google_icon.png',
                text: 'Sign in with Google',
                isLoading: googleLoading,
                onPressed: () => ref.read(authNotifierProvider.notifier).signInWithGoogle(),
              ),
              SizedBox(height: 8),
              LoginButtonWidget(
                color: Color(0xffFEE500),
                image: 'assets/icon/kakao_icon.png',
                text: 'Sign in with Kakao',
                isLoading: kakaoLoading,
                onPressed: () => ref.read(authNotifierProvider.notifier).signInWithKakao(),
              ),
              SizedBox(height: 2),
              Text(
                AppLocalizations.of(context)!.privacyPolicy,
                style: AppTextStyles.caption(context).copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
