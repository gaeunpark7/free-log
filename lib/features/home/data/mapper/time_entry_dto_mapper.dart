import 'package:free_log/features/home/data/dto/time_entry_dto.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';

extension TimeEntryDtoMapper on TimeEntryDto {
  TimeEntryModel toEntity() => TimeEntryModel(
    id: id,
    projectId: projectId,
    workedAt: workedAt,
    minutes: minutes,
    createdAt: createdAt,
  );
}
