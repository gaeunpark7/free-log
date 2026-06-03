import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/home/data/repository/todos_repository_impl.dart';
import 'package:free_log/features/home/domain/model/todos_model.dart';
import 'package:free_log/features/home/domain/repository/todos_repository.dart';

final todoRepoProvider = Provider<TodosRepository>((ref) {
  return TodosRepositoryImpl(ref.watch(supabaseClientProvider));
});

final todoNotifierProvider = AsyncNotifierProviderFamily<TodosProvider, List<TodosModel>, String>(TodosProvider.new);

class TodosProvider extends FamilyAsyncNotifier<List<TodosModel>, String> {
  TodosRepository get _repo => ref.read(todoRepoProvider);

  @override
  FutureOr<List<TodosModel>> build(String projectId) async {
    return _repo.getTodo(projectId);
  }

  Future<void> addTodo(String content) async {
    try {
      final trimmed = content.trim();
      if (trimmed.isEmpty) {
        return;
      }
      await _repo.addTodo(arg, trimmed);
      ref.invalidateSelf();
    } catch (e) {
      throw Exception('추가 실패: $e');
    }
  }

  Future<void> updateTodo(String id, String content) async {
    try {
      final trimmed = content.trim();
      if (trimmed.isEmpty) {
        return;
      }
      await _repo.updateTodo(id, trimmed);
      ref.invalidateSelf();
    } catch (e) {
      throw Exception('수정 실패: $e');
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await _repo.deleteTodo(id);
      ref.invalidateSelf();
    } catch (e) {
      throw Exception('삭제 실패: $e');
    }
  }

  Future<void> completedTodo(String id, bool isDone) async {
    try {
      await _repo.completedTodo(id, isDone);
      ref.invalidateSelf();
    } catch (e) {
      throw Exception('완료 상태 변경 실패: $e');
    }
  }
}
