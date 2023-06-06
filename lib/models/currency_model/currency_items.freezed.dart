// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyItemsModel _$CurrencyItemsModelFromJson(Map<String, dynamic> json) {
  return _CurrencyItemsModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyItemsModel {
  int get cod => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get b_valyuta => throw _privateConstructorUsedError;
  String? get linkfoto => throw _privateConstructorUsedError;
  int get tip => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyItemsModelCopyWith<CurrencyItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyItemsModelCopyWith<$Res> {
  factory $CurrencyItemsModelCopyWith(
          CurrencyItemsModel value, $Res Function(CurrencyItemsModel) then) =
      _$CurrencyItemsModelCopyWithImpl<$Res, CurrencyItemsModel>;
  @useResult
  $Res call({int cod, String name, bool b_valyuta, String? linkfoto, int tip});
}

/// @nodoc
class _$CurrencyItemsModelCopyWithImpl<$Res, $Val extends CurrencyItemsModel>
    implements $CurrencyItemsModelCopyWith<$Res> {
  _$CurrencyItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? name = null,
    Object? b_valyuta = null,
    Object? linkfoto = freezed,
    Object? tip = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      b_valyuta: null == b_valyuta
          ? _value.b_valyuta
          : b_valyuta // ignore: cast_nullable_to_non_nullable
              as bool,
      linkfoto: freezed == linkfoto
          ? _value.linkfoto
          : linkfoto // ignore: cast_nullable_to_non_nullable
              as String?,
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyItemsModelCopyWith<$Res>
    implements $CurrencyItemsModelCopyWith<$Res> {
  factory _$$_CurrencyItemsModelCopyWith(_$_CurrencyItemsModel value,
          $Res Function(_$_CurrencyItemsModel) then) =
      __$$_CurrencyItemsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String name, bool b_valyuta, String? linkfoto, int tip});
}

/// @nodoc
class __$$_CurrencyItemsModelCopyWithImpl<$Res>
    extends _$CurrencyItemsModelCopyWithImpl<$Res, _$_CurrencyItemsModel>
    implements _$$_CurrencyItemsModelCopyWith<$Res> {
  __$$_CurrencyItemsModelCopyWithImpl(
      _$_CurrencyItemsModel _value, $Res Function(_$_CurrencyItemsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? name = null,
    Object? b_valyuta = null,
    Object? linkfoto = freezed,
    Object? tip = null,
  }) {
    return _then(_$_CurrencyItemsModel(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      b_valyuta: null == b_valyuta
          ? _value.b_valyuta
          : b_valyuta // ignore: cast_nullable_to_non_nullable
              as bool,
      linkfoto: freezed == linkfoto
          ? _value.linkfoto
          : linkfoto // ignore: cast_nullable_to_non_nullable
              as String?,
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyItemsModel extends _CurrencyItemsModel {
  _$_CurrencyItemsModel(
      {required this.cod,
      required this.name,
      this.b_valyuta = false,
      this.linkfoto,
      this.tip = 0})
      : super._();

  factory _$_CurrencyItemsModel.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyItemsModelFromJson(json);

  @override
  final int cod;
  @override
  final String name;
  @override
  @JsonKey()
  final bool b_valyuta;
  @override
  final String? linkfoto;
  @override
  @JsonKey()
  final int tip;

  @override
  String toString() {
    return 'CurrencyItemsModel(cod: $cod, name: $name, b_valyuta: $b_valyuta, linkfoto: $linkfoto, tip: $tip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyItemsModel &&
            (identical(other.cod, cod) || other.cod == cod) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.b_valyuta, b_valyuta) ||
                other.b_valyuta == b_valyuta) &&
            (identical(other.linkfoto, linkfoto) ||
                other.linkfoto == linkfoto) &&
            (identical(other.tip, tip) || other.tip == tip));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cod, name, b_valyuta, linkfoto, tip);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyItemsModelCopyWith<_$_CurrencyItemsModel> get copyWith =>
      __$$_CurrencyItemsModelCopyWithImpl<_$_CurrencyItemsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyItemsModelToJson(
      this,
    );
  }
}

abstract class _CurrencyItemsModel extends CurrencyItemsModel {
  factory _CurrencyItemsModel(
      {required final int cod,
      required final String name,
      final bool b_valyuta,
      final String? linkfoto,
      final int tip}) = _$_CurrencyItemsModel;
  _CurrencyItemsModel._() : super._();

  factory _CurrencyItemsModel.fromJson(Map<String, dynamic> json) =
      _$_CurrencyItemsModel.fromJson;

  @override
  int get cod;
  @override
  String get name;
  @override
  bool get b_valyuta;
  @override
  String? get linkfoto;
  @override
  int get tip;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyItemsModelCopyWith<_$_CurrencyItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
