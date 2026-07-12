// ignore_for_file: invalid_annotation_target
import 'package:free_log/features/home/domain/model/project_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'project_model.freezed.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    String? id,
    String? userId,
    required String title,
    @Default(ProjectStatus.inProgress) ProjectStatus status,
    DateTime? deadline,
    DateTime? createdAt,
    @Default(0) int hourlyRate,
    @Default(0.3) double marginRate,
  }) = _ProjectModel;
}
