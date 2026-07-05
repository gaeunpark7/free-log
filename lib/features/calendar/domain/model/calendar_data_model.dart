import 'package:free_log/features/calendar/domain/model/calendar_detail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_data_model.freezed.dart';

@freezed
abstract class CalendarDataModel with _$CalendarDataModel {
  const factory CalendarDataModel({
    @Default(0) int minutes,
    @Default(0) int income,
    @Default(0) int expense,
    @Default([]) List<TimeEntryDetail> timeEntries,
    @Default([]) List<IncomeDetail> incomes,
    @Default([]) List<ExpenseDetail> expenses,
  }) = _CalendarDataModel;
}

//합산용 extenstion
extension CalendarDayDataX on Map<DateTime, CalendarDataModel> {
  int get totalMinutes => values.fold(0, (sum, d) => sum + d.minutes);
  int get totalIncome => values.fold(0, (sum, d) => sum + d.income);
  int get totalExpense => values.fold(0, (sum, d) => sum + d.expense);
}
