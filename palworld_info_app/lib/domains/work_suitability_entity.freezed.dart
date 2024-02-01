// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_suitability_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkSuitabilityEntity _$WorkSuitabilityEntityFromJson(
    Map<String, dynamic> json) {
  return _WorkSuitabilityEntity.fromJson(json);
}

/// @nodoc
mixin _$WorkSuitabilityEntity {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkSuitabilityEntityCopyWith<WorkSuitabilityEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkSuitabilityEntityCopyWith<$Res> {
  factory $WorkSuitabilityEntityCopyWith(WorkSuitabilityEntity value,
          $Res Function(WorkSuitabilityEntity) then) =
      _$WorkSuitabilityEntityCopyWithImpl<$Res, WorkSuitabilityEntity>;
  @useResult
  $Res call({int id, String? name, String? iconUrl});
}

/// @nodoc
class _$WorkSuitabilityEntityCopyWithImpl<$Res,
        $Val extends WorkSuitabilityEntity>
    implements $WorkSuitabilityEntityCopyWith<$Res> {
  _$WorkSuitabilityEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$WorkSuitabilityEntityImplCopyWith<$Res>
    implements $WorkSuitabilityEntityCopyWith<$Res> {
  factory _$$WorkSuitabilityEntityImplCopyWith(
          _$WorkSuitabilityEntityImpl value,
          $Res Function(_$WorkSuitabilityEntityImpl) then) =
      __$$WorkSuitabilityEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name, String? iconUrl});
}

/// @nodoc
class __$$WorkSuitabilityEntityImplCopyWithImpl<$Res>
    extends _$WorkSuitabilityEntityCopyWithImpl<$Res,
        _$WorkSuitabilityEntityImpl>
    implements _$$WorkSuitabilityEntityImplCopyWith<$Res> {
  __$$WorkSuitabilityEntityImplCopyWithImpl(_$WorkSuitabilityEntityImpl _value,
      $Res Function(_$WorkSuitabilityEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_$WorkSuitabilityEntityImpl(
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
class _$WorkSuitabilityEntityImpl implements _WorkSuitabilityEntity {
  const _$WorkSuitabilityEntityImpl(
      {required this.id, this.name = '', this.iconUrl = ''});

  factory _$WorkSuitabilityEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkSuitabilityEntityImplFromJson(json);

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
    return 'WorkSuitabilityEntity(id: $id, name: $name, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkSuitabilityEntityImpl &&
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
  _$$WorkSuitabilityEntityImplCopyWith<_$WorkSuitabilityEntityImpl>
      get copyWith => __$$WorkSuitabilityEntityImplCopyWithImpl<
          _$WorkSuitabilityEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkSuitabilityEntityImplToJson(
      this,
    );
  }
}

abstract class _WorkSuitabilityEntity implements WorkSuitabilityEntity {
  const factory _WorkSuitabilityEntity(
      {required final int id,
      final String? name,
      final String? iconUrl}) = _$WorkSuitabilityEntityImpl;

  factory _WorkSuitabilityEntity.fromJson(Map<String, dynamic> json) =
      _$WorkSuitabilityEntityImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$WorkSuitabilityEntityImplCopyWith<_$WorkSuitabilityEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
