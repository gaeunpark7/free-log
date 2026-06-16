import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/domain/repository/expense_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExpenseRepositoryImpl extends BaseRepository implements ExpenseRepository {
  final SupabaseClient _supabase;

  ExpenseRepositoryImpl(this._supabase);

  @override
  Future<List<ExpenseModel>> getExpense(String projectId) async {
    return execute(() async {
      final response = await _supabase.from('expense_entries').select().eq('project_id', projectId).order('spent_at', ascending: false);
      return response.map(ExpenseModel.fromJson).toList();
    }, errorMessage: '지출 내역을 불러오지 못했습니다.');
  }

  @override
  Future<void> addExpense(String projectId, String description, double amount, DateTime spentAt) async {
    return execute(() async {
      await _supabase.from('expense_entries').insert({'project_id': projectId, 'description': description, 'amount': amount, 'spent_at': spentAt.toUtc().toIso8601String()});
    }, errorMessage: '지출을 추가하지 못했습니다. 다시 시도해주세요.');
  }

  @override
  Future<void> updateExpense(String id, String description, double amount, DateTime spentAt) async {
    return execute(() async {
      await _supabase.from('expense_entries').update({'description': description, 'amount': amount, 'spent_at': spentAt.toUtc().toIso8601String()}).eq('id', id);
    }, errorMessage: '수정에 실패하였습니다. 다시 시도해주세요.');
  }

  @override
  Future<void> deleteExpense(String id) async {
    return execute(() async {
      await _supabase.from('expense_entries').delete().eq('id', id);
    }, errorMessage: '삭제에 실패하였습니다. 다시 시도해주세요.');
  }
}
