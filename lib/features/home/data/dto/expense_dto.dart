// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'expense_dto.freezed.dart';
part 'expense_dto.g.dart';

@freezed
abstract class ExpenseDto with _$ExpenseDto {
  const factory ExpenseDto({
    String? id,
    @JsonKey(name: 'project_id') String? projectId,
    required int amount,
    required String description,
    @JsonKey(name: 'spent_at') required DateTime spentAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ExpenseDto;

  factory ExpenseDto.fromJson(Map<String, dynamic> json) => _$ExpenseDtoFromJson(json);
}
