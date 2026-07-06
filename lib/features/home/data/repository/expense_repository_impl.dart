import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/core/error/error_code.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/domain/repository/expense_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExpenseRepositoryImpl extends BaseRepository implements ExpenseRepository {
  final SupabaseClient _supabase;

  ExpenseRepositoryImpl(this._supabase);

  @override
  Future<List<ExpenseModel>> getExpense(String projectId) async {
    return execute(() async {
      final response = await _supabase
          .from('expense_entries')
          .select()
          .eq('project_id', projectId)
          .order('spent_at', ascending: false);
      return response.map(ExpenseModel.fromJson).toList();
    }, errorCode: ErrorCode.fetchFailed);
  }

  @override
  Future<void> addExpense(
    String projectId,
    String description,
    int amount,
    DateTime spentAt,
  ) async {
    return execute(() async {
      await _supabase.from('expense_entries').insert({
        'project_id': projectId,
        'description': description,
        'amount': amount,
        'spent_at': spentAt.toUtc().toIso8601String(),
      });
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<void> updateExpense(String id, String description, int amount, DateTime spentAt) async {
    return execute(() async {
      await _supabase
          .from('expense_entries')
          .update({
            'description': description,
            'amount': amount,
            'spent_at': spentAt.toUtc().toIso8601String(),
          })
          .eq('id', id);
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<void> deleteExpense(String id) async {
    return execute(() async {
      await _supabase.from('expense_entries').delete().eq('id', id);
    }, errorCode: ErrorCode.saveFailed);
  }
}
