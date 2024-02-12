// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passive_skill_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PassiveSkillEntity _$PassiveSkillEntityFromJson(Map<String, dynamic> json) {
  return _PassiveSkillEntity.fromJson(json);
}

/// @nodoc
mixin _$PassiveSkillEntity {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<PassiveDescEntity>? get passiveDesc =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassiveSkillEntityCopyWith<PassiveSkillEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassiveSkillEntityCopyWith<$Res> {
  factory $PassiveSkillEntityCopyWith(
          PassiveSkillEntity value, $Res Function(PassiveSkillEntity) then) =
      _$PassiveSkillEntityCopyWithImpl<$Res, PassiveSkillEntity>;
  @useResult
  $Res call({int id, String? name, List<PassiveDescEntity>? passiveDesc});
}

/// @nodoc
class _$PassiveSkillEntityCopyWithImpl<$Res, $Val extends PassiveSkillEntity>
    implements $PassiveSkillEntityCopyWith<$Res> {
  _$PassiveSkillEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? passiveDesc = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      passiveDesc: freezed == passiveDesc
          ? _value.passiveDesc
          : passiveDesc // ignore: cast_nullable_to_non_nullable
              as List<PassiveDescEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PassiveSkillEntityImplCopyWith<$Res>
    implements $PassiveSkillEntityCopyWith<$Res> {
  factory _$$PassiveSkillEntityImplCopyWith(_$PassiveSkillEntityImpl value,
          $Res Function(_$PassiveSkillEntityImpl) then) =
      __$$PassiveSkillEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name, List<PassiveDescEntity>? passiveDesc});
}

/// @nodoc
class __$$PassiveSkillEntityImplCopyWithImpl<$Res>
    extends _$PassiveSkillEntityCopyWithImpl<$Res, _$PassiveSkillEntityImpl>
    implements _$$PassiveSkillEntityImplCopyWith<$Res> {
  __$$PassiveSkillEntityImplCopyWithImpl(_$PassiveSkillEntityImpl _value,
      $Res Function(_$PassiveSkillEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? passiveDesc = freezed,
  }) {
    return _then(_$PassiveSkillEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      passiveDesc: freezed == passiveDesc
          ? _value._passiveDesc
          : passiveDesc // ignore: cast_nullable_to_non_nullable
              as List<PassiveDescEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassiveSkillEntityImpl implements _PassiveSkillEntity {
  const _$PassiveSkillEntityImpl(
      {required this.id, this.name, final List<PassiveDescEntity>? passiveDesc})
      : _passiveDesc = passiveDesc;

  factory _$PassiveSkillEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassiveSkillEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  final List<PassiveDescEntity>? _passiveDesc;
  @override
  List<PassiveDescEntity>? get passiveDesc {
    final value = _passiveDesc;
    if (value == null) return null;
    if (_passiveDesc is EqualUnmodifiableListView) return _passiveDesc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PassiveSkillEntity(id: $id, name: $name, passiveDesc: $passiveDesc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassiveSkillEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._passiveDesc, _passiveDesc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_passiveDesc));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PassiveSkillEntityImplCopyWith<_$PassiveSkillEntityImpl> get copyWith =>
      __$$PassiveSkillEntityImplCopyWithImpl<_$PassiveSkillEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassiveSkillEntityImplToJson(
      this,
    );
  }
}

abstract class _PassiveSkillEntity implements PassiveSkillEntity {
  const factory _PassiveSkillEntity(
      {required final int id,
      final String? name,
      final List<PassiveDescEntity>? passiveDesc}) = _$PassiveSkillEntityImpl;

  factory _PassiveSkillEntity.fromJson(Map<String, dynamic> json) =
      _$PassiveSkillEntityImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  List<PassiveDescEntity>? get passiveDesc;
  @override
  @JsonKey(ignore: true)
  _$$PassiveSkillEntityImplCopyWith<_$PassiveSkillEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PassiveDescEntity _$PassiveDescEntityFromJson(Map<String, dynamic> json) {
  return _PassiveDescEntity.fromJson(json);
}

/// @nodoc
mixin _$PassiveDescEntity {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get isPositive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassiveDescEntityCopyWith<PassiveDescEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassiveDescEntityCopyWith<$Res> {
  factory $PassiveDescEntityCopyWith(
          PassiveDescEntity value, $Res Function(PassiveDescEntity) then) =
      _$PassiveDescEntityCopyWithImpl<$Res, PassiveDescEntity>;
  @useResult
  $Res call({int id, String? name, bool? isPositive});
}

/// @nodoc
class _$PassiveDescEntityCopyWithImpl<$Res, $Val extends PassiveDescEntity>
    implements $PassiveDescEntityCopyWith<$Res> {
  _$PassiveDescEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? isPositive = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isPositive: freezed == isPositive
          ? _value.isPositive
          : isPositive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PassiveDescEntityImplCopyWith<$Res>
    implements $PassiveDescEntityCopyWith<$Res> {
  factory _$$PassiveDescEntityImplCopyWith(_$PassiveDescEntityImpl value,
          $Res Function(_$PassiveDescEntityImpl) then) =
      __$$PassiveDescEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name, bool? isPositive});
}

/// @nodoc
class __$$PassiveDescEntityImplCopyWithImpl<$Res>
    extends _$PassiveDescEntityCopyWithImpl<$Res, _$PassiveDescEntityImpl>
    implements _$$PassiveDescEntityImplCopyWith<$Res> {
  __$$PassiveDescEntityImplCopyWithImpl(_$PassiveDescEntityImpl _value,
      $Res Function(_$PassiveDescEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? isPositive = freezed,
  }) {
    return _then(_$PassiveDescEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isPositive: freezed == isPositive
          ? _value.isPositive
          : isPositive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassiveDescEntityImpl implements _PassiveDescEntity {
  const _$PassiveDescEntityImpl({required this.id, this.name, this.isPositive});

  factory _$PassiveDescEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassiveDescEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final bool? isPositive;

  @override
  String toString() {
    return 'PassiveDescEntity(id: $id, name: $name, isPositive: $isPositive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassiveDescEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPositive, isPositive) ||
                other.isPositive == isPositive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isPositive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PassiveDescEntityImplCopyWith<_$PassiveDescEntityImpl> get copyWith =>
      __$$PassiveDescEntityImplCopyWithImpl<_$PassiveDescEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassiveDescEntityImplToJson(
      this,
    );
  }
}

abstract class _PassiveDescEntity implements PassiveDescEntity {
  const factory _PassiveDescEntity(
      {required final int id,
      final String? name,
      final bool? isPositive}) = _$PassiveDescEntityImpl;

  factory _PassiveDescEntity.fromJson(Map<String, dynamic> json) =
      _$PassiveDescEntityImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  bool? get isPositive;
  @override
  @JsonKey(ignore: true)
  _$$PassiveDescEntityImplCopyWith<_$PassiveDescEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
