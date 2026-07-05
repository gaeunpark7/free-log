// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeEntryModel _$TimeEntryModelFromJson(Map<String, dynamic> json) =>
    _TimeEntryModel(
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

Map<String, dynamic> _$TimeEntryModelToJson(_TimeEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'worked_at': instance.workedAt?.toIso8601String(),
      'minutes': instance.minutes,
      'created_at': instance.createdAt?.toIso8601String(),
    };
