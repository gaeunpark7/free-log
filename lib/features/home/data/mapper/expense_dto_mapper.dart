import 'package:free_log/features/home/data/dto/expense_dto.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';

extension ExpenseDtoMapper on ExpenseDto {
  ExpenseModel toEntity() => ExpenseModel(
    id: id,
    projectId: projectId,
    amount: amount,
    description: description,
    spentAt: spentAt,
    createdAt: createdAt,
  );
}
