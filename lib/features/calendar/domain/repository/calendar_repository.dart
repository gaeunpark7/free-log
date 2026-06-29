import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';

abstract interface class CalendarRepository {
  Future<List<Map<String, dynamic>>> getMonthlyTimeEntries(int year, int month);
  Future<List<Map<String, dynamic>>> getMonthlyIncomes(int year, int month);
  Future<List<Map<String, dynamic>>> getMonthlyExpenses(int year, int month);
}
