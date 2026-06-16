// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomeModel {

 String? get id;@JsonKey(name: 'project_id') String? get projectId; int get amount; String get description;@JsonKey(name: 'received_at') DateTime get receivedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of IncomeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeModelCopyWith<IncomeModel> get copyWith => _$IncomeModelCopyWithImpl<IncomeModel>(this as IncomeModel, _$identity);

  /// Serializes this IncomeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.description, description) || other.description == description)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,amount,description,receivedAt,createdAt);

@override
String toString() {
  return 'IncomeModel(id: $id, projectId: $projectId, amount: $amount, description: $description, receivedAt: $receivedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $IncomeModelCopyWith<$Res>  {
  factory $IncomeModelCopyWith(IncomeModel value, $Res Function(IncomeModel) _then) = _$IncomeModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'project_id') String? projectId, int amount, String description,@JsonKey(name: 'received_at') DateTime receivedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$IncomeModelCopyWithImpl<$Res>
    implements $IncomeModelCopyWith<$Res> {
  _$IncomeModelCopyWithImpl(this._self, this._then);

  final IncomeModel _self;
  final $Res Function(IncomeModel) _then;

/// Create a copy of IncomeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? projectId = freezed,Object? amount = null,Object? description = null,Object? receivedAt = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomeModel].
extension IncomeModelPatterns on IncomeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeModel value)  $default,){
final _that = this;
switch (_that) {
case _IncomeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'project_id')  String? projectId,  int amount,  String description, @JsonKey(name: 'received_at')  DateTime receivedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeModel() when $default != null:
return $default(_that.id,_that.projectId,_that.amount,_that.description,_that.receivedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'project_id')  String? projectId,  int amount,  String description, @JsonKey(name: 'received_at')  DateTime receivedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _IncomeModel():
return $default(_that.id,_that.projectId,_that.amount,_that.description,_that.receivedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'project_id')  String? projectId,  int amount,  String description, @JsonKey(name: 'received_at')  DateTime receivedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _IncomeModel() when $default != null:
return $default(_that.id,_that.projectId,_that.amount,_that.description,_that.receivedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomeModel implements IncomeModel {
  const _IncomeModel({this.id, @JsonKey(name: 'project_id') this.projectId, required this.amount, required this.description, @JsonKey(name: 'received_at') required this.receivedAt, @JsonKey(name: 'created_at') this.createdAt});
  factory _IncomeModel.fromJson(Map<String, dynamic> json) => _$IncomeModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'project_id') final  String? projectId;
@override final  int amount;
@override final  String description;
@override@JsonKey(name: 'received_at') final  DateTime receivedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of IncomeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeModelCopyWith<_IncomeModel> get copyWith => __$IncomeModelCopyWithImpl<_IncomeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.description, description) || other.description == description)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,amount,description,receivedAt,createdAt);

@override
String toString() {
  return 'IncomeModel(id: $id, projectId: $projectId, amount: $amount, description: $description, receivedAt: $receivedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$IncomeModelCopyWith<$Res> implements $IncomeModelCopyWith<$Res> {
  factory _$IncomeModelCopyWith(_IncomeModel value, $Res Function(_IncomeModel) _then) = __$IncomeModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'project_id') String? projectId, int amount, String description,@JsonKey(name: 'received_at') DateTime receivedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$IncomeModelCopyWithImpl<$Res>
    implements _$IncomeModelCopyWith<$Res> {
  __$IncomeModelCopyWithImpl(this._self, this._then);

  final _IncomeModel _self;
  final $Res Function(_IncomeModel) _then;

/// Create a copy of IncomeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? projectId = freezed,Object? amount = null,Object? description = null,Object? receivedAt = null,Object? createdAt = freezed,}) {
  return _then(_IncomeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
