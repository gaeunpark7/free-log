import 'package:free_log/core/error/base_repository.dart';
import 'package:free_log/core/error/error_code.dart';
import 'package:free_log/features/home/data/dto/project_dto.dart';
import 'package:free_log/features/home/data/mapper/project_dto_mapper.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/repository/project_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ProjectRepositoryImpl extends BaseRepository
    implements ProjectRepository {
  ProjectRepositoryImpl(this._supabase);
  final SupabaseClient _supabase;

  @override
  Future<void> createProject(ProjectModel project) async {
    return execute(() async {
      final user = _supabase.auth.currentUser;
      if (user == null) {
        throw Exception('You need to log in.');
      }
      final userId = user.id;

      final projectJson = ProjectDto(
        id: const Uuid().v4(),
        userId: userId,
        title: project.title,
        status: project.status,
        deadline: project.deadline,
        createdAt: DateTime.now(),
        hourlyRate: project.hourlyRate,
      ).toJson();
      return _supabase.from('project').insert(projectJson);
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<List<ProjectModel>> getProject() async {
    return execute(() async {
      if (_supabase.auth.currentUser == null) return [];

      final response = await _supabase
          .from('project')
          .select()
          .order('created_at', ascending: false);
      return response
          .map(ProjectDto.fromJson)
          .map((dto) => dto.toEntity())
          .toList();
    }, errorCode: ErrorCode.fetchFailed);
  }

  @override
  Future<void> autoCompleteProjects() async {
    return execute(() async {
      if (_supabase.auth.currentUser == null) return;

      final now = DateTime.now();
      final todayMidnight = DateTime(
        now.year,
        now.month,
        now.day,
      ).toUtc().toIso8601String();

      await _supabase
          .from('project')
          .update({'status': 'completed'})
          .eq('status', 'in_progress')
          .lt('deadline', todayMidnight);
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<void> updateProject(ProjectModel project) async {
    return execute(() async {
      final userId = _supabase.auth.currentUser!.id;
      return _supabase
          .from('project')
          .update({
            'title': project.title,
            'hourly_rate': project.hourlyRate,
            'deadline': project.deadline?.toIso8601String(),
            'status': project.status.value,
          })
          .eq('id', project.id!)
          .eq('user_id', userId);
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<void> deleteProject(String projectId) async {
    return execute(() async {
      return _supabase.from('project').delete().eq('id', projectId);
    }, errorCode: ErrorCode.saveFailed);
  }

  @override
  Future<void> completeProject(String projectId) async {
    return execute(() async {
      return _supabase
          .from('project')
          .update({'status': 'completed'})
          .eq('id', projectId);
    }, errorCode: ErrorCode.saveFailed);
  }
}
