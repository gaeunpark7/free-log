import 'package:freezed_annotation/freezed_annotation.dart';
part 'todos_model.freezed.dart';

@freezed
abstract class TodosModel with _$TodosModel {
  const factory TodosModel({
    String? id,
    String? projectId,
    required String content,
    @Default(false) bool isDone,
    DateTime? createdAt,
  }) = _TodosModel;
}
