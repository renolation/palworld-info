// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_skill_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActiveSkillEntity _$ActiveSkillEntityFromJson(Map<String, dynamic> json) {
  return _ActiveSkillEntity.fromJson(json);
}

/// @nodoc
mixin _$ActiveSkillEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get power => throw _privateConstructorUsedError;
  int? get cd => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  ElementEntity? get element => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveSkillEntityCopyWith<ActiveSkillEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveSkillEntityCopyWith<$Res> {
  factory $ActiveSkillEntityCopyWith(
          ActiveSkillEntity value, $Res Function(ActiveSkillEntity) then) =
      _$ActiveSkillEntityCopyWithImpl<$Res, ActiveSkillEntity>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? power,
      int? cd,
      String? desc,
      ElementEntity? element});

  $ElementEntityCopyWith<$Res>? get element;
}

/// @nodoc
class _$ActiveSkillEntityCopyWithImpl<$Res, $Val extends ActiveSkillEntity>
    implements $ActiveSkillEntityCopyWith<$Res> {
  _$ActiveSkillEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? power = freezed,
    Object? cd = freezed,
    Object? desc = freezed,
    Object? element = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      power: freezed == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      cd: freezed == cd
          ? _value.cd
          : cd // ignore: cast_nullable_to_non_nullable
              as int?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as ElementEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ElementEntityCopyWith<$Res>? get element {
    if (_value.element == null) {
      return null;
    }

    return $ElementEntityCopyWith<$Res>(_value.element!, (value) {
      return _then(_value.copyWith(element: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActiveSkillEntityImplCopyWith<$Res>
    implements $ActiveSkillEntityCopyWith<$Res> {
  factory _$$ActiveSkillEntityImplCopyWith(_$ActiveSkillEntityImpl value,
          $Res Function(_$ActiveSkillEntityImpl) then) =
      __$$ActiveSkillEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? power,
      int? cd,
      String? desc,
      ElementEntity? element});

  @override
  $ElementEntityCopyWith<$Res>? get element;
}

/// @nodoc
class __$$ActiveSkillEntityImplCopyWithImpl<$Res>
    extends _$ActiveSkillEntityCopyWithImpl<$Res, _$ActiveSkillEntityImpl>
    implements _$$ActiveSkillEntityImplCopyWith<$Res> {
  __$$ActiveSkillEntityImplCopyWithImpl(_$ActiveSkillEntityImpl _value,
      $Res Function(_$ActiveSkillEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? power = freezed,
    Object? cd = freezed,
    Object? desc = freezed,
    Object? element = freezed,
  }) {
    return _then(_$ActiveSkillEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      power: freezed == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      cd: freezed == cd
          ? _value.cd
          : cd // ignore: cast_nullable_to_non_nullable
              as int?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as ElementEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveSkillEntityImpl implements _ActiveSkillEntity {
  const _$ActiveSkillEntityImpl(
      {this.id, this.name, this.power, this.cd, this.desc, this.element});

  factory _$ActiveSkillEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveSkillEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? power;
  @override
  final int? cd;
  @override
  final String? desc;
  @override
  final ElementEntity? element;

  @override
  String toString() {
    return 'ActiveSkillEntity(id: $id, name: $name, power: $power, cd: $cd, desc: $desc, element: $element)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveSkillEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.cd, cd) || other.cd == cd) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.element, element) || other.element == element));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, power, cd, desc, element);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveSkillEntityImplCopyWith<_$ActiveSkillEntityImpl> get copyWith =>
      __$$ActiveSkillEntityImplCopyWithImpl<_$ActiveSkillEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveSkillEntityImplToJson(
      this,
    );
  }
}

abstract class _ActiveSkillEntity implements ActiveSkillEntity {
  const factory _ActiveSkillEntity(
      {final int? id,
      final String? name,
      final int? power,
      final int? cd,
      final String? desc,
      final ElementEntity? element}) = _$ActiveSkillEntityImpl;

  factory _ActiveSkillEntity.fromJson(Map<String, dynamic> json) =
      _$ActiveSkillEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get power;
  @override
  int? get cd;
  @override
  String? get desc;
  @override
  ElementEntity? get element;
  @override
  @JsonKey(ignore: true)
  _$$ActiveSkillEntityImplCopyWith<_$ActiveSkillEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
