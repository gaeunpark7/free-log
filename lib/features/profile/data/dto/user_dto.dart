// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  factory UserDto({
    required String id,
    required String email,
    String? nickname,
    @JsonKey(name: 'hourly_rate') @Default(0) int hourlyRate,
    @JsonKey(name: 'margin_rate') @Default(0.3) double marginRate,
    @JsonKey(name: 'notify_deadline') @Default(true) bool notifyDeadline,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
