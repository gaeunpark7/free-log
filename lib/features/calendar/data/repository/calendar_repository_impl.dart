import 'package:free_log/features/calendar/domain/repository/calendar_repository.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final SupabaseClient _supabase;

  CalendarRepositoryImpl(this._supabase);

  @override
  Future<List<TimeEntryModel>> getMonthlyTimeEntries(int year, int month) async {
    final start = DateTime(year, month, 1).toUtc().toIso8601String();
    final end = DateTime(year, month + 1, 1).toUtc().toIso8601String();

    final response = await _supabase.from('time_entries').select().gte('worked_at', start).lt('worked_at', end);

    return response.map(TimeEntryModel.fromJson).toList();
  }

  @override
  Future<List<IncomeModel>> getMonthlyIncomes(int year, int month) async {
    final start = DateTime(year, month, 1).toUtc().toIso8601String();
    final end = DateTime(year, month + 1, 1).toUtc().toIso8601String();
    final response = await _supabase.from('income_entries').select().gte('received_at', start).lt('received_at', end);

    return response.map(IncomeModel.fromJson).toList();
  }

  @override
  Future<List<ExpenseModel>> getMonthlyExpenses(int year, int month) async {
    final start = DateTime(year, month, 1).toUtc().toIso8601String();
    final end = DateTime(year, month + 1, 1).toUtc().toIso8601String();

    final response = await _supabase.from('expense_entries').select().gte('spent_at', start).lt('spent_at', end);
    return response.map(ExpenseModel.fromJson).toList();
  }
}
