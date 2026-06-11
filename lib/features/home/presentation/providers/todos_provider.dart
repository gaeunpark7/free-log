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
    final trimmed = content.trim();
    if (trimmed.isEmpty) {
      return;
    }
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.addTodo(arg, trimmed);
      return _repo.getTodo(arg);
    });
  }

  Future<void> updateTodo(String id, String content) async {
    final trimmed = content.trim();
    if (trimmed.isEmpty) {
      return;
    }
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.updateTodo(id, trimmed);
      return _repo.getTodo(arg);
    });
  }

  Future<void> deleteTodo(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.deleteTodo(id);
      return _repo.getTodo(arg);
    });
  }

  Future<void> completedTodo(String id, bool isDone) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.completedTodo(id, isDone);
      return _repo.getTodo(arg);
    });
  }
}
