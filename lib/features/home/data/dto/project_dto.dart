// ignore_for_file: invalid_annotation_target
import 'package:free_log/features/home/domain/model/project_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_dto.freezed.dart';
part 'project_dto.g.dart';

@freezed
abstract class ProjectDto with _$ProjectDto {
  const factory ProjectDto({
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    required String title,
    @Default(ProjectStatus.inProgress) ProjectStatus status,
    DateTime? deadline,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'hourly_rate') @Default(0) int hourlyRate,
    @JsonKey(name: 'margin_rate') @Default(0.3) double marginRate,
  }) = _ProjectDto;

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);
}
