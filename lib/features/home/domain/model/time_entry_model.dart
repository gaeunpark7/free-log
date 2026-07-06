// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'time_entry_model.freezed.dart';
part 'time_entry_model.g.dart';

@freezed
abstract class TimeEntryModel with _$TimeEntryModel {
  const factory TimeEntryModel({
    String? id,
    @JsonKey(name: 'project_id') String? projectId,
    @JsonKey(name: 'worked_at') DateTime? workedAt,
    required int minutes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _TimeEntryModel;

  factory TimeEntryModel.fromJson(Map<String, dynamic> json) => _$TimeEntryModelFromJson(json);
}
