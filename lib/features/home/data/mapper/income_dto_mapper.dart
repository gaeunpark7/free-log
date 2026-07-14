import 'package:free_log/features/home/data/dto/income_dto.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';

extension IncomeDtoMapper on IncomeDto {
  IncomeModel toEntity() => IncomeModel(
    id: id,
    projectId: projectId,
    amount: amount,
    description: description,
    receivedAt: receivedAt,
    createdAt: createdAt,
  );
}
