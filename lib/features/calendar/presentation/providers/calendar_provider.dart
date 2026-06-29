import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/calendar/data/repository/calendar_repository_impl.dart';
import 'package:free_log/features/calendar/domain/model/calendar_data_model.dart';
import 'package:free_log/features/calendar/domain/repository/calendar_repository.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';

final calendarRepoProvider = Provider<CalendarRepository>(
  (ref) => CalendarRepositoryImpl(ref.watch(supabaseClientProvider)),
);
final calendarNotifierProvider =
    AsyncNotifierProvider<CalendarProvider, Map<DateTime, CalendarDataModel>>(CalendarProvider.new);

class CalendarProvider extends AsyncNotifier<Map<DateTime, CalendarDataModel>> {
  CalendarRepository get _repo => ref.read(calendarRepoProvider);

  int _year = DateTime.now().year;
  int _month = DateTime.now().month;

  @override
  FutureOr<Map<DateTime, CalendarDataModel>> build() {
    return _loadMonth(_year, _month);
  }

  // 월 변경
  Future<void> changeMonth(int year, int month) async {
    _year = year;
    _month = month;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadMonth(year, month));
  }

  //데이터 로드
  Future<Map<DateTime, CalendarDataModel>> _loadMonth(int year, int month) async {
    final result = await Future.wait([
      _repo.getMonthlyTimeEntries(year, month),
      _repo.getMonthlyIncomes(year, month),
      _repo.getMonthlyExpenses(year, month),
    ]);

    final timeEntries = result[0] as List<TimeEntryModel>;
    final incomes = result[1] as List<IncomeModel>;
    final expenses = result[2] as List<ExpenseModel>;

    return _groupByDate(timeEntries, incomes, expenses);
  }

  //날짜 그룹핑
  Map<DateTime, CalendarDataModel> _groupByDate(
    List<TimeEntryModel> timeEntries,
    List<IncomeModel> incomes,
    List<ExpenseModel> expenses,
  ) {
    final Map<DateTime, CalendarDataModel> result = {};

    DateTime dateOnly(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

    for (final entry in timeEntries) {
      if (entry.workedAt == null) continue;

      final key = dateOnly(entry.workedAt!.toLocal());
      final existing = result[key] ?? CalendarDataModel();
      result[key] = existing.copyWith(hours: existing.hours + entry.hours);
    }
    for (final income in incomes) {
      final key = dateOnly(income.receivedAt.toLocal());
      final existing = result[key] ?? CalendarDataModel();
      result[key] = existing.copyWith(income: existing.income + income.amount);
    }

    for (final expense in expenses) {
      final key = dateOnly(expense.spentAt.toLocal());
      final existing = result[key] ?? CalendarDataModel();
      result[key] = existing.copyWith(expense: existing.expense + expense.amount);
    }
    return result;
  }
}
