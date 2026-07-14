import 'package:free_log/features/profile/data/dto/user_dto.dart';
import 'package:free_log/features/profile/domain/model/user_model.dart';

extension UserMapper on UserDto {
  UserModel toEntity() => UserModel(
    id: id,
    email: email,
    nickname: nickname,
    hourlyRate: hourlyRate,
    marginRate: marginRate,
    notifyDeadline: notifyDeadline,
    createdAt: createdAt,
  );
}
