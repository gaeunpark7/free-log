import 'package:free_log/features/home/data/dto/project_dto.dart';
import 'package:free_log/features/home/domain/model/project_model.dart';

extension ProjectDtoMapper on ProjectDto {
  ProjectModel toEntity() => ProjectModel(
    id: id,
    userId: userId,
    title: title,
    status: status,
    deadline: deadline,
    createdAt: createdAt,
    hourlyRate: hourlyRate,
  );
}
