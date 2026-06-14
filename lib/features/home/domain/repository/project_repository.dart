import 'package:free_log/features/home/domain/model/project_model.dart';

abstract interface class ProjectRepository {
  Future<void> createProject(ProjectModel project);
  Future<List<ProjectModel>> getProject();
  Future<void> updateProject(ProjectModel project);
  Future<void> deleteProject(String projectId);
  Future<void> checkAndUpdateOverdue();
  Future<void> completeProject(String projectId);
}
