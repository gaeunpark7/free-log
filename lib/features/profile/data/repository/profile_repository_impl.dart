import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/core/error/error_code.dart';
import 'package:free_log/features/profile/domain/model/profile_stats_model.dart';
import 'package:free_log/features/profile/domain/model/user_model.dart';
import 'package:free_log/features/profile/domain/repository/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepositoryImpl extends BaseRepository implements ProfileRepository {
  final SupabaseClient _supabase;

  ProfileRepositoryImpl(this._supabase);

  @override
  Future<UserModel?> getProfile() async {
    return execute(() async {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return null;

      final response = await _supabase.from('user').select().eq('id', userId).maybeSingle();
      if (response == null) return null;

      return UserModel.fromJson(response);
    }, errorCode: ErrorCode.fetchFailed);
  }

  @override
  Future<void> updateProfile({
    String? nickname,
    int? hourlyRate,
    double? marginRate,
    bool? notifyDeadline,
  }) async {
    return execute(() async {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return;

      final Map<String, dynamic> updates = {};
      if (nickname != null) updates['nickname'] = nickname;
      if (hourlyRate != null) updates['hourly_rate'] = hourlyRate;
      if (marginRate != null) updates['margin_rate'] = marginRate;
      if (notifyDeadline != null) updates['notify_deadline'] = notifyDeadline;

      await _supabase.from('user').update(updates).eq('id', userId);
    }, errorCode: ErrorCode.saveFailed);
  }

  //전체 통계
  @override
  Future<ProfileStatsModel> getAllTimeStats() async {
    return execute(() async {
      final results = await Future.wait([
        _supabase.from('time_entries').select('minutes'),
        _supabase.from('income_entries').select('amount'),
        _supabase.from('expense_entries').select('amount'),
      ]);
      return _calculateStats(results[0] as List, results[1] as List, results[2] as List);
    });
  }

  //이번 달 통계
  @override
  Future<ProfileStatsModel> getMonthlyStats(int year, int month) async {
    return execute(() async {
      final start = DateTime(year, month, 1).toUtc().toIso8601String();
      final end = DateTime(year, month + 1, 1).toUtc().toIso8601String();

      final results = await Future.wait([
        _supabase
            .from('time_entries')
            .select('minutes')
            .gte('worked_at', start)
            .lt('worked_at', end),
        _supabase
            .from('income_entries')
            .select('amount')
            .gte('received_at', start)
            .lt('received_at', end),
        _supabase
            .from('expense_entries')
            .select('amount')
            .gte('spent_at', start)
            .lt('spent_at', end),
      ]);

      return _calculateStats(results[0] as List, results[1] as List, results[2] as List);
    }, errorCode: ErrorCode.fetchFailed);
  }

  //통계 계산
  ProfileStatsModel _calculateStats(List timeEntries, List incomes, List expenses) {
    final totalMinutes = timeEntries.fold(0, (sum, e) => sum + (e['minutes'] as num).toInt());
    final totalIncome = incomes.fold(0, (sum, e) => sum + (e['amount'] as num).toInt());
    final totalExpense = expenses.fold(0, (sum, e) => sum + (e['amount'] as num).toInt());

    return ProfileStatsModel(
      totalMinutes: totalMinutes,
      totalIncome: totalIncome,
      totalExpense: totalExpense,
    );
  }
}
