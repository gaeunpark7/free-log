import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/profile/data/repository/profile_repository_impl.dart';
import 'package:free_log/features/profile/domain/model/user_model.dart';
import 'package:free_log/features/profile/domain/repository/profile_repository.dart';

final profileRepoProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepositoryImpl(ref.watch(supabaseClientProvider)),
);
final profileProvider = AsyncNotifierProvider<ProfileNotifier, UserModel?>(ProfileNotifier.new);

class ProfileNotifier extends AsyncNotifier<UserModel?> {
  ProfileRepository get _repo => ref.read(profileRepoProvider);

  @override
  FutureOr<UserModel?> build() {
    return _repo.getProfile();
  }

  Future<void> updateProfile(
    String? nickname,
    int? hourlyRate,
    double? marginRate,
    bool? notifyDeadline,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.updateProfile(
        nickname: nickname,
        hourlyRate: hourlyRate,
        marginRate: marginRate,
        notifyDeadline: notifyDeadline,
      );
      return _repo.getProfile();
    });
  }
}
