// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todos_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodosDto {

 String? get id;@JsonKey(name: 'project_id') String? get projectId; String get content;@JsonKey(name: 'is_done') bool get isDone;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of TodosDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodosDtoCopyWith<TodosDto> get copyWith => _$TodosDtoCopyWithImpl<TodosDto>(this as TodosDto, _$identity);

  /// Serializes this TodosDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodosDto&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,content,isDone,createdAt);

@override
String toString() {
  return 'TodosDto(id: $id, projectId: $projectId, content: $content, isDone: $isDone, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TodosDtoCopyWith<$Res>  {
  factory $TodosDtoCopyWith(TodosDto value, $Res Function(TodosDto) _then) = _$TodosDtoCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'project_id') String? projectId, String content,@JsonKey(name: 'is_done') bool isDone,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$TodosDtoCopyWithImpl<$Res>
    implements $TodosDtoCopyWith<$Res> {
  _$TodosDtoCopyWithImpl(this._self, this._then);

  final TodosDto _self;
  final $Res Function(TodosDto) _then;

/// Create a copy of TodosDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? projectId = freezed,Object? content = null,Object? isDone = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodosDto].
extension TodosDtoPatterns on TodosDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodosDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodosDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodosDto value)  $default,){
final _that = this;
switch (_that) {
case _TodosDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodosDto value)?  $default,){
final _that = this;
switch (_that) {
case _TodosDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'project_id')  String? projectId,  String content, @JsonKey(name: 'is_done')  bool isDone, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodosDto() when $default != null:
return $default(_that.id,_that.projectId,_that.content,_that.isDone,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'project_id')  String? projectId,  String content, @JsonKey(name: 'is_done')  bool isDone, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _TodosDto():
return $default(_that.id,_that.projectId,_that.content,_that.isDone,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'project_id')  String? projectId,  String content, @JsonKey(name: 'is_done')  bool isDone, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TodosDto() when $default != null:
return $default(_that.id,_that.projectId,_that.content,_that.isDone,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodosDto implements TodosDto {
  const _TodosDto({this.id, @JsonKey(name: 'project_id') this.projectId, required this.content, @JsonKey(name: 'is_done') this.isDone = false, @JsonKey(name: 'created_at') this.createdAt});
  factory _TodosDto.fromJson(Map<String, dynamic> json) => _$TodosDtoFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'project_id') final  String? projectId;
@override final  String content;
@override@JsonKey(name: 'is_done') final  bool isDone;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of TodosDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodosDtoCopyWith<_TodosDto> get copyWith => __$TodosDtoCopyWithImpl<_TodosDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodosDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodosDto&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,content,isDone,createdAt);

@override
String toString() {
  return 'TodosDto(id: $id, projectId: $projectId, content: $content, isDone: $isDone, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TodosDtoCopyWith<$Res> implements $TodosDtoCopyWith<$Res> {
  factory _$TodosDtoCopyWith(_TodosDto value, $Res Function(_TodosDto) _then) = __$TodosDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'project_id') String? projectId, String content,@JsonKey(name: 'is_done') bool isDone,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$TodosDtoCopyWithImpl<$Res>
    implements _$TodosDtoCopyWith<$Res> {
  __$TodosDtoCopyWithImpl(this._self, this._then);

  final _TodosDto _self;
  final $Res Function(_TodosDto) _then;

/// Create a copy of TodosDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? projectId = freezed,Object? content = null,Object? isDone = null,Object? createdAt = freezed,}) {
  return _then(_TodosDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
