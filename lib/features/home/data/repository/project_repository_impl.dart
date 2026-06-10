import 'package:free_log/features/home/domain/model/project_model.dart';
import 'package:free_log/features/home/domain/repository/project_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final SupabaseClient _supabase;

  ProjectRepositoryImpl(this._supabase);

  @override
  Future<void> createProject(ProjectModel project) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      throw StateError('User must be signed in to create a project.');
    }

    final projectJson = ProjectModel(
      id: Uuid().v4(),
      userId: userId,
      title: project.title,
      status: project.status,
      deadline: project.deadline,
      createdAt: DateTime.now(),
      hourlyRate: project.hourlyRate,
      marginRate: project.marginRate,
    ).toJson();

    try {
      final response = await _supabase.from('project').insert(projectJson);
      print('Insert 성공: Response: $response');
    } catch (e) {
      print('Insert 실패: $e');
      rethrow;
    }
  }

  @override
  Future<List<ProjectModel>> getProject() async {
    final response = await _supabase.from('project').select().order('created_at', ascending: false);

    return response.map(ProjectModel.fromJson).toList();
  }

  //프로젝트 완료 여부
  @override
  Future<void> checkAndUpdateOverdue() async {
    final now = DateTime.now();
    final todayMidnight = DateTime(now.year, now.month, now.day).toUtc().toIso8601String(); //오늘 날짜 로컬

    await _supabase.from('project').update({'status': 'completed'}).eq('status', 'in_progress').lt('deadline', todayMidnight);
  }
}
