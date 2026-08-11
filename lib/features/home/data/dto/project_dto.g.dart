// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => _ProjectDto(
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
  title: json['title'] as String,
  status:
      $enumDecodeNullable(_$ProjectStatusEnumMap, json['status']) ??
      ProjectStatus.inProgress,
  deadline: json['deadline'] == null
      ? null
      : DateTime.parse(json['deadline'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  hourlyRate: (json['hourly_rate'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProjectDtoToJson(_ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'deadline': instance.deadline?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'hourly_rate': instance.hourlyRate,
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.inProgress: 'in_progress',
  ProjectStatus.onHold: 'on_hold',
  ProjectStatus.completed: 'completed',
};
