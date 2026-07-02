import 'package:free_log/features/profile/domain/model/profile_stats_model.dart';
import 'package:free_log/features/profile/domain/model/user_model.dart';

abstract interface class ProfileRepository {
  Future<UserModel?> getProfile();
  Future<void> updateProfile({
    String? nickname,
    int? hourlyRate,
    double? marginRate,
    bool? notifyDeadline,
  });
  //통계
  Future<ProfileStatsModel> getMonthlyStats(int year, int month);
  Future<ProfileStatsModel> getAllTimeStats();
}
