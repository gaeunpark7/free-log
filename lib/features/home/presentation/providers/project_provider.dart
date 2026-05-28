import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/home/data/repository/project_repository_impl.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/repository/project_repository.dart';

final repoProvider = Provider<ProjectRepository>(
  (ref) => ProjectRepositoryImpl(ref.watch(supabaseClientProvider)),
);
final projectListProvider = FutureProvider<List<ProjectModel>>((ref) async {
  final repo = ref.watch(repoProvider);
  return repo.getProject();
});

final projectNotifierProvider = AsyncNotifierProvider<ProjectProvider, void>(
  ProjectProvider.new,
);

class ProjectProvider extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  Future<void> createProject(ProjectModel project) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(repoProvider).createProject(project);
      ref.invalidate(projectListProvider);
    });
  }
}
