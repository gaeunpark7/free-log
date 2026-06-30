// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) =>
    _ExpenseModel(
      id: json['id'] as String?,
      projectId: json['project_id'] as String?,
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String,
      spentAt: DateTime.parse(json['spent_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ExpenseModelToJson(_ExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'amount': instance.amount,
      'description': instance.description,
      'spent_at': instance.spentAt.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
