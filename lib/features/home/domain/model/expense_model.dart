import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';

@freezed
abstract class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    String? id,
    String? projectId,
    required int amount,
    required String description,
    required DateTime spentAt,
    DateTime? createdAt,
  }) = _ExpenseModel;
}
