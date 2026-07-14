// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'income_dto.freezed.dart';
part 'income_dto.g.dart';

@freezed
abstract class IncomeDto with _$IncomeDto {
  const factory IncomeDto({
    String? id,
    @JsonKey(name: 'project_id') String? projectId,
    required int amount,
    required String description,
    @JsonKey(name: 'received_at') required DateTime receivedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _IncomeDto;

  factory IncomeDto.fromJson(Map<String, dynamic> json) => _$IncomeDtoFromJson(json);
}
