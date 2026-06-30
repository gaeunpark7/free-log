import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';

abstract interface class CalendarRepository {
  Future<List<TimeEntryModel>> getMonthlyTimeEntries(int year, int month);
  Future<List<IncomeModel>> getMonthlyIncomes(int year, int month);
  Future<List<ExpenseModel>> getMonthlyExpenses(int year, int month);
  Future<List<ProjectModel>> getProjects();
}
