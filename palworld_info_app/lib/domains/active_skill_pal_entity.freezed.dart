// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_skill_pal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActiveSkillPalEntity _$ActiveSkillPalEntityFromJson(Map<String, dynamic> json) {
  return _ActiveSkillPalEntity.fromJson(json);
}

/// @nodoc
mixin _$ActiveSkillPalEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get range => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  ActiveSkillEntity? get activeSkill => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveSkillPalEntityCopyWith<ActiveSkillPalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveSkillPalEntityCopyWith<$Res> {
  factory $ActiveSkillPalEntityCopyWith(ActiveSkillPalEntity value,
          $Res Function(ActiveSkillPalEntity) then) =
      _$ActiveSkillPalEntityCopyWithImpl<$Res, ActiveSkillPalEntity>;
  @useResult
  $Res call(
      {int? id, String? range, int? level, ActiveSkillEntity? activeSkill});

  $ActiveSkillEntityCopyWith<$Res>? get activeSkill;
}

/// @nodoc
class _$ActiveSkillPalEntityCopyWithImpl<$Res,
        $Val extends ActiveSkillPalEntity>
    implements $ActiveSkillPalEntityCopyWith<$Res> {
  _$ActiveSkillPalEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? range = freezed,
    Object? level = freezed,
    Object? activeSkill = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      range: freezed == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      activeSkill: freezed == activeSkill
          ? _value.activeSkill
          : activeSkill // ignore: cast_nullable_to_non_nullable
              as ActiveSkillEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActiveSkillEntityCopyWith<$Res>? get activeSkill {
    if (_value.activeSkill == null) {
      return null;
    }

    return $ActiveSkillEntityCopyWith<$Res>(_value.activeSkill!, (value) {
      return _then(_value.copyWith(activeSkill: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActiveSkillPalEntityImplCopyWith<$Res>
    implements $ActiveSkillPalEntityCopyWith<$Res> {
  factory _$$ActiveSkillPalEntityImplCopyWith(_$ActiveSkillPalEntityImpl value,
          $Res Function(_$ActiveSkillPalEntityImpl) then) =
      __$$ActiveSkillPalEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String? range, int? level, ActiveSkillEntity? activeSkill});

  @override
  $ActiveSkillEntityCopyWith<$Res>? get activeSkill;
}

/// @nodoc
class __$$ActiveSkillPalEntityImplCopyWithImpl<$Res>
    extends _$ActiveSkillPalEntityCopyWithImpl<$Res, _$ActiveSkillPalEntityImpl>
    implements _$$ActiveSkillPalEntityImplCopyWith<$Res> {
  __$$ActiveSkillPalEntityImplCopyWithImpl(_$ActiveSkillPalEntityImpl _value,
      $Res Function(_$ActiveSkillPalEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? range = freezed,
    Object? level = freezed,
    Object? activeSkill = freezed,
  }) {
    return _then(_$ActiveSkillPalEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      range: freezed == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      activeSkill: freezed == activeSkill
          ? _value.activeSkill
          : activeSkill // ignore: cast_nullable_to_non_nullable
              as ActiveSkillEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveSkillPalEntityImpl implements _ActiveSkillPalEntity {
  const _$ActiveSkillPalEntityImpl(
      {this.id, this.range, this.level, this.activeSkill});

  factory _$ActiveSkillPalEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveSkillPalEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? range;
  @override
  final int? level;
  @override
  final ActiveSkillEntity? activeSkill;

  @override
  String toString() {
    return 'ActiveSkillPalEntity(id: $id, range: $range, level: $level, activeSkill: $activeSkill)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveSkillPalEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.range, range) || other.range == range) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.activeSkill, activeSkill) ||
                other.activeSkill == activeSkill));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, range, level, activeSkill);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveSkillPalEntityImplCopyWith<_$ActiveSkillPalEntityImpl>
      get copyWith =>
          __$$ActiveSkillPalEntityImplCopyWithImpl<_$ActiveSkillPalEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveSkillPalEntityImplToJson(
      this,
    );
  }
}

abstract class _ActiveSkillPalEntity implements ActiveSkillPalEntity {
  const factory _ActiveSkillPalEntity(
      {final int? id,
      final String? range,
      final int? level,
      final ActiveSkillEntity? activeSkill}) = _$ActiveSkillPalEntityImpl;

  factory _ActiveSkillPalEntity.fromJson(Map<String, dynamic> json) =
      _$ActiveSkillPalEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get range;
  @override
  int? get level;
  @override
  ActiveSkillEntity? get activeSkill;
  @override
  @JsonKey(ignore: true)
  _$$ActiveSkillPalEntityImplCopyWith<_$ActiveSkillPalEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
