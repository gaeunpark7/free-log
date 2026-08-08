import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/calendar/data/repository/calendar_repository_impl.dart';
import 'package:free_log/features/calendar/domain/model/calendar_data_model.dart';
import 'package:free_log/features/calendar/domain/model/calendar_detail_model.dart';
import 'package:free_log/features/calendar/domain/repository/calendar_repository.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:free_log/features/home/presentation/providers/project_provider.dart';

final calendarRepoProvider = Provider<CalendarRepository>(
  (ref) => CalendarRepositoryImpl(ref.watch(supabaseClientProvider)),
);

final calendarNotifierProvider =
    AsyncNotifierProvider<CalendarProvider, Map<DateTime, CalendarDataModel>>(
      CalendarProvider.new,
    );

class CalendarProvider extends AsyncNotifier<Map<DateTime, CalendarDataModel>> {
  CalendarRepository get _repo => ref.read(calendarRepoProvider);

  int _year = DateTime.now().year;
  int _month = DateTime.now().month;

  @override
  FutureOr<Map<DateTime, CalendarDataModel>> build() =>
      _loadMonth(_year, _month);

  Future<void> changeMonth(int year, int month) async {
    _year = year;
    _month = month;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadMonth(year, month));
  }

  Future<Map<DateTime, CalendarDataModel>> _loadMonth(
    int year,
    int month,
  ) async {
    final (timeEntries, incomes, expenses, projects) = await _fetchAll(
      year,
      month,
    );

    final projectMap = <String, String>{
      for (final p in projects)
        if (p.id != null) p.id!: p.title,
    };

    return _groupByDate(timeEntries, incomes, expenses, projectMap);
  }

  Future<
    (
      List<TimeEntryModel>,
      List<IncomeModel>,
      List<ExpenseModel>,
      List<ProjectModel>,
    )
  >
  _fetchAll(int year, int month) async {
    try {
      return await (
        _repo.getMonthlyTimeEntries(year, month),
        _repo.getMonthlyIncomes(year, month),
        _repo.getMonthlyExpenses(year, month),
        ref.read(projectNotifierProvider.future),
      ).wait;
    } on ParallelWaitError catch (e) {
      final errors = e.errors as dynamic;
      final firstError = errors.$1 ?? errors.$2 ?? errors.$3 ?? errors.$4;
      throw firstError as Object;
    }
  }

  Map<DateTime, CalendarDataModel> _groupByDate(
    List<TimeEntryModel> timeEntries,
    List<IncomeModel> incomes,
    List<ExpenseModel> expenses,
    Map<String, String> projectMap,
  ) {
    final result = <DateTime, CalendarDataModel>{};
    DateTime dateOnly(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

    for (final entry in timeEntries) {
      if (entry.workedAt == null) continue;
      final key = dateOnly(entry.workedAt!.toLocal());
      final existing = result[key] ?? const CalendarDataModel();
      final projectName = projectMap[entry.projectId] ?? '';

      // 같은 프로젝트는 합산
      final entries = existing.timeEntries.toList();
      final idx = entries.indexWhere((e) => e.projectName == projectName);

      if (idx >= 0) {
        entries[idx] = entries[idx].copyWith(
          totalMinutes: entries[idx].totalMinutes + entry.minutes,
        );
      } else {
        entries.add(
          TimeEntryDetail(
            projectName: projectName,
            totalMinutes: entry.minutes,
          ),
        );
      }

      result[key] = existing.copyWith(
        minutes: existing.minutes + entry.minutes,
        timeEntries: entries,
      );
    }

    for (final income in incomes) {
      final key = dateOnly(income.receivedAt.toLocal());
      final existing = result[key] ?? const CalendarDataModel();
      result[key] = existing.copyWith(
        income: existing.income + income.amount,
        incomes: [
          ...existing.incomes,
          IncomeDetail(
            description: income.description,
            projectName: projectMap[income.projectId] ?? '',
            amount: income.amount,
          ),
        ],
      );
    }

    for (final expense in expenses) {
      final key = dateOnly(expense.spentAt.toLocal());
      final existing = result[key] ?? const CalendarDataModel();
      result[key] = existing.copyWith(
        expense: existing.expense + expense.amount,
        expenses: [
          ...existing.expenses,
          ExpenseDetail(
            description: expense.description,
            projectName: projectMap[expense.projectId] ?? '',
            amount: expense.amount,
          ),
        ],
      );
    }

    return result;
  }
}
