import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/domain/repository/time_entry_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TimeEntryRepositoryImpl extends BaseRepository implements TimeEntryRepository {
  final SupabaseClient _supabase;

  TimeEntryRepositoryImpl(this._supabase);

  @override
  Future<List<TimeEntryModel>> getTimeEntries(String projectId) async {
    return execute(() async {
      final response = await _supabase
          .from('time_entries')
          .select()
          .eq('project_id', projectId)
          .order('worked_at', ascending: false);
      return response.map(TimeEntryModel.fromJson).toList();
    }, errorMessage: '시간 내역을 불러오지 못했습니다.');
  }

  @override
  Future<void> addTimeEntry(String projectId, DateTime workedAt, int totalMinutes) async {
    return execute(() async {
      final dayStart = DateTime(
        workedAt.year,
        workedAt.month,
        workedAt.day,
      ).toUtc().toIso8601String();
      final dayEnd = DateTime(
        workedAt.year,
        workedAt.month,
        workedAt.day + 1,
      ).toUtc().toIso8601String();

      final existing = await _supabase
          .from('time_entries')
          .select('id, minutes')
          .eq('project_id', projectId)
          .gte('worked_at', dayStart)
          .lt('worked_at', dayEnd)
          .maybeSingle();

      if (existing != null) {
        final mergedMinutes = (existing['minutes'] as int) + totalMinutes;
        await _supabase
            .from('time_entries')
            .update({'minutes': mergedMinutes})
            .eq('id', existing['id']);
      } else {
        await _supabase.from('time_entries').insert({
          'project_id': projectId,
          'worked_at': workedAt.toUtc().toIso8601String(),
          'minutes': totalMinutes,
        });
      }
    }, errorMessage: '시간을 추가하지 못했습니다. 다시 시도해주세요.');
  }

  @override
  Future<void> updateTimeEntry(String id, DateTime workedAt, int totalMinutes) async {
    return execute(() async {
      await _supabase
          .from('time_entries')
          .update({'worked_at': workedAt.toUtc().toIso8601String(), 'minutes': totalMinutes})
          .eq('id', id);
    }, errorMessage: '시간을 수정하지 못했습니다. 다시 시도해주세요.');
  }

  @override
  Future<void> deleteTimeEntry(String id) async {
    return execute(() async {
      await _supabase.from('time_entries').delete().eq('id', id);
    }, errorMessage: '시간을 삭제하지 못했습니다. 다시 시도해주세요.');
  }
}
