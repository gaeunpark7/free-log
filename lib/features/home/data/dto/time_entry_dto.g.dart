// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeEntryDto _$TimeEntryDtoFromJson(Map<String, dynamic> json) =>
    _TimeEntryDto(
      id: json['id'] as String?,
      projectId: json['project_id'] as String?,
      workedAt: json['worked_at'] == null
          ? null
          : DateTime.parse(json['worked_at'] as String),
      minutes: (json['minutes'] as num).toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$TimeEntryDtoToJson(_TimeEntryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'worked_at': instance.workedAt?.toIso8601String(),
      'minutes': instance.minutes,
      'created_at': instance.createdAt?.toIso8601String(),
    };
