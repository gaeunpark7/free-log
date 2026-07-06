// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String email,
    String? nickname,
    @JsonKey(name: 'hourly_rate') @Default(0) int hourlyRate,
    @JsonKey(name: 'margin_rate') @Default(0.3) double marginRate,
    @JsonKey(name: 'notify_deadline') @Default(true) bool notifyDeadline,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
