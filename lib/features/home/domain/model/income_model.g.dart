// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) => _IncomeModel(
  id: json['id'] as String?,
  projectId: json['project_id'] as String?,
  amount: (json['amount'] as num).toInt(),
  description: json['description'] as String,
  receivedAt: DateTime.parse(json['received_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$IncomeModelToJson(_IncomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'amount': instance.amount,
      'description': instance.description,
      'received_at': instance.receivedAt.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
