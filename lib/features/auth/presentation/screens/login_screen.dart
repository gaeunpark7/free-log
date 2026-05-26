import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/injection.dart';
import 'package:free_log/features/auth/presentation/providers/auth_provider.dart';
import 'package:free_log/features/auth/presentation/widgets/login_button_widget.dart';

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
              Icon(Icons.book, size: 64, color: Colors.blueGrey),
              Text(
                'Free Log',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              LoginButtonWidget(
                color: Color(0xffFEE500),
                icon: Icons.login,
                text: 'Sign in with Kakao',
                isLoading: kakaoLoading,
                onPressed: () =>
                    ref.read(authNotifierProvider.notifier).signInWithKakao(),
              ),
              SizedBox(height: 16),
              LoginButtonWidget(
                color: Color(0xfff2f2f2),
                icon: Icons.login,
                text: 'Sign in with Google',
                isLoading: googleLoading,
                onPressed: () =>
                    ref.read(authNotifierProvider.notifier).signInWithGoogle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
