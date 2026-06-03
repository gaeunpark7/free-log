import 'package:freezed_annotation/freezed_annotation.dart';
part 'time_entries_model.freezed.dart';
part 'time_entries_model.g.dart';

@freezed
abstract class TimeEntriesModel with _$TimeEntriesModel {
  factory TimeEntriesModel({
    required String? id,
    @JsonKey(name: 'project_id') required String projectId,
    @JsonKey(name: 'worked_at') required DateTime workedAt,
    required double hours,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _TimeEntriesModel;

  factory TimeEntriesModel.fromJson(Map<String, dynamic> json) =>
      _$TimeEntriesModelFromJson(json);
}
