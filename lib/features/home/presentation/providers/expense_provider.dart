import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/calendar/presentation/providers/calendar_provider.dart';
import 'package:free_log/features/home/data/repository/expense_repository_impl.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/domain/repository/expense_repository.dart';
import 'package:free_log/features/profile/presentation/providers/profile_stats_provider.dart';

final expenseRepoProvider = Provider<ExpenseRepository>(
  (ref) => ExpenseRepositoryImpl(ref.watch(supabaseClientProvider)),
);
final expenseNotifierProvider =
    AsyncNotifierProviderFamily<ExpenseProvider, List<ExpenseModel>, String>(ExpenseProvider.new);

class ExpenseProvider extends FamilyAsyncNotifier<List<ExpenseModel>, String> {
  ExpenseRepository get _repo => ref.read(expenseRepoProvider);

  @override
  FutureOr<List<ExpenseModel>> build(String arg) {
    return _repo.getExpense(arg);
  }

  Future<void> addExpense(String description, int amount, DateTime spentAt) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.addExpense(arg, description, amount, spentAt);
      ref.invalidate(calendarNotifierProvider);
      ref.invalidate(profileStatsProvider);
      return await _repo.getExpense(arg);
    });
  }

  Future<void> updateExpense(String id, String description, int amount, DateTime spentAt) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.updateExpense(id, description, amount, spentAt);
      ref.invalidate(calendarNotifierProvider);
      ref.invalidate(profileStatsProvider);

      return await _repo.getExpense(arg);
    });
  }

  Future<void> deleteExpense(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.deleteExpense(id);
      ref.invalidate(calendarNotifierProvider);
      ref.invalidate(profileStatsProvider);

      return await _repo.getExpense(arg);
    });
  }
}
