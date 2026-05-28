import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/features/auth/data/repository/auth_repository_impl.dart';
import 'package:free_log/features/auth/domain/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  final webClientId = dotenv.get('WEB_CLIENT_ID');
  return GoogleSignIn(
    clientId: kIsWeb ? webClientId : null,
    serverClientId: kIsWeb ? null : webClientId,
    scopes: const ['email', 'openid', 'profile'],
  );
});

// Auth Repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.watch(supabaseClientProvider),
    ref.watch(googleSignInProvider),
  );
});
//인증 상태 관리
final authStateProvider = StreamProvider<Session?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});
final googleLoadingProvider = StateProvider<bool>((ref) => false);
final kakaoLoadingProvider = StateProvider<bool>((ref) => false);
