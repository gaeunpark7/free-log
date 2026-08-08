import 'package:free_log/features/home/domain/model/expense_model.dart';

abstract interface class ExpenseRepository {
  Future<List<ExpenseModel>> getExpense(String projectId);
  Future<void> addExpense(
    String projectId,
    String description,
    int amount,
    DateTime spentAt,
  );
  Future<void> updateExpense(
    String id,
    String description,
    int amount,
    DateTime spentAt,
  );
  Future<void> deleteExpense(String id);
}
