// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breeding_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BreedingEntity _$BreedingEntityFromJson(Map<String, dynamic> json) {
  return _BreedingEntity.fromJson(json);
}

/// @nodoc
mixin _$BreedingEntity {
  int get id => throw _privateConstructorUsedError;
  String? get parent1 => throw _privateConstructorUsedError;
  String? get parent2 => throw _privateConstructorUsedError;
  String? get child => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreedingEntityCopyWith<BreedingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedingEntityCopyWith<$Res> {
  factory $BreedingEntityCopyWith(
          BreedingEntity value, $Res Function(BreedingEntity) then) =
      _$BreedingEntityCopyWithImpl<$Res, BreedingEntity>;
  @useResult
  $Res call({int id, String? parent1, String? parent2, String? child});
}

/// @nodoc
class _$BreedingEntityCopyWithImpl<$Res, $Val extends BreedingEntity>
    implements $BreedingEntityCopyWith<$Res> {
  _$BreedingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parent1 = freezed,
    Object? parent2 = freezed,
    Object? child = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parent1: freezed == parent1
          ? _value.parent1
          : parent1 // ignore: cast_nullable_to_non_nullable
              as String?,
      parent2: freezed == parent2
          ? _value.parent2
          : parent2 // ignore: cast_nullable_to_non_nullable
              as String?,
      child: freezed == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreedingEntityImplCopyWith<$Res>
    implements $BreedingEntityCopyWith<$Res> {
  factory _$$BreedingEntityImplCopyWith(_$BreedingEntityImpl value,
          $Res Function(_$BreedingEntityImpl) then) =
      __$$BreedingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? parent1, String? parent2, String? child});
}

/// @nodoc
class __$$BreedingEntityImplCopyWithImpl<$Res>
    extends _$BreedingEntityCopyWithImpl<$Res, _$BreedingEntityImpl>
    implements _$$BreedingEntityImplCopyWith<$Res> {
  __$$BreedingEntityImplCopyWithImpl(
      _$BreedingEntityImpl _value, $Res Function(_$BreedingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parent1 = freezed,
    Object? parent2 = freezed,
    Object? child = freezed,
  }) {
    return _then(_$BreedingEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parent1: freezed == parent1
          ? _value.parent1
          : parent1 // ignore: cast_nullable_to_non_nullable
              as String?,
      parent2: freezed == parent2
          ? _value.parent2
          : parent2 // ignore: cast_nullable_to_non_nullable
              as String?,
      child: freezed == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BreedingEntityImpl implements _BreedingEntity {
  const _$BreedingEntityImpl(
      {required this.id,
      this.parent1 = '',
      this.parent2 = '',
      this.child = ''});

  factory _$BreedingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedingEntityImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String? parent1;
  @override
  @JsonKey()
  final String? parent2;
  @override
  @JsonKey()
  final String? child;

  @override
  String toString() {
    return 'BreedingEntity(id: $id, parent1: $parent1, parent2: $parent2, child: $child)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedingEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent1, parent1) || other.parent1 == parent1) &&
            (identical(other.parent2, parent2) || other.parent2 == parent2) &&
            (identical(other.child, child) || other.child == child));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, parent1, parent2, child);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedingEntityImplCopyWith<_$BreedingEntityImpl> get copyWith =>
      __$$BreedingEntityImplCopyWithImpl<_$BreedingEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedingEntityImplToJson(
      this,
    );
  }
}

abstract class _BreedingEntity implements BreedingEntity {
  const factory _BreedingEntity(
      {required final int id,
      final String? parent1,
      final String? parent2,
      final String? child}) = _$BreedingEntityImpl;

  factory _BreedingEntity.fromJson(Map<String, dynamic> json) =
      _$BreedingEntityImpl.fromJson;

  @override
  int get id;
  @override
  String? get parent1;
  @override
  String? get parent2;
  @override
  String? get child;
  @override
  @JsonKey(ignore: true)
  _$$BreedingEntityImplCopyWith<_$BreedingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
