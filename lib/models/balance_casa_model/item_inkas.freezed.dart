// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_inkas.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item_inkas _$Item_inkasFromJson(Map<String, dynamic> json) {
  return _Item_inkas.fromJson(json);
}

/// @nodoc
mixin _$Item_inkas {
  String? get description => throw _privateConstructorUsedError;
  String get data_d => throw _privateConstructorUsedError;
  int get summa => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Item_inkasCopyWith<Item_inkas> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Item_inkasCopyWith<$Res> {
  factory $Item_inkasCopyWith(
          Item_inkas value, $Res Function(Item_inkas) then) =
      _$Item_inkasCopyWithImpl<$Res, Item_inkas>;
  @useResult
  $Res call({String? description, String data_d, int summa});
}

/// @nodoc
class _$Item_inkasCopyWithImpl<$Res, $Val extends Item_inkas>
    implements $Item_inkasCopyWith<$Res> {
  _$Item_inkasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? data_d = null,
    Object? summa = null,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      data_d: null == data_d
          ? _value.data_d
          : data_d // ignore: cast_nullable_to_non_nullable
              as String,
      summa: null == summa
          ? _value.summa
          : summa // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Item_inkasCopyWith<$Res>
    implements $Item_inkasCopyWith<$Res> {
  factory _$$_Item_inkasCopyWith(
          _$_Item_inkas value, $Res Function(_$_Item_inkas) then) =
      __$$_Item_inkasCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? description, String data_d, int summa});
}

/// @nodoc
class __$$_Item_inkasCopyWithImpl<$Res>
    extends _$Item_inkasCopyWithImpl<$Res, _$_Item_inkas>
    implements _$$_Item_inkasCopyWith<$Res> {
  __$$_Item_inkasCopyWithImpl(
      _$_Item_inkas _value, $Res Function(_$_Item_inkas) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? data_d = null,
    Object? summa = null,
  }) {
    return _then(_$_Item_inkas(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      data_d: null == data_d
          ? _value.data_d
          : data_d // ignore: cast_nullable_to_non_nullable
              as String,
      summa: null == summa
          ? _value.summa
          : summa // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item_inkas extends _Item_inkas {
  _$_Item_inkas(
      {required this.description, required this.data_d, required this.summa})
      : super._();

  factory _$_Item_inkas.fromJson(Map<String, dynamic> json) =>
      _$$_Item_inkasFromJson(json);

  @override
  final String? description;
  @override
  final String data_d;
  @override
  final int summa;

  @override
  String toString() {
    return 'Item_inkas(description: $description, data_d: $data_d, summa: $summa)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item_inkas &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.data_d, data_d) || other.data_d == data_d) &&
            (identical(other.summa, summa) || other.summa == summa));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, data_d, summa);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Item_inkasCopyWith<_$_Item_inkas> get copyWith =>
      __$$_Item_inkasCopyWithImpl<_$_Item_inkas>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Item_inkasToJson(
      this,
    );
  }
}

abstract class _Item_inkas extends Item_inkas {
  factory _Item_inkas(
      {required final String? description,
      required final String data_d,
      required final int summa}) = _$_Item_inkas;
  _Item_inkas._() : super._();

  factory _Item_inkas.fromJson(Map<String, dynamic> json) =
      _$_Item_inkas.fromJson;

  @override
  String? get description;
  @override
  String get data_d;
  @override
  int get summa;
  @override
  @JsonKey(ignore: true)
  _$$_Item_inkasCopyWith<_$_Item_inkas> get copyWith =>
      throw _privateConstructorUsedError;
}
