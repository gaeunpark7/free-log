import 'package:freezed_annotation/freezed_annotation.dart';
part 'calendar_detail_model.freezed.dart';

@freezed
abstract class CalendarDetailModel with _$CalendarDetailModel {
  const factory CalendarDetailModel({
    @Default([]) List<TimeEntryDetail> timeEntries,
    // 수익 상세
    @Default([]) List<IncomeDetail> incomes,
    // 지출 상세
    @Default([]) List<ExpenseDetail> expenses,
  }) = _CalendarDetailModel;
}

// 작업시간
@freezed
abstract class TimeEntryDetail with _$TimeEntryDetail {
  const factory TimeEntryDetail({required String projectName, required int totalMinutes}) =
      _TimeEntryDetail;
}

// 수익
@freezed
abstract class IncomeDetail with _$IncomeDetail {
  const factory IncomeDetail({
    required String description,
    required String projectName,
    required int amount,
  }) = _IncomeDetail;
}

// 지출
@freezed
abstract class ExpenseDetail with _$ExpenseDetail {
  const factory ExpenseDetail({
    required String description,
    required String projectName,
    required int amount,
  }) = _ExpenseDetail;
}
