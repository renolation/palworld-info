// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pal_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PalItemEntity _$PalItemEntityFromJson(Map<String, dynamic> json) {
  return _PalItemEntity.fromJson(json);
}

/// @nodoc
mixin _$PalItemEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get itemCount => throw _privateConstructorUsedError;
  int? get chance => throw _privateConstructorUsedError;
  bool? get isBoss => throw _privateConstructorUsedError;
  PalEntity? get pal => throw _privateConstructorUsedError;
  ItemEntity? get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PalItemEntityCopyWith<PalItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PalItemEntityCopyWith<$Res> {
  factory $PalItemEntityCopyWith(
          PalItemEntity value, $Res Function(PalItemEntity) then) =
      _$PalItemEntityCopyWithImpl<$Res, PalItemEntity>;
  @useResult
  $Res call(
      {int? id,
      String? itemCount,
      int? chance,
      bool? isBoss,
      PalEntity? pal,
      ItemEntity? item});

  $PalEntityCopyWith<$Res>? get pal;
  $ItemEntityCopyWith<$Res>? get item;
}

/// @nodoc
class _$PalItemEntityCopyWithImpl<$Res, $Val extends PalItemEntity>
    implements $PalItemEntityCopyWith<$Res> {
  _$PalItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? itemCount = freezed,
    Object? chance = freezed,
    Object? isBoss = freezed,
    Object? pal = freezed,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      itemCount: freezed == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as String?,
      chance: freezed == chance
          ? _value.chance
          : chance // ignore: cast_nullable_to_non_nullable
              as int?,
      isBoss: freezed == isBoss
          ? _value.isBoss
          : isBoss // ignore: cast_nullable_to_non_nullable
              as bool?,
      pal: freezed == pal
          ? _value.pal
          : pal // ignore: cast_nullable_to_non_nullable
              as PalEntity?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PalEntityCopyWith<$Res>? get pal {
    if (_value.pal == null) {
      return null;
    }

    return $PalEntityCopyWith<$Res>(_value.pal!, (value) {
      return _then(_value.copyWith(pal: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemEntityCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemEntityCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PalItemEntityImplCopyWith<$Res>
    implements $PalItemEntityCopyWith<$Res> {
  factory _$$PalItemEntityImplCopyWith(
          _$PalItemEntityImpl value, $Res Function(_$PalItemEntityImpl) then) =
      __$$PalItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? itemCount,
      int? chance,
      bool? isBoss,
      PalEntity? pal,
      ItemEntity? item});

  @override
  $PalEntityCopyWith<$Res>? get pal;
  @override
  $ItemEntityCopyWith<$Res>? get item;
}

/// @nodoc
class __$$PalItemEntityImplCopyWithImpl<$Res>
    extends _$PalItemEntityCopyWithImpl<$Res, _$PalItemEntityImpl>
    implements _$$PalItemEntityImplCopyWith<$Res> {
  __$$PalItemEntityImplCopyWithImpl(
      _$PalItemEntityImpl _value, $Res Function(_$PalItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? itemCount = freezed,
    Object? chance = freezed,
    Object? isBoss = freezed,
    Object? pal = freezed,
    Object? item = freezed,
  }) {
    return _then(_$PalItemEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      itemCount: freezed == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as String?,
      chance: freezed == chance
          ? _value.chance
          : chance // ignore: cast_nullable_to_non_nullable
              as int?,
      isBoss: freezed == isBoss
          ? _value.isBoss
          : isBoss // ignore: cast_nullable_to_non_nullable
              as bool?,
      pal: freezed == pal
          ? _value.pal
          : pal // ignore: cast_nullable_to_non_nullable
              as PalEntity?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PalItemEntityImpl implements _PalItemEntity {
  const _$PalItemEntityImpl(
      {this.id, this.itemCount, this.chance, this.isBoss, this.pal, this.item});

  factory _$PalItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PalItemEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? itemCount;
  @override
  final int? chance;
  @override
  final bool? isBoss;
  @override
  final PalEntity? pal;
  @override
  final ItemEntity? item;

  @override
  String toString() {
    return 'PalItemEntity(id: $id, itemCount: $itemCount, chance: $chance, isBoss: $isBoss, pal: $pal, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.chance, chance) || other.chance == chance) &&
            (identical(other.isBoss, isBoss) || other.isBoss == isBoss) &&
            (identical(other.pal, pal) || other.pal == pal) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, itemCount, chance, isBoss, pal, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalItemEntityImplCopyWith<_$PalItemEntityImpl> get copyWith =>
      __$$PalItemEntityImplCopyWithImpl<_$PalItemEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PalItemEntityImplToJson(
      this,
    );
  }
}

abstract class _PalItemEntity implements PalItemEntity {
  const factory _PalItemEntity(
      {final int? id,
      final String? itemCount,
      final int? chance,
      final bool? isBoss,
      final PalEntity? pal,
      final ItemEntity? item}) = _$PalItemEntityImpl;

  factory _PalItemEntity.fromJson(Map<String, dynamic> json) =
      _$PalItemEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get itemCount;
  @override
  int? get chance;
  @override
  bool? get isBoss;
  @override
  PalEntity? get pal;
  @override
  ItemEntity? get item;
  @override
  @JsonKey(ignore: true)
  _$$PalItemEntityImplCopyWith<_$PalItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
