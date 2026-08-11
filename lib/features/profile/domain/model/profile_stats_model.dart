import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_stats_model.freezed.dart';

@freezed
abstract class ProfileStatsModel with _$ProfileStatsModel {
  const ProfileStatsModel._();

  const factory ProfileStatsModel({
    @Default(0) int totalMinutes,
    @Default(0) int totalIncome,
    @Default(0) int totalExpense,
    @Default(0) int taskCount,
  }) = _ProfileStatsModel;

  int get netIncome => totalIncome - totalExpense;
}
