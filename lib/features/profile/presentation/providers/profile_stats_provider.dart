import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/features/profile/domain/model/profile_stats_model.dart';
import 'package:free_log/features/profile/domain/repository/profile_repository.dart';
import 'package:free_log/features/profile/presentation/providers/profile_provider.dart';

enum StatsType { monthly, allTime }

final profileStatsProvider =
    AsyncNotifierProvider.family<ProfileStatsNotifier, ProfileStatsModel, StatsType>(
      ProfileStatsNotifier.new,
    );

class ProfileStatsNotifier extends FamilyAsyncNotifier<ProfileStatsModel, StatsType> {
  ProfileRepository get _repo => ref.read(profileRepoProvider);

  @override
  FutureOr<ProfileStatsModel> build(StatsType arg) {
    if (arg == StatsType.monthly) {
      final now = DateTime.now();
      return _repo.getMonthlyStats(now.year, now.month);
    }
    return _repo.getAllTimeStats();
  }
}
