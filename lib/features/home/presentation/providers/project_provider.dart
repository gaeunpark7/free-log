import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/home/data/repository/project_repository_impl.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/repository/project_repository.dart';

final repoProvider = Provider<ProjectRepository>((ref) => ProjectRepositoryImpl(ref.watch(supabaseClientProvider)));
final projectNotifierProvider = AsyncNotifierProvider<ProjectProvider, List<ProjectModel>>(ProjectProvider.new);

class ProjectProvider extends AsyncNotifier<List<ProjectModel>> {
  ProjectRepository get _repo => ref.read(repoProvider);

  @override
  FutureOr<List<ProjectModel>> build() async {
    await _repo.checkAndUpdateOverdue();
    return await _repo.getProject();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.checkAndUpdateOverdue();
      return _repo.getProject();
    });
  }

  Future<void> createProject(ProjectModel project) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _repo.createProject(project);
      // await _repo.checkAndUpdateOverdue();
      return _repo.getProject();
    });
  }
}
