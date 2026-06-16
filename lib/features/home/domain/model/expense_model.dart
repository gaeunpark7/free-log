import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
abstract class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    String? id,
    @JsonKey(name: 'project_id') String? projectId,
    required double amount,
    required String description,
    @JsonKey(name: 'spent_at') required DateTime spentAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => _$ExpenseModelFromJson(json);
}
