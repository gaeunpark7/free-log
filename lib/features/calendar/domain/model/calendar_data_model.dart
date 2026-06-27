import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_data_model.freezed.dart';
part 'calendar_data_model.g.dart';

@freezed
abstract class CalendarDataModel with _$CalendarDataModel {
  const factory CalendarDataModel({@Default(0.0) double hours, @Default(0) int income, @Default(0) int expense}) = _CalendarDataModel;

  factory CalendarDataModel.fromJson(Map<String, dynamic> json) => _$CalendarDataModelFromJson(json);
}

//합산용 extenstion
extension CalendarDayDataX on Map<DateTime, CalendarDataModel> {
  double get totalHours => values.fold(0.0, (sum, d) => sum + d.hours);
  int get totalIncome => values.fold(0, (sum, d) => sum + d.income);
  int get totalExpense => values.fold(0, (sum, d) => sum + d.expense);
}
