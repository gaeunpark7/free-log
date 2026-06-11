import 'package:free_log/features/home/domain/model/time_entry_model.dart';

abstract interface class TimeEntryRepository {
  Future<List<TimeEntryModel>> getTimeEntries(String projectId);
  Future<void> addTimeEntry(String projectId, DateTime workedAt, double hours);
  Future<void> updateTimeEntry(String id, DateTime workedAt, double hours);
  Future<void> deleteTimeEntry(String id);
}
