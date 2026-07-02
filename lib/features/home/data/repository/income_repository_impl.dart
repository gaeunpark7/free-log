import 'package:free_log/core/error/base_repository.dart';
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
    }, errorMessage: '수입 내역을 불러오지 못했습니다.');
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
    }, errorMessage: '추가에 실패하였습니다. 다시 시도해주세요.');
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
    }, errorMessage: '수정에 실패하였습니다. 다시 시도해주세요.');
  }

  @override
  Future<void> deleteIncome(String id) {
    return execute(() async {
      await _supabase.from('income_entries').delete().eq('id', id);
    }, errorMessage: '삭제에 실패하였습니다. 다시 시도해주세요.');
  }
}
