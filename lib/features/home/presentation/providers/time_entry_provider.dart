import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/calendar/presentation/providers/calendar_provider.dart';
import 'package:free_log/features/home/data/repository/time_entry_repository_impl.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/domain/repository/time_entry_repository.dart';

final timeEntryRepoProvider = Provider<TimeEntryRepository>(
  (ref) => TimeEntryRepositoryImpl(ref.watch(supabaseClientProvider)),
);
final timeEntryNotifierProvider =
    AsyncNotifierProviderFamily<
      TimeEntryProvider,
      List<TimeEntryModel>,
      String
    >(TimeEntryProvider.new);

class TimeEntryProvider
    extends FamilyAsyncNotifier<List<TimeEntryModel>, String> {
  TimeEntryRepository get _repo => ref.read(timeEntryRepoProvider);

  @override
  FutureOr<List<TimeEntryModel>> build(String projectId) {
    return _repo.getTimeEntries(projectId);
  }

  Future<void> addTimeEntry(DateTime workedAt, int hours, int minutes) async {
    final totalMinutes = TimeUtils.toTotalMinutes(hours, minutes);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.addTimeEntry(arg, workedAt, totalMinutes);
      ref.invalidate(calendarNotifierProvider);
      return _repo.getTimeEntries(arg);
    });
  }

  Future<void> updateTimeEntry(
    String id,
    DateTime workedAt,
    int hours,
    int minutes,
  ) async {
    final totalMinutes = TimeUtils.toTotalMinutes(hours, minutes);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.updateTimeEntry(id, workedAt, totalMinutes);
      ref.invalidate(calendarNotifierProvider);
      return _repo.getTimeEntries(arg);
    });
  }

  Future<void> deleteTimeEntry(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.deleteTimeEntry(id);
      return _repo.getTimeEntries(arg);
    });
  }
}
