import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/core/error/error_code.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/domain/repository/income_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IncomeRepositoryImpl extends BaseRepository implements IncomeRepository {
  final SupabaseClient _supabase;
  IncomeRepositoryImpl(this._supabase);

  @override
  Future<List<IncomeModel>> getIncome(String projectId) {
    return execute(() async {
      final reponse = await _supabase
          .from('income_entries')
          .select()
          .eq('project_id', projectId)
          .order('received_at', ascending: false);
      return reponse.map(IncomeModel.fromJson).toList();
    }, errorCode: ErrorCode.fetchFailed);
  }

  @override
  Future<void> addIncome(
    String projectId,
    String description,
    int amount,
    DateTime receivedAt,
  ) async {
    return execute(() async {
      await _supabase
          .from('income_entries')
          .insert({
            'project_id': projectId,
            'description': description,
            'amount': amount,
            'received_at': receivedAt.toUtc().toIso8601String(),
          })
          .eq('project_id', projectId);
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<void> updateIncome(String id, String description, int amount, DateTime receivedAt) {
    return execute(() async {
      await _supabase
          .from('income_entries')
          .update({
            'description': description,
            'amount': amount,
            'received_at': receivedAt.toUtc().toIso8601String(),
          })
          .eq('id', id);
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<void> deleteIncome(String id) {
    return execute(() async {
      await _supabase.from('income_entries').delete().eq('id', id);
    }, errorCode: ErrorCode.saveFailed);
  }
}
