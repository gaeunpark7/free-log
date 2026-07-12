// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomeDto _$IncomeDtoFromJson(Map<String, dynamic> json) => _IncomeDto(
  id: json['id'] as String?,
  projectId: json['project_id'] as String?,
  amount: (json['amount'] as num).toInt(),
  description: json['description'] as String,
  receivedAt: DateTime.parse(json['received_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$IncomeDtoToJson(_IncomeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'amount': instance.amount,
      'description': instance.description,
      'received_at': instance.receivedAt.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
