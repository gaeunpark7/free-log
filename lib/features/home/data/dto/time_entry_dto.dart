// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'time_entry_dto.freezed.dart';
part 'time_entry_dto.g.dart';

@freezed
abstract class TimeEntryDto with _$TimeEntryDto {
  const factory TimeEntryDto({
    String? id,
    @JsonKey(name: 'project_id') String? projectId,
    @JsonKey(name: 'worked_at') DateTime? workedAt,
    required int minutes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _TimeEntryDto;

  factory TimeEntryDto.fromJson(Map<String, dynamic> json) =>
      _$TimeEntryDtoFromJson(json);
}
