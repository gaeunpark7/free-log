import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/features/auth/presentation/providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (prev, next) {
      if (prev?.hasError != true && next.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('구글 로그인 실패: ${next.error}')));
      }
    });

    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Free Log',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              _buildLoginButton(Color(0xffFEE500), 'Login with Kakao'),
              if (authState.isLoading) const CircularProgressIndicator(),
              _buildLoginButton(
                Color(0xfff2f2f2),
                'Sign in with Google',
                onPressed: authState.isLoading
                    ? null
                    : () => ref
                          .read(authNotifierProvider.notifier)
                          .signInWithGoogle(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FilledButton _buildLoginButton(
    Color color,
    String text, {
    VoidCallback? onPressed,
  }) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed ?? () {},
      child: Text(text, style: TextStyle(color: Colors.black)),
    );
  }
}
