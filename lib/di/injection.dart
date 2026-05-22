// 구글 로그인 인스턴스
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
    // Web에서는 clientId가 필요합니다.
    clientId: kIsWeb ? webClientId : null,
    // Android/iOS에서는 보통 serverClientId에 Web Client ID를 넣습니다.
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
