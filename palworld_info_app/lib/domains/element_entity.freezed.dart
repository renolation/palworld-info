// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ElementEntity _$ElementEntityFromJson(Map<String, dynamic> json) {
  return _ElementEntity.fromJson(json);
}

/// @nodoc
mixin _$ElementEntity {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElementEntityCopyWith<ElementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementEntityCopyWith<$Res> {
  factory $ElementEntityCopyWith(
          ElementEntity value, $Res Function(ElementEntity) then) =
      _$ElementEntityCopyWithImpl<$Res, ElementEntity>;
  @useResult
  $Res call({int id, String? name, String? iconUrl});
}

/// @nodoc
class _$ElementEntityCopyWithImpl<$Res, $Val extends ElementEntity>
    implements $ElementEntityCopyWith<$Res> {
  _$ElementEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$ElementEntityImplCopyWith<$Res>
    implements $ElementEntityCopyWith<$Res> {
  factory _$$ElementEntityImplCopyWith(
          _$ElementEntityImpl value, $Res Function(_$ElementEntityImpl) then) =
      __$$ElementEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name, String? iconUrl});
}

/// @nodoc
class __$$ElementEntityImplCopyWithImpl<$Res>
    extends _$ElementEntityCopyWithImpl<$Res, _$ElementEntityImpl>
    implements _$$ElementEntityImplCopyWith<$Res> {
  __$$ElementEntityImplCopyWithImpl(
      _$ElementEntityImpl _value, $Res Function(_$ElementEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_$ElementEntityImpl(
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
class _$ElementEntityImpl implements _ElementEntity {
  const _$ElementEntityImpl(
      {required this.id, this.name = '', this.iconUrl = ''});

  factory _$ElementEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElementEntityImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? iconUrl;

  @override
  String toString() {
    return 'ElementEntity(id: $id, name: $name, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementEntityImpl &&
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
  _$$ElementEntityImplCopyWith<_$ElementEntityImpl> get copyWith =>
      __$$ElementEntityImplCopyWithImpl<_$ElementEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElementEntityImplToJson(
      this,
    );
  }
}

abstract class _ElementEntity implements ElementEntity {
  const factory _ElementEntity(
      {required final int id,
      final String? name,
      final String? iconUrl}) = _$ElementEntityImpl;

  factory _ElementEntity.fromJson(Map<String, dynamic> json) =
      _$ElementEntityImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$ElementEntityImplCopyWith<_$ElementEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
