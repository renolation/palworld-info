// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'p_skill_pal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PSkillPalEntity _$PSkillPalEntityFromJson(Map<String, dynamic> json) {
  return _PSkillPalEntity.fromJson(json);
}

/// @nodoc
mixin _$PSkillPalEntity {
  int? get id => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  PassiveSkill? get passiveSkill => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PSkillPalEntityCopyWith<PSkillPalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PSkillPalEntityCopyWith<$Res> {
  factory $PSkillPalEntityCopyWith(
          PSkillPalEntity value, $Res Function(PSkillPalEntity) then) =
      _$PSkillPalEntityCopyWithImpl<$Res, PSkillPalEntity>;
  @useResult
  $Res call({int? id, int? rank, PassiveSkill? passiveSkill});

  $PassiveSkillCopyWith<$Res>? get passiveSkill;
}

/// @nodoc
class _$PSkillPalEntityCopyWithImpl<$Res, $Val extends PSkillPalEntity>
    implements $PSkillPalEntityCopyWith<$Res> {
  _$PSkillPalEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rank = freezed,
    Object? passiveSkill = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      passiveSkill: freezed == passiveSkill
          ? _value.passiveSkill
          : passiveSkill // ignore: cast_nullable_to_non_nullable
              as PassiveSkill?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PassiveSkillCopyWith<$Res>? get passiveSkill {
    if (_value.passiveSkill == null) {
      return null;
    }

    return $PassiveSkillCopyWith<$Res>(_value.passiveSkill!, (value) {
      return _then(_value.copyWith(passiveSkill: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PSkillPalEntityImplCopyWith<$Res>
    implements $PSkillPalEntityCopyWith<$Res> {
  factory _$$PSkillPalEntityImplCopyWith(_$PSkillPalEntityImpl value,
          $Res Function(_$PSkillPalEntityImpl) then) =
      __$$PSkillPalEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? rank, PassiveSkill? passiveSkill});

  @override
  $PassiveSkillCopyWith<$Res>? get passiveSkill;
}

/// @nodoc
class __$$PSkillPalEntityImplCopyWithImpl<$Res>
    extends _$PSkillPalEntityCopyWithImpl<$Res, _$PSkillPalEntityImpl>
    implements _$$PSkillPalEntityImplCopyWith<$Res> {
  __$$PSkillPalEntityImplCopyWithImpl(
      _$PSkillPalEntityImpl _value, $Res Function(_$PSkillPalEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rank = freezed,
    Object? passiveSkill = freezed,
  }) {
    return _then(_$PSkillPalEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      passiveSkill: freezed == passiveSkill
          ? _value.passiveSkill
          : passiveSkill // ignore: cast_nullable_to_non_nullable
              as PassiveSkill?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PSkillPalEntityImpl implements _PSkillPalEntity {
  const _$PSkillPalEntityImpl({this.id, this.rank, this.passiveSkill});

  factory _$PSkillPalEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PSkillPalEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final int? rank;
  @override
  final PassiveSkill? passiveSkill;

  @override
  String toString() {
    return 'PSkillPalEntity(id: $id, rank: $rank, passiveSkill: $passiveSkill)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PSkillPalEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.passiveSkill, passiveSkill) ||
                other.passiveSkill == passiveSkill));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, rank, passiveSkill);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PSkillPalEntityImplCopyWith<_$PSkillPalEntityImpl> get copyWith =>
      __$$PSkillPalEntityImplCopyWithImpl<_$PSkillPalEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PSkillPalEntityImplToJson(
      this,
    );
  }
}

abstract class _PSkillPalEntity implements PSkillPalEntity {
  const factory _PSkillPalEntity(
      {final int? id,
      final int? rank,
      final PassiveSkill? passiveSkill}) = _$PSkillPalEntityImpl;

  factory _PSkillPalEntity.fromJson(Map<String, dynamic> json) =
      _$PSkillPalEntityImpl.fromJson;

  @override
  int? get id;
  @override
  int? get rank;
  @override
  PassiveSkill? get passiveSkill;
  @override
  @JsonKey(ignore: true)
  _$$PSkillPalEntityImplCopyWith<_$PSkillPalEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PassiveSkill _$PassiveSkillFromJson(Map<String, dynamic> json) {
  return _PassiveSkill.fromJson(json);
}

/// @nodoc
mixin _$PassiveSkill {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<PassiveDesc>? get passiveDesc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassiveSkillCopyWith<PassiveSkill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassiveSkillCopyWith<$Res> {
  factory $PassiveSkillCopyWith(
          PassiveSkill value, $Res Function(PassiveSkill) then) =
      _$PassiveSkillCopyWithImpl<$Res, PassiveSkill>;
  @useResult
  $Res call({int? id, String? name, List<PassiveDesc>? passiveDesc});
}

/// @nodoc
class _$PassiveSkillCopyWithImpl<$Res, $Val extends PassiveSkill>
    implements $PassiveSkillCopyWith<$Res> {
  _$PassiveSkillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? passiveDesc = freezed,
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
      passiveDesc: freezed == passiveDesc
          ? _value.passiveDesc
          : passiveDesc // ignore: cast_nullable_to_non_nullable
              as List<PassiveDesc>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PassiveSkillImplCopyWith<$Res>
    implements $PassiveSkillCopyWith<$Res> {
  factory _$$PassiveSkillImplCopyWith(
          _$PassiveSkillImpl value, $Res Function(_$PassiveSkillImpl) then) =
      __$$PassiveSkillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, List<PassiveDesc>? passiveDesc});
}

/// @nodoc
class __$$PassiveSkillImplCopyWithImpl<$Res>
    extends _$PassiveSkillCopyWithImpl<$Res, _$PassiveSkillImpl>
    implements _$$PassiveSkillImplCopyWith<$Res> {
  __$$PassiveSkillImplCopyWithImpl(
      _$PassiveSkillImpl _value, $Res Function(_$PassiveSkillImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? passiveDesc = freezed,
  }) {
    return _then(_$PassiveSkillImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      passiveDesc: freezed == passiveDesc
          ? _value._passiveDesc
          : passiveDesc // ignore: cast_nullable_to_non_nullable
              as List<PassiveDesc>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassiveSkillImpl implements _PassiveSkill {
  const _$PassiveSkillImpl(
      {this.id, this.name, final List<PassiveDesc>? passiveDesc})
      : _passiveDesc = passiveDesc;

  factory _$PassiveSkillImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassiveSkillImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  final List<PassiveDesc>? _passiveDesc;
  @override
  List<PassiveDesc>? get passiveDesc {
    final value = _passiveDesc;
    if (value == null) return null;
    if (_passiveDesc is EqualUnmodifiableListView) return _passiveDesc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PassiveSkill(id: $id, name: $name, passiveDesc: $passiveDesc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassiveSkillImpl &&
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
  _$$PassiveSkillImplCopyWith<_$PassiveSkillImpl> get copyWith =>
      __$$PassiveSkillImplCopyWithImpl<_$PassiveSkillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassiveSkillImplToJson(
      this,
    );
  }
}

abstract class _PassiveSkill implements PassiveSkill {
  const factory _PassiveSkill(
      {final int? id,
      final String? name,
      final List<PassiveDesc>? passiveDesc}) = _$PassiveSkillImpl;

  factory _PassiveSkill.fromJson(Map<String, dynamic> json) =
      _$PassiveSkillImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  List<PassiveDesc>? get passiveDesc;
  @override
  @JsonKey(ignore: true)
  _$$PassiveSkillImplCopyWith<_$PassiveSkillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PassiveDesc _$PassiveDescFromJson(Map<String, dynamic> json) {
  return _PassiveDesc.fromJson(json);
}

/// @nodoc
mixin _$PassiveDesc {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get isPositive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassiveDescCopyWith<PassiveDesc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassiveDescCopyWith<$Res> {
  factory $PassiveDescCopyWith(
          PassiveDesc value, $Res Function(PassiveDesc) then) =
      _$PassiveDescCopyWithImpl<$Res, PassiveDesc>;
  @useResult
  $Res call({int? id, String? name, bool? isPositive});
}

/// @nodoc
class _$PassiveDescCopyWithImpl<$Res, $Val extends PassiveDesc>
    implements $PassiveDescCopyWith<$Res> {
  _$PassiveDescCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isPositive = freezed,
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
      isPositive: freezed == isPositive
          ? _value.isPositive
          : isPositive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PassiveDescImplCopyWith<$Res>
    implements $PassiveDescCopyWith<$Res> {
  factory _$$PassiveDescImplCopyWith(
          _$PassiveDescImpl value, $Res Function(_$PassiveDescImpl) then) =
      __$$PassiveDescImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, bool? isPositive});
}

/// @nodoc
class __$$PassiveDescImplCopyWithImpl<$Res>
    extends _$PassiveDescCopyWithImpl<$Res, _$PassiveDescImpl>
    implements _$$PassiveDescImplCopyWith<$Res> {
  __$$PassiveDescImplCopyWithImpl(
      _$PassiveDescImpl _value, $Res Function(_$PassiveDescImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isPositive = freezed,
  }) {
    return _then(_$PassiveDescImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$PassiveDescImpl implements _PassiveDesc {
  const _$PassiveDescImpl({this.id, this.name, this.isPositive});

  factory _$PassiveDescImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassiveDescImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final bool? isPositive;

  @override
  String toString() {
    return 'PassiveDesc(id: $id, name: $name, isPositive: $isPositive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassiveDescImpl &&
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
  _$$PassiveDescImplCopyWith<_$PassiveDescImpl> get copyWith =>
      __$$PassiveDescImplCopyWithImpl<_$PassiveDescImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassiveDescImplToJson(
      this,
    );
  }
}

abstract class _PassiveDesc implements PassiveDesc {
  const factory _PassiveDesc(
      {final int? id,
      final String? name,
      final bool? isPositive}) = _$PassiveDescImpl;

  factory _PassiveDesc.fromJson(Map<String, dynamic> json) =
      _$PassiveDescImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  bool? get isPositive;
  @override
  @JsonKey(ignore: true)
  _$$PassiveDescImplCopyWith<_$PassiveDescImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
