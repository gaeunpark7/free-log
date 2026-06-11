import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/features/home/domain/model/todos_model.dart';
import 'package:free_log/features/home/domain/repository/todos_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodosRepositoryImpl extends BaseRepository implements TodosRepository {
  TodosRepositoryImpl(this._supabase);
  final SupabaseClient _supabase;

  @override
  Future<List<TodosModel>> getTodo(String projectId) async {
    return execute(() async {
      final reponse = await _supabase.from('todos').select().eq('project_id', projectId).order('created_at', ascending: true);
      return reponse.map(TodosModel.fromJson).toList();
    }, errorMessage: '작업을 불러오지 못했습니다.');
  }

  @override
  Future<void> addTodo(String projectId, String content) async {
    return execute(() async {
      await _supabase.from('todos').insert({'project_id': projectId, 'content': content, 'is_done': false});
    }, errorMessage: '작업을 추가하지 못했습니다. 다시 시도해주세요.');
  }

  @override
  Future<void> updateTodo(String id, String content) async {
    return execute(() async {
      await _supabase.from('todos').update({'content': content}).eq('id', id);
    }, errorMessage: '작업 내역을 수정하지 못했습니다. 다시 시도해주세요.');
  }

  @override
  Future<void> deleteTodo(String id) async {
    return execute(() async {
      await _supabase.from('todos').delete().eq('id', id);
    }, errorMessage: '작업 내역을 삭제하지 못했습니다. 다시 시도해주세요.');
  }

  @override
  Future<void> completedTodo(String id, bool isDone) async {
    await _supabase.from('todos').update({'is_done': isDone}).eq('id', id);
  }
}
