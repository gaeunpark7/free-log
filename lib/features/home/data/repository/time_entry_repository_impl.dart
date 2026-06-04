import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/domain/repository/time_entry_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TimeEntryRepositoryImpl implements TimeEntryRepository {
  final SupabaseClient _supabase;

  TimeEntryRepositoryImpl(this._supabase);

  @override
  Future<List<TimeEntryModel>> getTimeEntries(String projectId) async {
    final response = await _supabase.from('time_entries').select().eq('project_id', projectId).order('worked_at', ascending: false);
    return response.map(TimeEntryModel.fromJson).toList();
  }

  @override
  Future<void> addTimeEntry(String projectId, DateTime workedAt, double hours) async {
    await _supabase.from('time_entries').insert({'project_id': projectId, 'worked_at': workedAt.toUtc().toIso8601String(), 'hours': hours});
  }

  @override
  Future<void> updateTimeEntry(String id, DateTime workedAt, double hours) async {
    await _supabase.from('time_entires').update({'worked_at': workedAt.toUtc().toIso8601String(), 'hours': hours}).eq('id', id);
  }

  @override
  Future<void> deleteTimeEntry(String id) async {
    await _supabase.from('time_entires').delete().eq('id', id);
  }

  @override
  Future<double> getTotalHours(String projectId) async {
    final response = await _supabase.from('time_entries').select().eq('project_id', projectId) as List<dynamic>?;
    if (response == null || response.isEmpty) return 0.0;
    return response.fold<double>(0.0, (double sum, e) => sum + ((e['hours'] ?? 0) as num).toDouble());
  }
}
