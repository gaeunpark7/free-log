import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/core/error/error_code.dart';
import 'package:free_log/features/calendar/domain/repository/calendar_repository.dart';
import 'package:free_log/features/home/data/dto/expense_dto.dart';
import 'package:free_log/features/home/data/dto/income_dto.dart';
import 'package:free_log/features/home/data/dto/project_dto.dart';
import 'package:free_log/features/home/data/dto/time_entry_dto.dart';
import 'package:free_log/features/home/data/mapper/expense_dto_mapper.dart';
import 'package:free_log/features/home/data/mapper/income_dto_mapper.dart';
import 'package:free_log/features/home/data/mapper/project_dto_mapper.dart';
import 'package:free_log/features/home/data/mapper/time_entry_dto_mapper.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CalendarRepositoryImpl extends BaseRepository implements CalendarRepository {
  final SupabaseClient _supabase;

  CalendarRepositoryImpl(this._supabase);

  @override
  Future<List<ProjectModel>> getProjects() async {
    return execute(() async {
      final response = await _supabase.from('project').select('id, title');
      return response.map(ProjectDto.fromJson).map((dto) => dto.toEntity()).toList();
    }, errorCode: ErrorCode.fetchFailed);
  }

  @override
  Future<List<TimeEntryModel>> getMonthlyTimeEntries(int year, int month) async {
    return execute(() async {
      final start = DateTime(year, month, 1).toUtc().toIso8601String();
      final end = DateTime(year, month + 1, 1).toUtc().toIso8601String();

      final response = await _supabase
          .from('time_entries')
          .select()
          .gte('worked_at', start)
          .lt('worked_at', end);
      return response.map(TimeEntryDto.fromJson).map((dto) => dto.toEntity()).toList();
    }, errorCode: ErrorCode.fetchFailed);
  }

  @override
  Future<List<IncomeModel>> getMonthlyIncomes(int year, int month) async {
    return execute(() async {
      final start = DateTime(year, month, 1).toUtc().toIso8601String();
      final end = DateTime(year, month + 1, 1).toUtc().toIso8601String();
      final response = await _supabase
          .from('income_entries')
          .select()
          .gte('received_at', start)
          .lt('received_at', end);

      return response.map(IncomeDto.fromJson).map((dto) => dto.toEntity()).toList();
    }, errorCode: ErrorCode.fetchFailed);
  }

  @override
  Future<List<ExpenseModel>> getMonthlyExpenses(int year, int month) async {
    return execute(() async {
      final start = DateTime(year, month, 1).toUtc().toIso8601String();
      final end = DateTime(year, month + 1, 1).toUtc().toIso8601String();

      final response = await _supabase
          .from('expense_entries')
          .select()
          .gte('spent_at', start)
          .lt('spent_at', end);
      return response.map(ExpenseDto.fromJson).map((dto) => dto.toEntity()).toList();
    }, errorCode: ErrorCode.fetchFailed);
  }
}
