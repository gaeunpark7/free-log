// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_entry_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeEntryDto {

 String? get id;@JsonKey(name: 'project_id') String? get projectId;@JsonKey(name: 'worked_at') DateTime? get workedAt; int get minutes;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of TimeEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeEntryDtoCopyWith<TimeEntryDto> get copyWith => _$TimeEntryDtoCopyWithImpl<TimeEntryDto>(this as TimeEntryDto, _$identity);

  /// Serializes this TimeEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeEntryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.workedAt, workedAt) || other.workedAt == workedAt)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,workedAt,minutes,createdAt);

@override
String toString() {
  return 'TimeEntryDto(id: $id, projectId: $projectId, workedAt: $workedAt, minutes: $minutes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TimeEntryDtoCopyWith<$Res>  {
  factory $TimeEntryDtoCopyWith(TimeEntryDto value, $Res Function(TimeEntryDto) _then) = _$TimeEntryDtoCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'project_id') String? projectId,@JsonKey(name: 'worked_at') DateTime? workedAt, int minutes,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$TimeEntryDtoCopyWithImpl<$Res>
    implements $TimeEntryDtoCopyWith<$Res> {
  _$TimeEntryDtoCopyWithImpl(this._self, this._then);

  final TimeEntryDto _self;
  final $Res Function(TimeEntryDto) _then;

/// Create a copy of TimeEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? projectId = freezed,Object? workedAt = freezed,Object? minutes = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,workedAt: freezed == workedAt ? _self.workedAt : workedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeEntryDto].
extension TimeEntryDtoPatterns on TimeEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _TimeEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimeEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'project_id')  String? projectId, @JsonKey(name: 'worked_at')  DateTime? workedAt,  int minutes, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeEntryDto() when $default != null:
return $default(_that.id,_that.projectId,_that.workedAt,_that.minutes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'project_id')  String? projectId, @JsonKey(name: 'worked_at')  DateTime? workedAt,  int minutes, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _TimeEntryDto():
return $default(_that.id,_that.projectId,_that.workedAt,_that.minutes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'project_id')  String? projectId, @JsonKey(name: 'worked_at')  DateTime? workedAt,  int minutes, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TimeEntryDto() when $default != null:
return $default(_that.id,_that.projectId,_that.workedAt,_that.minutes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeEntryDto implements TimeEntryDto {
  const _TimeEntryDto({this.id, @JsonKey(name: 'project_id') this.projectId, @JsonKey(name: 'worked_at') this.workedAt, required this.minutes, @JsonKey(name: 'created_at') this.createdAt});
  factory _TimeEntryDto.fromJson(Map<String, dynamic> json) => _$TimeEntryDtoFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'project_id') final  String? projectId;
@override@JsonKey(name: 'worked_at') final  DateTime? workedAt;
@override final  int minutes;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of TimeEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeEntryDtoCopyWith<_TimeEntryDto> get copyWith => __$TimeEntryDtoCopyWithImpl<_TimeEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeEntryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.workedAt, workedAt) || other.workedAt == workedAt)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,workedAt,minutes,createdAt);

@override
String toString() {
  return 'TimeEntryDto(id: $id, projectId: $projectId, workedAt: $workedAt, minutes: $minutes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TimeEntryDtoCopyWith<$Res> implements $TimeEntryDtoCopyWith<$Res> {
  factory _$TimeEntryDtoCopyWith(_TimeEntryDto value, $Res Function(_TimeEntryDto) _then) = __$TimeEntryDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'project_id') String? projectId,@JsonKey(name: 'worked_at') DateTime? workedAt, int minutes,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$TimeEntryDtoCopyWithImpl<$Res>
    implements _$TimeEntryDtoCopyWith<$Res> {
  __$TimeEntryDtoCopyWithImpl(this._self, this._then);

  final _TimeEntryDto _self;
  final $Res Function(_TimeEntryDto) _then;

/// Create a copy of TimeEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? projectId = freezed,Object? workedAt = freezed,Object? minutes = null,Object? createdAt = freezed,}) {
  return _then(_TimeEntryDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,workedAt: freezed == workedAt ? _self.workedAt : workedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
