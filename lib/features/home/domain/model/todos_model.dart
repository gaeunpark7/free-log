import 'package:freezed_annotation/freezed_annotation.dart';
part 'todos_model.freezed.dart';
part 'todos_model.g.dart';

@freezed
abstract class TodosModel with _$TodosModel {
  const factory TodosModel({
    String? id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'project_id') String? projectId,
    required String content,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'is_done') @Default(false) bool isDone,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _TodosModel;

  factory TodosModel.fromJson(Map<String, dynamic> json) => _$TodosModelFromJson(json);
}
