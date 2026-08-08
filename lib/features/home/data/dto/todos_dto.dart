// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'todos_dto.freezed.dart';
part 'todos_dto.g.dart';

@freezed
abstract class TodosDto with _$TodosDto {
  const factory TodosDto({
    String? id,
    @JsonKey(name: 'project_id') String? projectId,
    required String content,
    @JsonKey(name: 'is_done') @Default(false) bool isDone,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _TodosDto;

  factory TodosDto.fromJson(Map<String, dynamic> json) =>
      _$TodosDtoFromJson(json);
}
