import 'package:free_log/features/home/domain/model/project_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    required String title,
    @Default(ProjectStatus.inProgress) ProjectStatus status,
    DateTime? deadline,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'hourly_rate') @Default(0.0) double hourlyRate,
    @JsonKey(name: 'margin_rate') @Default(0.3) double marginRate,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
