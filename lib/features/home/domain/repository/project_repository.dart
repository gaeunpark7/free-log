import 'package:free_log/features/home/domain/model/project_model.dart';

abstract interface class ProjectRepository {
  Future<void> createProject(ProjectModel project);
  Future<List<ProjectModel>> getProject();
}
