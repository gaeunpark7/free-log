// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeEntriesModel _$TimeEntriesModelFromJson(Map<String, dynamic> json) =>
    _TimeEntriesModel(
      id: json['id'] as String?,
      projectId: json['project_id'] as String,
      workedAt: DateTime.parse(json['worked_at'] as String),
      hours: (json['hours'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$TimeEntriesModelToJson(_TimeEntriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'worked_at': instance.workedAt.toIso8601String(),
      'hours': instance.hours,
      'created_at': instance.createdAt.toIso8601String(),
    };
