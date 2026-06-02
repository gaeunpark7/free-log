// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_entries_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeEntriesModel {

 String? get id;@JsonKey(name: 'project_id') String get projectId;@JsonKey(name: 'worked_at') DateTime get workedAt; double get hours;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of TimeEntriesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeEntriesModelCopyWith<TimeEntriesModel> get copyWith => _$TimeEntriesModelCopyWithImpl<TimeEntriesModel>(this as TimeEntriesModel, _$identity);

  /// Serializes this TimeEntriesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeEntriesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.workedAt, workedAt) || other.workedAt == workedAt)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,workedAt,hours,createdAt);

@override
String toString() {
  return 'TimeEntriesModel(id: $id, projectId: $projectId, workedAt: $workedAt, hours: $hours, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TimeEntriesModelCopyWith<$Res>  {
  factory $TimeEntriesModelCopyWith(TimeEntriesModel value, $Res Function(TimeEntriesModel) _then) = _$TimeEntriesModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'project_id') String projectId,@JsonKey(name: 'worked_at') DateTime workedAt, double hours,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$TimeEntriesModelCopyWithImpl<$Res>
    implements $TimeEntriesModelCopyWith<$Res> {
  _$TimeEntriesModelCopyWithImpl(this._self, this._then);

  final TimeEntriesModel _self;
  final $Res Function(TimeEntriesModel) _then;

/// Create a copy of TimeEntriesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? projectId = null,Object? workedAt = null,Object? hours = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,workedAt: null == workedAt ? _self.workedAt : workedAt // ignore: cast_nullable_to_non_nullable
as DateTime,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeEntriesModel].
extension TimeEntriesModelPatterns on TimeEntriesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeEntriesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeEntriesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeEntriesModel value)  $default,){
final _that = this;
switch (_that) {
case _TimeEntriesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeEntriesModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimeEntriesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'project_id')  String projectId, @JsonKey(name: 'worked_at')  DateTime workedAt,  double hours, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeEntriesModel() when $default != null:
return $default(_that.id,_that.projectId,_that.workedAt,_that.hours,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'project_id')  String projectId, @JsonKey(name: 'worked_at')  DateTime workedAt,  double hours, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _TimeEntriesModel():
return $default(_that.id,_that.projectId,_that.workedAt,_that.hours,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'project_id')  String projectId, @JsonKey(name: 'worked_at')  DateTime workedAt,  double hours, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TimeEntriesModel() when $default != null:
return $default(_that.id,_that.projectId,_that.workedAt,_that.hours,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeEntriesModel implements TimeEntriesModel {
   _TimeEntriesModel({required this.id, @JsonKey(name: 'project_id') required this.projectId, @JsonKey(name: 'worked_at') required this.workedAt, required this.hours, @JsonKey(name: 'created_at') required this.createdAt});
  factory _TimeEntriesModel.fromJson(Map<String, dynamic> json) => _$TimeEntriesModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'project_id') final  String projectId;
@override@JsonKey(name: 'worked_at') final  DateTime workedAt;
@override final  double hours;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of TimeEntriesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeEntriesModelCopyWith<_TimeEntriesModel> get copyWith => __$TimeEntriesModelCopyWithImpl<_TimeEntriesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeEntriesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeEntriesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.workedAt, workedAt) || other.workedAt == workedAt)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,workedAt,hours,createdAt);

@override
String toString() {
  return 'TimeEntriesModel(id: $id, projectId: $projectId, workedAt: $workedAt, hours: $hours, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TimeEntriesModelCopyWith<$Res> implements $TimeEntriesModelCopyWith<$Res> {
  factory _$TimeEntriesModelCopyWith(_TimeEntriesModel value, $Res Function(_TimeEntriesModel) _then) = __$TimeEntriesModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'project_id') String projectId,@JsonKey(name: 'worked_at') DateTime workedAt, double hours,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$TimeEntriesModelCopyWithImpl<$Res>
    implements _$TimeEntriesModelCopyWith<$Res> {
  __$TimeEntriesModelCopyWithImpl(this._self, this._then);

  final _TimeEntriesModel _self;
  final $Res Function(_TimeEntriesModel) _then;

/// Create a copy of TimeEntriesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? projectId = null,Object? workedAt = null,Object? hours = null,Object? createdAt = null,}) {
  return _then(_TimeEntriesModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,workedAt: null == workedAt ? _self.workedAt : workedAt // ignore: cast_nullable_to_non_nullable
as DateTime,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
