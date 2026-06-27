// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarDataModel _$CalendarDataModelFromJson(Map<String, dynamic> json) =>
    _CalendarDataModel(
      hours: (json['hours'] as num?)?.toDouble() ?? 0.0,
      income: (json['income'] as num?)?.toInt() ?? 0,
      expense: (json['expense'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CalendarDataModelToJson(_CalendarDataModel instance) =>
    <String, dynamic>{
      'hours': instance.hours,
      'income': instance.income,
      'expense': instance.expense,
    };
