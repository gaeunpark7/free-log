import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:free_log/core/error/app_exception.dart';
import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/core/error/error_code.dart';
import 'package:free_log/features/auth/domain/model/auth_status.dart';
import 'package:free_log/features/auth/domain/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl(this._supabase, this._googleSignIn);
  final SupabaseClient _supabase;
  final GoogleSignIn _googleSignIn;

  // 구글 로그인
  @override
  Future<void> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        await _supabase.auth.signInWithOAuth(
          OAuthProvider.google,
          redirectTo: Uri.base.origin,
        );
      } else {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) return;

        final googleAuth = await googleUser.authentication;
        final idToken = googleAuth.idToken;
        final accessToken = googleAuth.accessToken;

        if (idToken == null || accessToken == null) {
          throw AppException('토큰 없음', code: ErrorCode.authError);
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
      throw AppException(msg, code: ErrorCode.authError);
    } catch (e) {
      throw AppException('구글 로그인 실패: $e', code: ErrorCode.authError);
    }
  }

  //카카오 로그인
  @override
  Future<void> signInWithKakao() async {
    return execute(() async {
      await _supabase.auth.signInWithOAuth(
        OAuthProvider.kakao,
        redirectTo: kIsWeb ? Uri.base.origin : 'com.freelog://login-callback/',
      );
    }, errorCode: ErrorCode.authError);
  }

  // 로그아웃
  @override
  Future<void> signOut() async {
    return execute(() async {
      if (!kIsWeb) await _googleSignIn.signOut();
      await _supabase.auth.signOut();
    }, errorCode: ErrorCode.unknownError);
  }

  // 인증 상태 스트림
  @override
  Stream<AuthStatus> get authStateChanges {
    return _supabase.auth.onAuthStateChange.map(
      (data) => data.session != null
          ? AuthStatus.authenticated
          : AuthStatus.unauthenticated,
    );
  }

  //회원탈퇴
  @override
  Future<void> deleteAccount() async {
    return execute(() async {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) {
        throw AppException('userId null', code: ErrorCode.authError);
      }
      //유저 데이터 삭제
      await _supabase.rpc('delete_account');

      //계정 삭제
      // await _supabase.auth.admin.deleteUser(userId);
    }, errorCode: ErrorCode.saveFailed);
  }
}
