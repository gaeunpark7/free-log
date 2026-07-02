// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileStatsModel {

 int get inProgressCount; double get totalHours; int get totalIncome; int get totalExpense;
/// Create a copy of ProfileStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStatsModelCopyWith<ProfileStatsModel> get copyWith => _$ProfileStatsModelCopyWithImpl<ProfileStatsModel>(this as ProfileStatsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileStatsModel&&(identical(other.inProgressCount, inProgressCount) || other.inProgressCount == inProgressCount)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}


@override
int get hashCode => Object.hash(runtimeType,inProgressCount,totalHours,totalIncome,totalExpense);

@override
String toString() {
  return 'ProfileStatsModel(inProgressCount: $inProgressCount, totalHours: $totalHours, totalIncome: $totalIncome, totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class $ProfileStatsModelCopyWith<$Res>  {
  factory $ProfileStatsModelCopyWith(ProfileStatsModel value, $Res Function(ProfileStatsModel) _then) = _$ProfileStatsModelCopyWithImpl;
@useResult
$Res call({
 int inProgressCount, double totalHours, int totalIncome, int totalExpense
});




}
/// @nodoc
class _$ProfileStatsModelCopyWithImpl<$Res>
    implements $ProfileStatsModelCopyWith<$Res> {
  _$ProfileStatsModelCopyWithImpl(this._self, this._then);

  final ProfileStatsModel _self;
  final $Res Function(ProfileStatsModel) _then;

/// Create a copy of ProfileStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inProgressCount = null,Object? totalHours = null,Object? totalIncome = null,Object? totalExpense = null,}) {
  return _then(_self.copyWith(
inProgressCount: null == inProgressCount ? _self.inProgressCount : inProgressCount // ignore: cast_nullable_to_non_nullable
as int,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double,totalIncome: null == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as int,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileStatsModel].
extension ProfileStatsModelPatterns on ProfileStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int inProgressCount,  double totalHours,  int totalIncome,  int totalExpense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileStatsModel() when $default != null:
return $default(_that.inProgressCount,_that.totalHours,_that.totalIncome,_that.totalExpense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int inProgressCount,  double totalHours,  int totalIncome,  int totalExpense)  $default,) {final _that = this;
switch (_that) {
case _ProfileStatsModel():
return $default(_that.inProgressCount,_that.totalHours,_that.totalIncome,_that.totalExpense);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int inProgressCount,  double totalHours,  int totalIncome,  int totalExpense)?  $default,) {final _that = this;
switch (_that) {
case _ProfileStatsModel() when $default != null:
return $default(_that.inProgressCount,_that.totalHours,_that.totalIncome,_that.totalExpense);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileStatsModel extends ProfileStatsModel {
  const _ProfileStatsModel({this.inProgressCount = 0, this.totalHours = 0.0, this.totalIncome = 0, this.totalExpense = 0}): super._();
  

@override@JsonKey() final  int inProgressCount;
@override@JsonKey() final  double totalHours;
@override@JsonKey() final  int totalIncome;
@override@JsonKey() final  int totalExpense;

/// Create a copy of ProfileStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStatsModelCopyWith<_ProfileStatsModel> get copyWith => __$ProfileStatsModelCopyWithImpl<_ProfileStatsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileStatsModel&&(identical(other.inProgressCount, inProgressCount) || other.inProgressCount == inProgressCount)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}


@override
int get hashCode => Object.hash(runtimeType,inProgressCount,totalHours,totalIncome,totalExpense);

@override
String toString() {
  return 'ProfileStatsModel(inProgressCount: $inProgressCount, totalHours: $totalHours, totalIncome: $totalIncome, totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class _$ProfileStatsModelCopyWith<$Res> implements $ProfileStatsModelCopyWith<$Res> {
  factory _$ProfileStatsModelCopyWith(_ProfileStatsModel value, $Res Function(_ProfileStatsModel) _then) = __$ProfileStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int inProgressCount, double totalHours, int totalIncome, int totalExpense
});




}
/// @nodoc
class __$ProfileStatsModelCopyWithImpl<$Res>
    implements _$ProfileStatsModelCopyWith<$Res> {
  __$ProfileStatsModelCopyWithImpl(this._self, this._then);

  final _ProfileStatsModel _self;
  final $Res Function(_ProfileStatsModel) _then;

/// Create a copy of ProfileStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inProgressCount = null,Object? totalHours = null,Object? totalIncome = null,Object? totalExpense = null,}) {
  return _then(_ProfileStatsModel(
inProgressCount: null == inProgressCount ? _self.inProgressCount : inProgressCount // ignore: cast_nullable_to_non_nullable
as int,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double,totalIncome: null == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as int,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
