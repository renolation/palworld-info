// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_skill_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PartnerSkillEntity _$PartnerSkillEntityFromJson(Map<String, dynamic> json) {
  return _PartnerSkillEntity.fromJson(json);
}

/// @nodoc
mixin _$PartnerSkillEntity {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  PartnerEntity? get partner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerSkillEntityCopyWith<PartnerSkillEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerSkillEntityCopyWith<$Res> {
  factory $PartnerSkillEntityCopyWith(
          PartnerSkillEntity value, $Res Function(PartnerSkillEntity) then) =
      _$PartnerSkillEntityCopyWithImpl<$Res, PartnerSkillEntity>;
  @useResult
  $Res call(
      {int id, String? name, String? description, PartnerEntity? partner});

  $PartnerEntityCopyWith<$Res>? get partner;
}

/// @nodoc
class _$PartnerSkillEntityCopyWithImpl<$Res, $Val extends PartnerSkillEntity>
    implements $PartnerSkillEntityCopyWith<$Res> {
  _$PartnerSkillEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? partner = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      partner: freezed == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as PartnerEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PartnerEntityCopyWith<$Res>? get partner {
    if (_value.partner == null) {
      return null;
    }

    return $PartnerEntityCopyWith<$Res>(_value.partner!, (value) {
      return _then(_value.copyWith(partner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PartnerSkillEntityImplCopyWith<$Res>
    implements $PartnerSkillEntityCopyWith<$Res> {
  factory _$$PartnerSkillEntityImplCopyWith(_$PartnerSkillEntityImpl value,
          $Res Function(_$PartnerSkillEntityImpl) then) =
      __$$PartnerSkillEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String? name, String? description, PartnerEntity? partner});

  @override
  $PartnerEntityCopyWith<$Res>? get partner;
}

/// @nodoc
class __$$PartnerSkillEntityImplCopyWithImpl<$Res>
    extends _$PartnerSkillEntityCopyWithImpl<$Res, _$PartnerSkillEntityImpl>
    implements _$$PartnerSkillEntityImplCopyWith<$Res> {
  __$$PartnerSkillEntityImplCopyWithImpl(_$PartnerSkillEntityImpl _value,
      $Res Function(_$PartnerSkillEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? partner = freezed,
  }) {
    return _then(_$PartnerSkillEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      partner: freezed == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as PartnerEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartnerSkillEntityImpl implements _PartnerSkillEntity {
  const _$PartnerSkillEntityImpl(
      {required this.id, this.name, this.description, this.partner});

  factory _$PartnerSkillEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartnerSkillEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final PartnerEntity? partner;

  @override
  String toString() {
    return 'PartnerSkillEntity(id: $id, name: $name, description: $description, partner: $partner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartnerSkillEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.partner, partner) || other.partner == partner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, partner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartnerSkillEntityImplCopyWith<_$PartnerSkillEntityImpl> get copyWith =>
      __$$PartnerSkillEntityImplCopyWithImpl<_$PartnerSkillEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartnerSkillEntityImplToJson(
      this,
    );
  }
}

abstract class _PartnerSkillEntity implements PartnerSkillEntity {
  const factory _PartnerSkillEntity(
      {required final int id,
      final String? name,
      final String? description,
      final PartnerEntity? partner}) = _$PartnerSkillEntityImpl;

  factory _PartnerSkillEntity.fromJson(Map<String, dynamic> json) =
      _$PartnerSkillEntityImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  PartnerEntity? get partner;
  @override
  @JsonKey(ignore: true)
  _$$PartnerSkillEntityImplCopyWith<_$PartnerSkillEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PartnerEntity _$PartnerEntityFromJson(Map<String, dynamic> json) {
  return _PartnerEntity.fromJson(json);
}

/// @nodoc
mixin _$PartnerEntity {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerEntityCopyWith<PartnerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerEntityCopyWith<$Res> {
  factory $PartnerEntityCopyWith(
          PartnerEntity value, $Res Function(PartnerEntity) then) =
      _$PartnerEntityCopyWithImpl<$Res, PartnerEntity>;
  @useResult
  $Res call({int id, String? name, String? iconUrl});
}

/// @nodoc
class _$PartnerEntityCopyWithImpl<$Res, $Val extends PartnerEntity>
    implements $PartnerEntityCopyWith<$Res> {
  _$PartnerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? iconUrl = freezed,
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
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartnerEntityImplCopyWith<$Res>
    implements $PartnerEntityCopyWith<$Res> {
  factory _$$PartnerEntityImplCopyWith(
          _$PartnerEntityImpl value, $Res Function(_$PartnerEntityImpl) then) =
      __$$PartnerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name, String? iconUrl});
}

/// @nodoc
class __$$PartnerEntityImplCopyWithImpl<$Res>
    extends _$PartnerEntityCopyWithImpl<$Res, _$PartnerEntityImpl>
    implements _$$PartnerEntityImplCopyWith<$Res> {
  __$$PartnerEntityImplCopyWithImpl(
      _$PartnerEntityImpl _value, $Res Function(_$PartnerEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_$PartnerEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartnerEntityImpl implements _PartnerEntity {
  const _$PartnerEntityImpl({required this.id, this.name, this.iconUrl});

  factory _$PartnerEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartnerEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? iconUrl;

  @override
  String toString() {
    return 'PartnerEntity(id: $id, name: $name, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartnerEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartnerEntityImplCopyWith<_$PartnerEntityImpl> get copyWith =>
      __$$PartnerEntityImplCopyWithImpl<_$PartnerEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartnerEntityImplToJson(
      this,
    );
  }
}

abstract class _PartnerEntity implements PartnerEntity {
  const factory _PartnerEntity(
      {required final int id,
      final String? name,
      final String? iconUrl}) = _$PartnerEntityImpl;

  factory _PartnerEntity.fromJson(Map<String, dynamic> json) =
      _$PartnerEntityImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$PartnerEntityImplCopyWith<_$PartnerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
