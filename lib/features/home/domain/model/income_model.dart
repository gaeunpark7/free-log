import 'package:freezed_annotation/freezed_annotation.dart';
part 'income_model.freezed.dart';

@freezed
abstract class IncomeModel with _$IncomeModel {
  const factory IncomeModel({
    String? id,
    String? projectId,
    required int amount,
    required String description,
    required DateTime receivedAt,
    DateTime? createdAt,
  }) = _IncomeModel;
}
