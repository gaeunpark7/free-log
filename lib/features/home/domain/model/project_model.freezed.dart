// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectModel {

 String? get id;@JsonKey(name: 'user_id') String? get userId; String get title; ProjectStatus get status; DateTime? get deadline;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'hourly_rate') double get hourlyRate;@JsonKey(name: 'margin_rate') double get marginRate;
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<ProjectModel> get copyWith => _$ProjectModelCopyWithImpl<ProjectModel>(this as ProjectModel, _$identity);

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.hourlyRate, hourlyRate) || other.hourlyRate == hourlyRate)&&(identical(other.marginRate, marginRate) || other.marginRate == marginRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,title,status,deadline,createdAt,hourlyRate,marginRate);

@override
String toString() {
  return 'ProjectModel(id: $id, userId: $userId, title: $title, status: $status, deadline: $deadline, createdAt: $createdAt, hourlyRate: $hourlyRate, marginRate: $marginRate)';
}


}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res>  {
  factory $ProjectModelCopyWith(ProjectModel value, $Res Function(ProjectModel) _then) = _$ProjectModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String? userId, String title, ProjectStatus status, DateTime? deadline,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'hourly_rate') double hourlyRate,@JsonKey(name: 'margin_rate') double marginRate
});




}
/// @nodoc
class _$ProjectModelCopyWithImpl<$Res>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._self, this._then);

  final ProjectModel _self;
  final $Res Function(ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? title = null,Object? status = null,Object? deadline = freezed,Object? createdAt = freezed,Object? hourlyRate = null,Object? marginRate = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,hourlyRate: null == hourlyRate ? _self.hourlyRate : hourlyRate // ignore: cast_nullable_to_non_nullable
as double,marginRate: null == marginRate ? _self.marginRate : marginRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectModel].
extension ProjectModelPatterns on ProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String? userId,  String title,  ProjectStatus status,  DateTime? deadline, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'hourly_rate')  double hourlyRate, @JsonKey(name: 'margin_rate')  double marginRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.status,_that.deadline,_that.createdAt,_that.hourlyRate,_that.marginRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String? userId,  String title,  ProjectStatus status,  DateTime? deadline, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'hourly_rate')  double hourlyRate, @JsonKey(name: 'margin_rate')  double marginRate)  $default,) {final _that = this;
switch (_that) {
case _ProjectModel():
return $default(_that.id,_that.userId,_that.title,_that.status,_that.deadline,_that.createdAt,_that.hourlyRate,_that.marginRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'user_id')  String? userId,  String title,  ProjectStatus status,  DateTime? deadline, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'hourly_rate')  double hourlyRate, @JsonKey(name: 'margin_rate')  double marginRate)?  $default,) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.status,_that.deadline,_that.createdAt,_that.hourlyRate,_that.marginRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectModel implements ProjectModel {
  const _ProjectModel({this.id, @JsonKey(name: 'user_id') this.userId, required this.title, this.status = ProjectStatus.inProgress, this.deadline, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'hourly_rate') this.hourlyRate = 0.0, @JsonKey(name: 'margin_rate') this.marginRate = 0.3});
  factory _ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override final  String title;
@override@JsonKey() final  ProjectStatus status;
@override final  DateTime? deadline;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'hourly_rate') final  double hourlyRate;
@override@JsonKey(name: 'margin_rate') final  double marginRate;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectModelCopyWith<_ProjectModel> get copyWith => __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.hourlyRate, hourlyRate) || other.hourlyRate == hourlyRate)&&(identical(other.marginRate, marginRate) || other.marginRate == marginRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,title,status,deadline,createdAt,hourlyRate,marginRate);

@override
String toString() {
  return 'ProjectModel(id: $id, userId: $userId, title: $title, status: $status, deadline: $deadline, createdAt: $createdAt, hourlyRate: $hourlyRate, marginRate: $marginRate)';
}


}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res> implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(_ProjectModel value, $Res Function(_ProjectModel) _then) = __$ProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String? userId, String title, ProjectStatus status, DateTime? deadline,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'hourly_rate') double hourlyRate,@JsonKey(name: 'margin_rate') double marginRate
});




}
/// @nodoc
class __$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(this._self, this._then);

  final _ProjectModel _self;
  final $Res Function(_ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? title = null,Object? status = null,Object? deadline = freezed,Object? createdAt = freezed,Object? hourlyRate = null,Object? marginRate = null,}) {
  return _then(_ProjectModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,hourlyRate: null == hourlyRate ? _self.hourlyRate : hourlyRate // ignore: cast_nullable_to_non_nullable
as double,marginRate: null == marginRate ? _self.marginRate : marginRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
