// features/auth/presentation/providers/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:free_log/di/injection.dart';

// 인증 상태 감지
final authStateProvider = StreamProvider<Session?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});
//로그인 상태 관리
final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, void>(() {
  return AuthNotifier();
});
final googleLoadingProvider = StateProvider<bool>((ref) => false);
final kakaoLoadingProvider = StateProvider<bool>((ref) => false);

class AuthNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signInWithGoogle(),
    );
    ref.read(googleLoadingProvider.notifier).state = false;
  }

  Future<void> signInWithKakao() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signInWithKakao(),
    );
    ref.read(kakaoLoadingProvider.notifier).state = false;
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signOut(),
    );
  }
}
