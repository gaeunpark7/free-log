import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/core/error/error_code.dart';
import 'package:free_log/features/home/data/dto/time_entry_dto.dart';
import 'package:free_log/features/home/data/mapper/time_entry_dto_mapper.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/domain/repository/time_entry_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TimeEntryRepositoryImpl extends BaseRepository
    implements TimeEntryRepository {
  TimeEntryRepositoryImpl(this._supabase);
  final SupabaseClient _supabase;

  @override
  Future<List<TimeEntryModel>> getTimeEntries(String projectId) async {
    return execute(() async {
      final response = await _supabase
          .from('time_entries')
          .select()
          .eq('project_id', projectId)
          .order('worked_at', ascending: false);
      return response
          .map(TimeEntryDto.fromJson)
          .map((dto) => dto.toEntity())
          .toList();
    }, errorCode: ErrorCode.fetchFailed);
  }

  @override
  Future<void> addTimeEntry(
    String projectId,
    DateTime workedAt,
    int totalMinutes,
  ) async {
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
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<void> updateTimeEntry(
    String id,
    DateTime workedAt,
    int totalMinutes,
  ) async {
    return execute(() async {
      await _supabase
          .from('time_entries')
          .update({
            'worked_at': workedAt.toUtc().toIso8601String(),
            'minutes': totalMinutes,
          })
          .eq('id', id);
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<void> deleteTimeEntry(String id) async {
    return execute(() async {
      await _supabase.from('time_entries').delete().eq('id', id);
    }, errorCode: ErrorCode.saveFailed);
  }
}
