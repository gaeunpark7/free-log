// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarDetailModel {

 List<TimeEntryDetail> get timeEntries;// 수익 상세
 List<IncomeDetail> get incomes;// 지출 상세
 List<ExpenseDetail> get expenses;
/// Create a copy of CalendarDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarDetailModelCopyWith<CalendarDetailModel> get copyWith => _$CalendarDetailModelCopyWithImpl<CalendarDetailModel>(this as CalendarDetailModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarDetailModel&&const DeepCollectionEquality().equals(other.timeEntries, timeEntries)&&const DeepCollectionEquality().equals(other.incomes, incomes)&&const DeepCollectionEquality().equals(other.expenses, expenses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(timeEntries),const DeepCollectionEquality().hash(incomes),const DeepCollectionEquality().hash(expenses));

@override
String toString() {
  return 'CalendarDetailModel(timeEntries: $timeEntries, incomes: $incomes, expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class $CalendarDetailModelCopyWith<$Res>  {
  factory $CalendarDetailModelCopyWith(CalendarDetailModel value, $Res Function(CalendarDetailModel) _then) = _$CalendarDetailModelCopyWithImpl;
@useResult
$Res call({
 List<TimeEntryDetail> timeEntries, List<IncomeDetail> incomes, List<ExpenseDetail> expenses
});




}
/// @nodoc
class _$CalendarDetailModelCopyWithImpl<$Res>
    implements $CalendarDetailModelCopyWith<$Res> {
  _$CalendarDetailModelCopyWithImpl(this._self, this._then);

  final CalendarDetailModel _self;
  final $Res Function(CalendarDetailModel) _then;

/// Create a copy of CalendarDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeEntries = null,Object? incomes = null,Object? expenses = null,}) {
  return _then(_self.copyWith(
timeEntries: null == timeEntries ? _self.timeEntries : timeEntries // ignore: cast_nullable_to_non_nullable
as List<TimeEntryDetail>,incomes: null == incomes ? _self.incomes : incomes // ignore: cast_nullable_to_non_nullable
as List<IncomeDetail>,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarDetailModel].
extension CalendarDetailModelPatterns on CalendarDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _CalendarDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TimeEntryDetail> timeEntries,  List<IncomeDetail> incomes,  List<ExpenseDetail> expenses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarDetailModel() when $default != null:
return $default(_that.timeEntries,_that.incomes,_that.expenses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TimeEntryDetail> timeEntries,  List<IncomeDetail> incomes,  List<ExpenseDetail> expenses)  $default,) {final _that = this;
switch (_that) {
case _CalendarDetailModel():
return $default(_that.timeEntries,_that.incomes,_that.expenses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TimeEntryDetail> timeEntries,  List<IncomeDetail> incomes,  List<ExpenseDetail> expenses)?  $default,) {final _that = this;
switch (_that) {
case _CalendarDetailModel() when $default != null:
return $default(_that.timeEntries,_that.incomes,_that.expenses);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarDetailModel implements CalendarDetailModel {
  const _CalendarDetailModel({final  List<TimeEntryDetail> timeEntries = const [], final  List<IncomeDetail> incomes = const [], final  List<ExpenseDetail> expenses = const []}): _timeEntries = timeEntries,_incomes = incomes,_expenses = expenses;
  

 final  List<TimeEntryDetail> _timeEntries;
@override@JsonKey() List<TimeEntryDetail> get timeEntries {
  if (_timeEntries is EqualUnmodifiableListView) return _timeEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeEntries);
}

// 수익 상세
 final  List<IncomeDetail> _incomes;
// 수익 상세
@override@JsonKey() List<IncomeDetail> get incomes {
  if (_incomes is EqualUnmodifiableListView) return _incomes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incomes);
}

// 지출 상세
 final  List<ExpenseDetail> _expenses;
// 지출 상세
@override@JsonKey() List<ExpenseDetail> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}


/// Create a copy of CalendarDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarDetailModelCopyWith<_CalendarDetailModel> get copyWith => __$CalendarDetailModelCopyWithImpl<_CalendarDetailModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarDetailModel&&const DeepCollectionEquality().equals(other._timeEntries, _timeEntries)&&const DeepCollectionEquality().equals(other._incomes, _incomes)&&const DeepCollectionEquality().equals(other._expenses, _expenses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timeEntries),const DeepCollectionEquality().hash(_incomes),const DeepCollectionEquality().hash(_expenses));

@override
String toString() {
  return 'CalendarDetailModel(timeEntries: $timeEntries, incomes: $incomes, expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class _$CalendarDetailModelCopyWith<$Res> implements $CalendarDetailModelCopyWith<$Res> {
  factory _$CalendarDetailModelCopyWith(_CalendarDetailModel value, $Res Function(_CalendarDetailModel) _then) = __$CalendarDetailModelCopyWithImpl;
@override @useResult
$Res call({
 List<TimeEntryDetail> timeEntries, List<IncomeDetail> incomes, List<ExpenseDetail> expenses
});




}
/// @nodoc
class __$CalendarDetailModelCopyWithImpl<$Res>
    implements _$CalendarDetailModelCopyWith<$Res> {
  __$CalendarDetailModelCopyWithImpl(this._self, this._then);

  final _CalendarDetailModel _self;
  final $Res Function(_CalendarDetailModel) _then;

/// Create a copy of CalendarDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeEntries = null,Object? incomes = null,Object? expenses = null,}) {
  return _then(_CalendarDetailModel(
timeEntries: null == timeEntries ? _self._timeEntries : timeEntries // ignore: cast_nullable_to_non_nullable
as List<TimeEntryDetail>,incomes: null == incomes ? _self._incomes : incomes // ignore: cast_nullable_to_non_nullable
as List<IncomeDetail>,expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseDetail>,
  ));
}


}

/// @nodoc
mixin _$TimeEntryDetail {

 String get projectName; int get totalMinutes;
/// Create a copy of TimeEntryDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeEntryDetailCopyWith<TimeEntryDetail> get copyWith => _$TimeEntryDetailCopyWithImpl<TimeEntryDetail>(this as TimeEntryDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeEntryDetail&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,projectName,totalMinutes);

@override
String toString() {
  return 'TimeEntryDetail(projectName: $projectName, totalMinutes: $totalMinutes)';
}


}

/// @nodoc
abstract mixin class $TimeEntryDetailCopyWith<$Res>  {
  factory $TimeEntryDetailCopyWith(TimeEntryDetail value, $Res Function(TimeEntryDetail) _then) = _$TimeEntryDetailCopyWithImpl;
@useResult
$Res call({
 String projectName, int totalMinutes
});




}
/// @nodoc
class _$TimeEntryDetailCopyWithImpl<$Res>
    implements $TimeEntryDetailCopyWith<$Res> {
  _$TimeEntryDetailCopyWithImpl(this._self, this._then);

  final TimeEntryDetail _self;
  final $Res Function(TimeEntryDetail) _then;

/// Create a copy of TimeEntryDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectName = null,Object? totalMinutes = null,}) {
  return _then(_self.copyWith(
projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeEntryDetail].
extension TimeEntryDetailPatterns on TimeEntryDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeEntryDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeEntryDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeEntryDetail value)  $default,){
final _that = this;
switch (_that) {
case _TimeEntryDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeEntryDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TimeEntryDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String projectName,  int totalMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeEntryDetail() when $default != null:
return $default(_that.projectName,_that.totalMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String projectName,  int totalMinutes)  $default,) {final _that = this;
switch (_that) {
case _TimeEntryDetail():
return $default(_that.projectName,_that.totalMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String projectName,  int totalMinutes)?  $default,) {final _that = this;
switch (_that) {
case _TimeEntryDetail() when $default != null:
return $default(_that.projectName,_that.totalMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _TimeEntryDetail implements TimeEntryDetail {
  const _TimeEntryDetail({required this.projectName, required this.totalMinutes});
  

@override final  String projectName;
@override final  int totalMinutes;

/// Create a copy of TimeEntryDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeEntryDetailCopyWith<_TimeEntryDetail> get copyWith => __$TimeEntryDetailCopyWithImpl<_TimeEntryDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeEntryDetail&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,projectName,totalMinutes);

@override
String toString() {
  return 'TimeEntryDetail(projectName: $projectName, totalMinutes: $totalMinutes)';
}


}

/// @nodoc
abstract mixin class _$TimeEntryDetailCopyWith<$Res> implements $TimeEntryDetailCopyWith<$Res> {
  factory _$TimeEntryDetailCopyWith(_TimeEntryDetail value, $Res Function(_TimeEntryDetail) _then) = __$TimeEntryDetailCopyWithImpl;
@override @useResult
$Res call({
 String projectName, int totalMinutes
});




}
/// @nodoc
class __$TimeEntryDetailCopyWithImpl<$Res>
    implements _$TimeEntryDetailCopyWith<$Res> {
  __$TimeEntryDetailCopyWithImpl(this._self, this._then);

  final _TimeEntryDetail _self;
  final $Res Function(_TimeEntryDetail) _then;

/// Create a copy of TimeEntryDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectName = null,Object? totalMinutes = null,}) {
  return _then(_TimeEntryDetail(
projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$IncomeDetail {

 String get description; String get projectName; int get amount;
/// Create a copy of IncomeDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeDetailCopyWith<IncomeDetail> get copyWith => _$IncomeDetailCopyWithImpl<IncomeDetail>(this as IncomeDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeDetail&&(identical(other.description, description) || other.description == description)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,description,projectName,amount);

@override
String toString() {
  return 'IncomeDetail(description: $description, projectName: $projectName, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $IncomeDetailCopyWith<$Res>  {
  factory $IncomeDetailCopyWith(IncomeDetail value, $Res Function(IncomeDetail) _then) = _$IncomeDetailCopyWithImpl;
@useResult
$Res call({
 String description, String projectName, int amount
});




}
/// @nodoc
class _$IncomeDetailCopyWithImpl<$Res>
    implements $IncomeDetailCopyWith<$Res> {
  _$IncomeDetailCopyWithImpl(this._self, this._then);

  final IncomeDetail _self;
  final $Res Function(IncomeDetail) _then;

/// Create a copy of IncomeDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? projectName = null,Object? amount = null,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomeDetail].
extension IncomeDetailPatterns on IncomeDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeDetail value)  $default,){
final _that = this;
switch (_that) {
case _IncomeDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeDetail value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String description,  String projectName,  int amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeDetail() when $default != null:
return $default(_that.description,_that.projectName,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String description,  String projectName,  int amount)  $default,) {final _that = this;
switch (_that) {
case _IncomeDetail():
return $default(_that.description,_that.projectName,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String description,  String projectName,  int amount)?  $default,) {final _that = this;
switch (_that) {
case _IncomeDetail() when $default != null:
return $default(_that.description,_that.projectName,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _IncomeDetail implements IncomeDetail {
  const _IncomeDetail({required this.description, required this.projectName, required this.amount});
  

@override final  String description;
@override final  String projectName;
@override final  int amount;

/// Create a copy of IncomeDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeDetailCopyWith<_IncomeDetail> get copyWith => __$IncomeDetailCopyWithImpl<_IncomeDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeDetail&&(identical(other.description, description) || other.description == description)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,description,projectName,amount);

@override
String toString() {
  return 'IncomeDetail(description: $description, projectName: $projectName, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$IncomeDetailCopyWith<$Res> implements $IncomeDetailCopyWith<$Res> {
  factory _$IncomeDetailCopyWith(_IncomeDetail value, $Res Function(_IncomeDetail) _then) = __$IncomeDetailCopyWithImpl;
@override @useResult
$Res call({
 String description, String projectName, int amount
});




}
/// @nodoc
class __$IncomeDetailCopyWithImpl<$Res>
    implements _$IncomeDetailCopyWith<$Res> {
  __$IncomeDetailCopyWithImpl(this._self, this._then);

  final _IncomeDetail _self;
  final $Res Function(_IncomeDetail) _then;

/// Create a copy of IncomeDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? projectName = null,Object? amount = null,}) {
  return _then(_IncomeDetail(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ExpenseDetail {

 String get description; String get projectName; int get amount;
/// Create a copy of ExpenseDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseDetailCopyWith<ExpenseDetail> get copyWith => _$ExpenseDetailCopyWithImpl<ExpenseDetail>(this as ExpenseDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseDetail&&(identical(other.description, description) || other.description == description)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,description,projectName,amount);

@override
String toString() {
  return 'ExpenseDetail(description: $description, projectName: $projectName, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $ExpenseDetailCopyWith<$Res>  {
  factory $ExpenseDetailCopyWith(ExpenseDetail value, $Res Function(ExpenseDetail) _then) = _$ExpenseDetailCopyWithImpl;
@useResult
$Res call({
 String description, String projectName, int amount
});




}
/// @nodoc
class _$ExpenseDetailCopyWithImpl<$Res>
    implements $ExpenseDetailCopyWith<$Res> {
  _$ExpenseDetailCopyWithImpl(this._self, this._then);

  final ExpenseDetail _self;
  final $Res Function(ExpenseDetail) _then;

/// Create a copy of ExpenseDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? projectName = null,Object? amount = null,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseDetail].
extension ExpenseDetailPatterns on ExpenseDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseDetail value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String description,  String projectName,  int amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseDetail() when $default != null:
return $default(_that.description,_that.projectName,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String description,  String projectName,  int amount)  $default,) {final _that = this;
switch (_that) {
case _ExpenseDetail():
return $default(_that.description,_that.projectName,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String description,  String projectName,  int amount)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseDetail() when $default != null:
return $default(_that.description,_that.projectName,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _ExpenseDetail implements ExpenseDetail {
  const _ExpenseDetail({required this.description, required this.projectName, required this.amount});
  

@override final  String description;
@override final  String projectName;
@override final  int amount;

/// Create a copy of ExpenseDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseDetailCopyWith<_ExpenseDetail> get copyWith => __$ExpenseDetailCopyWithImpl<_ExpenseDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseDetail&&(identical(other.description, description) || other.description == description)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,description,projectName,amount);

@override
String toString() {
  return 'ExpenseDetail(description: $description, projectName: $projectName, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$ExpenseDetailCopyWith<$Res> implements $ExpenseDetailCopyWith<$Res> {
  factory _$ExpenseDetailCopyWith(_ExpenseDetail value, $Res Function(_ExpenseDetail) _then) = __$ExpenseDetailCopyWithImpl;
@override @useResult
$Res call({
 String description, String projectName, int amount
});




}
/// @nodoc
class __$ExpenseDetailCopyWithImpl<$Res>
    implements _$ExpenseDetailCopyWith<$Res> {
  __$ExpenseDetailCopyWithImpl(this._self, this._then);

  final _ExpenseDetail _self;
  final $Res Function(_ExpenseDetail) _then;

/// Create a copy of ExpenseDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? projectName = null,Object? amount = null,}) {
  return _then(_ExpenseDetail(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
