// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level_work_suitability_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LevelWorkSuitabilityEntity _$LevelWorkSuitabilityEntityFromJson(
    Map<String, dynamic> json) {
  return _LevelWorkSuitabilityEntity.fromJson(json);
}

/// @nodoc
mixin _$LevelWorkSuitabilityEntity {
  int get id => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  WorkSuitabilityEntity? get workSuitability =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LevelWorkSuitabilityEntityCopyWith<LevelWorkSuitabilityEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelWorkSuitabilityEntityCopyWith<$Res> {
  factory $LevelWorkSuitabilityEntityCopyWith(LevelWorkSuitabilityEntity value,
          $Res Function(LevelWorkSuitabilityEntity) then) =
      _$LevelWorkSuitabilityEntityCopyWithImpl<$Res,
          LevelWorkSuitabilityEntity>;
  @useResult
  $Res call({int id, int? level, WorkSuitabilityEntity? workSuitability});

  $WorkSuitabilityEntityCopyWith<$Res>? get workSuitability;
}

/// @nodoc
class _$LevelWorkSuitabilityEntityCopyWithImpl<$Res,
        $Val extends LevelWorkSuitabilityEntity>
    implements $LevelWorkSuitabilityEntityCopyWith<$Res> {
  _$LevelWorkSuitabilityEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = freezed,
    Object? workSuitability = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      workSuitability: freezed == workSuitability
          ? _value.workSuitability
          : workSuitability // ignore: cast_nullable_to_non_nullable
              as WorkSuitabilityEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkSuitabilityEntityCopyWith<$Res>? get workSuitability {
    if (_value.workSuitability == null) {
      return null;
    }

    return $WorkSuitabilityEntityCopyWith<$Res>(_value.workSuitability!,
        (value) {
      return _then(_value.copyWith(workSuitability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LevelWorkSuitabilityEntityImplCopyWith<$Res>
    implements $LevelWorkSuitabilityEntityCopyWith<$Res> {
  factory _$$LevelWorkSuitabilityEntityImplCopyWith(
          _$LevelWorkSuitabilityEntityImpl value,
          $Res Function(_$LevelWorkSuitabilityEntityImpl) then) =
      __$$LevelWorkSuitabilityEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int? level, WorkSuitabilityEntity? workSuitability});

  @override
  $WorkSuitabilityEntityCopyWith<$Res>? get workSuitability;
}

/// @nodoc
class __$$LevelWorkSuitabilityEntityImplCopyWithImpl<$Res>
    extends _$LevelWorkSuitabilityEntityCopyWithImpl<$Res,
        _$LevelWorkSuitabilityEntityImpl>
    implements _$$LevelWorkSuitabilityEntityImplCopyWith<$Res> {
  __$$LevelWorkSuitabilityEntityImplCopyWithImpl(
      _$LevelWorkSuitabilityEntityImpl _value,
      $Res Function(_$LevelWorkSuitabilityEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = freezed,
    Object? workSuitability = freezed,
  }) {
    return _then(_$LevelWorkSuitabilityEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      workSuitability: freezed == workSuitability
          ? _value.workSuitability
          : workSuitability // ignore: cast_nullable_to_non_nullable
              as WorkSuitabilityEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LevelWorkSuitabilityEntityImpl implements _LevelWorkSuitabilityEntity {
  const _$LevelWorkSuitabilityEntityImpl(
      {required this.id, this.level, required this.workSuitability});

  factory _$LevelWorkSuitabilityEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LevelWorkSuitabilityEntityImplFromJson(json);

  @override
  final int id;
  @override
  final int? level;
  @override
  final WorkSuitabilityEntity? workSuitability;

  @override
  String toString() {
    return 'LevelWorkSuitabilityEntity(id: $id, level: $level, workSuitability: $workSuitability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LevelWorkSuitabilityEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.workSuitability, workSuitability) ||
                other.workSuitability == workSuitability));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, level, workSuitability);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LevelWorkSuitabilityEntityImplCopyWith<_$LevelWorkSuitabilityEntityImpl>
      get copyWith => __$$LevelWorkSuitabilityEntityImplCopyWithImpl<
          _$LevelWorkSuitabilityEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LevelWorkSuitabilityEntityImplToJson(
      this,
    );
  }
}

abstract class _LevelWorkSuitabilityEntity
    implements LevelWorkSuitabilityEntity {
  const factory _LevelWorkSuitabilityEntity(
          {required final int id,
          final int? level,
          required final WorkSuitabilityEntity? workSuitability}) =
      _$LevelWorkSuitabilityEntityImpl;

  factory _LevelWorkSuitabilityEntity.fromJson(Map<String, dynamic> json) =
      _$LevelWorkSuitabilityEntityImpl.fromJson;

  @override
  int get id;
  @override
  int? get level;
  @override
  WorkSuitabilityEntity? get workSuitability;
  @override
  @JsonKey(ignore: true)
  _$$LevelWorkSuitabilityEntityImplCopyWith<_$LevelWorkSuitabilityEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
