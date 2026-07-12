// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
  id: json['id'] as String,
  email: json['email'] as String,
  nickname: json['nickname'] as String?,
  hourlyRate: (json['hourly_rate'] as num?)?.toInt() ?? 0,
  marginRate: (json['margin_rate'] as num?)?.toDouble() ?? 0.3,
  notifyDeadline: json['notify_deadline'] as bool? ?? true,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'nickname': instance.nickname,
  'hourly_rate': instance.hourlyRate,
  'margin_rate': instance.marginRate,
  'notify_deadline': instance.notifyDeadline,
  'created_at': instance.createdAt?.toIso8601String(),
};
