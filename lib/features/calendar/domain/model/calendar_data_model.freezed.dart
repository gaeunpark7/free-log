// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarDataModel {

 double get hours; int get income; int get expense; List<TimeEntryDetail> get timeEntries; List<IncomeDetail> get incomes; List<ExpenseDetail> get expenses;
/// Create a copy of CalendarDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarDataModelCopyWith<CalendarDataModel> get copyWith => _$CalendarDataModelCopyWithImpl<CalendarDataModel>(this as CalendarDataModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarDataModel&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.income, income) || other.income == income)&&(identical(other.expense, expense) || other.expense == expense)&&const DeepCollectionEquality().equals(other.timeEntries, timeEntries)&&const DeepCollectionEquality().equals(other.incomes, incomes)&&const DeepCollectionEquality().equals(other.expenses, expenses));
}


@override
int get hashCode => Object.hash(runtimeType,hours,income,expense,const DeepCollectionEquality().hash(timeEntries),const DeepCollectionEquality().hash(incomes),const DeepCollectionEquality().hash(expenses));

@override
String toString() {
  return 'CalendarDataModel(hours: $hours, income: $income, expense: $expense, timeEntries: $timeEntries, incomes: $incomes, expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class $CalendarDataModelCopyWith<$Res>  {
  factory $CalendarDataModelCopyWith(CalendarDataModel value, $Res Function(CalendarDataModel) _then) = _$CalendarDataModelCopyWithImpl;
@useResult
$Res call({
 double hours, int income, int expense, List<TimeEntryDetail> timeEntries, List<IncomeDetail> incomes, List<ExpenseDetail> expenses
});




}
/// @nodoc
class _$CalendarDataModelCopyWithImpl<$Res>
    implements $CalendarDataModelCopyWith<$Res> {
  _$CalendarDataModelCopyWithImpl(this._self, this._then);

  final CalendarDataModel _self;
  final $Res Function(CalendarDataModel) _then;

/// Create a copy of CalendarDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hours = null,Object? income = null,Object? expense = null,Object? timeEntries = null,Object? incomes = null,Object? expenses = null,}) {
  return _then(_self.copyWith(
hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as double,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as int,timeEntries: null == timeEntries ? _self.timeEntries : timeEntries // ignore: cast_nullable_to_non_nullable
as List<TimeEntryDetail>,incomes: null == incomes ? _self.incomes : incomes // ignore: cast_nullable_to_non_nullable
as List<IncomeDetail>,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarDataModel].
extension CalendarDataModelPatterns on CalendarDataModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarDataModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarDataModel value)  $default,){
final _that = this;
switch (_that) {
case _CalendarDataModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarDataModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double hours,  int income,  int expense,  List<TimeEntryDetail> timeEntries,  List<IncomeDetail> incomes,  List<ExpenseDetail> expenses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarDataModel() when $default != null:
return $default(_that.hours,_that.income,_that.expense,_that.timeEntries,_that.incomes,_that.expenses);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double hours,  int income,  int expense,  List<TimeEntryDetail> timeEntries,  List<IncomeDetail> incomes,  List<ExpenseDetail> expenses)  $default,) {final _that = this;
switch (_that) {
case _CalendarDataModel():
return $default(_that.hours,_that.income,_that.expense,_that.timeEntries,_that.incomes,_that.expenses);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double hours,  int income,  int expense,  List<TimeEntryDetail> timeEntries,  List<IncomeDetail> incomes,  List<ExpenseDetail> expenses)?  $default,) {final _that = this;
switch (_that) {
case _CalendarDataModel() when $default != null:
return $default(_that.hours,_that.income,_that.expense,_that.timeEntries,_that.incomes,_that.expenses);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarDataModel implements CalendarDataModel {
  const _CalendarDataModel({this.hours = 0.0, this.income = 0, this.expense = 0, final  List<TimeEntryDetail> timeEntries = const [], final  List<IncomeDetail> incomes = const [], final  List<ExpenseDetail> expenses = const []}): _timeEntries = timeEntries,_incomes = incomes,_expenses = expenses;
  

@override@JsonKey() final  double hours;
@override@JsonKey() final  int income;
@override@JsonKey() final  int expense;
 final  List<TimeEntryDetail> _timeEntries;
@override@JsonKey() List<TimeEntryDetail> get timeEntries {
  if (_timeEntries is EqualUnmodifiableListView) return _timeEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeEntries);
}

 final  List<IncomeDetail> _incomes;
@override@JsonKey() List<IncomeDetail> get incomes {
  if (_incomes is EqualUnmodifiableListView) return _incomes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incomes);
}

 final  List<ExpenseDetail> _expenses;
@override@JsonKey() List<ExpenseDetail> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}


/// Create a copy of CalendarDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarDataModelCopyWith<_CalendarDataModel> get copyWith => __$CalendarDataModelCopyWithImpl<_CalendarDataModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarDataModel&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.income, income) || other.income == income)&&(identical(other.expense, expense) || other.expense == expense)&&const DeepCollectionEquality().equals(other._timeEntries, _timeEntries)&&const DeepCollectionEquality().equals(other._incomes, _incomes)&&const DeepCollectionEquality().equals(other._expenses, _expenses));
}


@override
int get hashCode => Object.hash(runtimeType,hours,income,expense,const DeepCollectionEquality().hash(_timeEntries),const DeepCollectionEquality().hash(_incomes),const DeepCollectionEquality().hash(_expenses));

@override
String toString() {
  return 'CalendarDataModel(hours: $hours, income: $income, expense: $expense, timeEntries: $timeEntries, incomes: $incomes, expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class _$CalendarDataModelCopyWith<$Res> implements $CalendarDataModelCopyWith<$Res> {
  factory _$CalendarDataModelCopyWith(_CalendarDataModel value, $Res Function(_CalendarDataModel) _then) = __$CalendarDataModelCopyWithImpl;
@override @useResult
$Res call({
 double hours, int income, int expense, List<TimeEntryDetail> timeEntries, List<IncomeDetail> incomes, List<ExpenseDetail> expenses
});




}
/// @nodoc
class __$CalendarDataModelCopyWithImpl<$Res>
    implements _$CalendarDataModelCopyWith<$Res> {
  __$CalendarDataModelCopyWithImpl(this._self, this._then);

  final _CalendarDataModel _self;
  final $Res Function(_CalendarDataModel) _then;

/// Create a copy of CalendarDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hours = null,Object? income = null,Object? expense = null,Object? timeEntries = null,Object? incomes = null,Object? expenses = null,}) {
  return _then(_CalendarDataModel(
hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as double,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as int,timeEntries: null == timeEntries ? _self._timeEntries : timeEntries // ignore: cast_nullable_to_non_nullable
as List<TimeEntryDetail>,incomes: null == incomes ? _self._incomes : incomes // ignore: cast_nullable_to_non_nullable
as List<IncomeDetail>,expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseDetail>,
  ));
}


}

// dart format on
