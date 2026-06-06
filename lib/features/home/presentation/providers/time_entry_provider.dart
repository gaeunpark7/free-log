import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/home/data/repository/time_entry_repository_impl.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/domain/repository/time_entry_repository.dart';

final timeEntryRepoProvider = Provider<TimeEntryRepository>((ref) => TimeEntryRepositoryImpl(ref.watch(supabaseClientProvider)));
final timeEntryNotifierProvider = AsyncNotifierProviderFamily<TimeEntryProvider, List<TimeEntryModel>, String>(TimeEntryProvider.new);

class TimeEntryProvider extends FamilyAsyncNotifier<List<TimeEntryModel>, String> {
  TimeEntryRepository get _repo => ref.read(timeEntryRepoProvider);

  @override
  FutureOr<List<TimeEntryModel>> build(String projectId) {
    return _repo.getTimeEntries(projectId);
  }

  Future<void> addTimeEntry(DateTime workedAt, double hours) async {
    try {
      await _repo.addTimeEntry(arg, workedAt, hours);
      ref.invalidateSelf();
    } catch (e) {
      throw Exception('추가 실패: $e');
    }
  }

  Future<void> updateTimeEntry(String id, DateTime workedAt, double hours) async {
    try {
      await _repo.updateTimeEntry(id, workedAt, hours);
      ref.invalidateSelf();
    } catch (e) {
      throw Exception('수정 실패: $e');
    }
  }

  Future<void> deleteTimeEntry(String id) async {
    try {
      await _repo.deleteTimeEntry(id);
      ref.invalidateSelf();
    } catch (e) {
      throw Exception('삭제 실패: $e');
    }
  }
}
