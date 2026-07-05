import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_stats_model.freezed.dart';

@freezed
abstract class ProfileStatsModel with _$ProfileStatsModel {
  const ProfileStatsModel._();

  const factory ProfileStatsModel({
    @Default(0) int inProgressCount,
    @Default(0) int totalMinutes,
    @Default(0) int totalIncome,
    @Default(0) int totalExpense,
  }) = _ProfileStatsModel;

  int get netIncome => totalIncome - totalExpense;
}
