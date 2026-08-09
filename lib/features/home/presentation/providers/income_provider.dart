import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/calendar/presentation/providers/calendar_provider.dart';
import 'package:free_log/features/home/data/repository/income_repository_impl.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/domain/repository/income_repository.dart';
import 'package:free_log/features/profile/presentation/providers/profile_stats_provider.dart';

final incomeRepoProvider = Provider<IncomeRepository>(
  (ref) => IncomeRepositoryImpl(ref.watch(supabaseClientProvider)),
);
final incomeNotifierProvider =
    AsyncNotifierProviderFamily<IncomeProvider, List<IncomeModel>, String>(IncomeProvider.new);

class IncomeProvider extends FamilyAsyncNotifier<List<IncomeModel>, String> {
  IncomeRepository get _repo => ref.read(incomeRepoProvider);

  @override
  FutureOr<List<IncomeModel>> build(String arg) {
    return _repo.getIncome(arg);
  }

  Future<void> addIncome(String description, int amount, DateTime receivedAt) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.addIncome(arg, description, amount, receivedAt);
      ref.invalidate(calendarNotifierProvider);
      ref.invalidate(profileStatsProvider);
      return await _repo.getIncome(arg);
    });
  }

  Future<void> updateIncome(String id, String description, int amount, DateTime receivedAt) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.updateIncome(id, description, amount, receivedAt);
      ref.invalidate(calendarNotifierProvider);
      ref.invalidate(profileStatsProvider);
      return await _repo.getIncome(arg);
    });
  }

  Future<void> deleteIncome(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.deleteIncome(id);
      ref.invalidate(calendarNotifierProvider);
      ref.invalidate(profileStatsProvider);
      return await _repo.getIncome(arg);
    });
  }
}
