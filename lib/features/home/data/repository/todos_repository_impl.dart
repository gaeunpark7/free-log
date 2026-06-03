import 'package:free_log/features/home/domain/model/todos_model.dart';
import 'package:free_log/features/home/domain/repository/todos_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodosRepositoryImpl implements TodosRepository {
  TodosRepositoryImpl(this._supabase);
  final SupabaseClient _supabase;

  @override
  Future<List<TodosModel>> getTodo(String projectId) async {
    final reponse = await _supabase
        .from('todos')
        .select()
        .eq('project_id', projectId)
        .order('created_at', ascending: true);
    return reponse.map(TodosModel.fromJson).toList();
  }

  @override
  Future<void> addTodo(String projectId, String content) async {
    await _supabase.from('todos').insert({
      'project_id': projectId,
      'content': content,
      'is_done': false,
    });
  }

  @override
  Future<void> updateTodo(String id, String content) async {
    await _supabase.from('todos').update({'content': content}).eq('id', id);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _supabase.from('todos').delete().eq('id', id);
  }

  @override
  Future<void> completedTodo(String id, bool isDone) async {
    await _supabase.from('todos').update({'is_done': isDone}).eq('id', id);
  }
}
