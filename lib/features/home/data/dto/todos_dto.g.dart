// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodosDto _$TodosDtoFromJson(Map<String, dynamic> json) => _TodosDto(
  id: json['id'] as String?,
  projectId: json['project_id'] as String?,
  content: json['content'] as String,
  isDone: json['is_done'] as bool? ?? false,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TodosDtoToJson(_TodosDto instance) => <String, dynamic>{
  'id': instance.id,
  'project_id': instance.projectId,
  'content': instance.content,
  'is_done': instance.isDone,
  'created_at': instance.createdAt?.toIso8601String(),
};
