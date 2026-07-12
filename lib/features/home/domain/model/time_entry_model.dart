// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'time_entry_model.freezed.dart';

@freezed
abstract class TimeEntryModel with _$TimeEntryModel {
  const factory TimeEntryModel({
    String? id,
    String? projectId,
    DateTime? workedAt,
    required int minutes,
    DateTime? createdAt,
  }) = _TimeEntryModel;
}
