import 'package:free_log/features/home/domain/model/todos_model.dart';

abstract interface class TodosRepository {
  Future<List<TodosModel>> getTodo(String projectId);
  Future<void> addTodo(String projectId, String content);
  Future<void> completedTodo(String id, bool isDone);
  Future<void> updateTodo(String id, String content);
  Future<void> deleteTodo(String id);
}
