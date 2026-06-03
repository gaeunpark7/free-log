import 'package:freezed_annotation/freezed_annotation.dart';

enum ProjectStatus {
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('on_hold')
  onHold,
  @JsonValue('completed')
  completed;

  //DB 저장
  String get value {
    switch (this) {
      case ProjectStatus.inProgress:
        return 'in_progress';
      case ProjectStatus.onHold:
        return 'on_hold';
      case ProjectStatus.completed:
        return 'completed';
    }
  }

  static ProjectStatus fromString(String value) {
    switch (value) {
      case 'in_progress':
        return ProjectStatus.inProgress;
      case 'on_hold':
        return ProjectStatus.onHold;
      case 'completed':
        return ProjectStatus.completed;
      default:
        return ProjectStatus.inProgress;
    }
  }
}
