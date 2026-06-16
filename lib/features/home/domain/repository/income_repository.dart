import 'package:free_log/features/home/domain/model/income_model.dart';

abstract interface class IncomeRepository {
  Future<List<IncomeModel>> getIncome(String projectId);
  Future<void> addIncome(String projectId, String description, int amount, DateTime receivedAt);
  Future<void> updateIncome(String id, String description, int amount, DateTime receivedAt);
  Future<void> deleteIncome(String id);
}
