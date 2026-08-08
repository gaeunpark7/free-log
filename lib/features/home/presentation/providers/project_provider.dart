import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/di/auth_provider_setup.dart';
import 'package:free_log/features/calendar/presentation/providers/calendar_provider.dart';
import 'package:free_log/features/home/data/repository/project_repository_impl.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/repository/project_repository.dart';
import 'package:free_log/features/profile/presentation/providers/profile_provider.dart';

final repoProvider = Provider<ProjectRepository>(
  (ref) => ProjectRepositoryImpl(ref.watch(supabaseClientProvider)),
);
final projectNotifierProvider = AsyncNotifierProvider<ProjectProvider, List<ProjectModel>>(
  ProjectProvider.new,
);

class ProjectProvider extends AsyncNotifier<List<ProjectModel>> {
  ProjectRepository get _repo => ref.read(repoProvider);

  @override
  FutureOr<List<ProjectModel>> build() async {
    await _repo.autoCompleteProjects();
    return await _repo.getProject();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.autoCompleteProjects();
      return _repo.getProject();
    });
  }

  Future<void> createProject(ProjectModel project) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.createProject(project);

      //user 시급이 동일하지 않을 경우 user 시급 업데이트
      final currentHourlyRate = ref.read(profileProvider).valueOrNull?.hourlyRate;
      if (project.hourlyRate > 0 && project.hourlyRate != currentHourlyRate) {
        await ref.read(profileProvider.notifier).updateProfile(hourlyRate: project.hourlyRate);
      }
      return _repo.getProject();
    });
  }

  Future<void> updateProject(ProjectModel project) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.updateProject(project);

      final currentHourlyRate = ref.read(profileProvider).valueOrNull?.hourlyRate;
      if (project.hourlyRate > 0 && project.hourlyRate != currentHourlyRate) {
        await ref.read(profileProvider.notifier).updateProfile(hourlyRate: project.hourlyRate);
      }

      ref.invalidate(calendarNotifierProvider);
      return _repo.getProject();
    });
  }

  Future<void> completeProject(String projectId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.completeProject(projectId);
      return _repo.getProject();
    });
  }

  Future<void> deleteProject(String projectId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.deleteProject(projectId);
      ref.invalidate(calendarNotifierProvider);
      return _repo.getProject();
    });
  }
}
