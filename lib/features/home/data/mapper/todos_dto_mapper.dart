import 'package:free_log/features/home/data/dto/todos_dto.dart';
import 'package:free_log/features/home/domain/model/todos_model.dart';

extension TodosDtoMapper on TodosDto {
  TodosModel toEntity() => TodosModel(
    id: id,
    projectId: projectId,
    content: content,
    isDone: isDone,
    createdAt: createdAt,
  );
}
