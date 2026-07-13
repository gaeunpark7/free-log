import 'package:free_log/features/auth/domain/model/auth_status.dart';

abstract class AuthRepository {
  Future<void> signInWithGoogle();
  Future<void> signInWithKakao();
  Future<void> signOut();
  Stream<AuthStatus> get authStateChanges;
}
