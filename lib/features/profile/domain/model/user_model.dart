// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String email,
    String? nickname,
    @Default(0) int hourlyRate,
    @Default(0.3) double marginRate,
    @Default(true) bool notifyDeadline,
    DateTime? createdAt,
  }) = _UserModel;
}
