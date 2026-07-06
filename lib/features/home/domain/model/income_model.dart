// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'income_model.freezed.dart';
part 'income_model.g.dart';

@freezed
abstract class IncomeModel with _$IncomeModel {
  const factory IncomeModel({
    String? id,
    @JsonKey(name: 'project_id') String? projectId,
    required int amount,
    required String description,
    @JsonKey(name: 'received_at') required DateTime receivedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _IncomeModel;

  factory IncomeModel.fromJson(Map<String, dynamic> json) => _$IncomeModelFromJson(json);
}
