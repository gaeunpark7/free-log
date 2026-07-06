import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:free_log/features/auth/domain/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient _supabase;
  final GoogleSignIn _googleSignIn;

  AuthRepositoryImpl(this._supabase, this._googleSignIn);

  // 구글 로그인
  @override
  Future<void> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        await _supabase.auth.signInWithOAuth(OAuthProvider.google, redirectTo: Uri.base.origin);
      } else {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) throw Exception('로그인 취소');

        final googleAuth = await googleUser.authentication;
        final idToken = googleAuth.idToken;
        final accessToken = googleAuth.accessToken;

        if (idToken == null) throw Exception('ID 토큰 없음');
        if (accessToken == null) {
          throw Exception('Access 토큰 없음 (플랫폼별 Google OAuth 설정/Client ID 설정을 확인하세요)');
        }

        await _supabase.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken,
        );
      }
    } on PlatformException catch (e) {
      final msg = [
        if (e.code.isNotEmpty) e.code,
        if (e.message?.isNotEmpty == true) e.message!,
      ].join(' - ');
      throw Exception('구글 로그인 실패: $msg');
    } catch (e) {
      throw Exception('구글 로그인 실패: $e');
    }
  }

  //카카오 로그인
  @override
  Future<void> signInWithKakao() async {
    try {
      await _supabase.auth.signInWithOAuth(
        OAuthProvider.kakao,
        redirectTo: kIsWeb ? Uri.base.origin : 'com.freelog://login-callback/',
      );
    } catch (e) {
      throw Exception('카카오 로그인 실패: $e');
    }
  }

  // 로그아웃
  @override
  Future<void> signOut() async {
    if (!kIsWeb) {
      await _googleSignIn.signOut();
    }
    await _supabase.auth.signOut();
  }

  // 인증 상태 스트림
  @override
  Stream<Session?> get authStateChanges {
    return _supabase.auth.onAuthStateChange.map((data) => data.session);
  }
}
