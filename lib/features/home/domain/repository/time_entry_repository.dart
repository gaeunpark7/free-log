import 'package:free_log/features/home/domain/model/time_entries_model.dart';

abstract interface class TimeEntryRepository {
  Future<List<TimeEntriesModel>> getTimeEntries(String projectId);
  Future<void> addTimeEntry(String projectId, DateTime workedAt, double hours);
  Future<void> updateTimeEntry(String id, DateTime workedAt, double hours);
  Future<void> deleteTimeEntry(String id);
  Future<double> getTotalHours(String projectId);
}
