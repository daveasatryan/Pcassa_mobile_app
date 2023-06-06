// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balanse_casa_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BalanseCasaModel _$BalanseCasaModelFromJson(Map<String, dynamic> json) {
  return _BalanseCasaModel.fromJson(json);
}

/// @nodoc
mixin _$BalanseCasaModel {
  int get sale => throw _privateConstructorUsedError;
  Inkas_model get inkass => throw _privateConstructorUsedError;
  Vnes_model get vnes => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanseCasaModelCopyWith<BalanseCasaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanseCasaModelCopyWith<$Res> {
  factory $BalanseCasaModelCopyWith(
          BalanseCasaModel value, $Res Function(BalanseCasaModel) then) =
      _$BalanseCasaModelCopyWithImpl<$Res, BalanseCasaModel>;
  @useResult
  $Res call({int sale, Inkas_model inkass, Vnes_model vnes, int amount});

  $Inkas_modelCopyWith<$Res> get inkass;
  $Vnes_modelCopyWith<$Res> get vnes;
}

/// @nodoc
class _$BalanseCasaModelCopyWithImpl<$Res, $Val extends BalanseCasaModel>
    implements $BalanseCasaModelCopyWith<$Res> {
  _$BalanseCasaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sale = null,
    Object? inkass = null,
    Object? vnes = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      sale: null == sale
          ? _value.sale
          : sale // ignore: cast_nullable_to_non_nullable
              as int,
      inkass: null == inkass
          ? _value.inkass
          : inkass // ignore: cast_nullable_to_non_nullable
              as Inkas_model,
      vnes: null == vnes
          ? _value.vnes
          : vnes // ignore: cast_nullable_to_non_nullable
              as Vnes_model,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $Inkas_modelCopyWith<$Res> get inkass {
    return $Inkas_modelCopyWith<$Res>(_value.inkass, (value) {
      return _then(_value.copyWith(inkass: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $Vnes_modelCopyWith<$Res> get vnes {
    return $Vnes_modelCopyWith<$Res>(_value.vnes, (value) {
      return _then(_value.copyWith(vnes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BalanseCasaModelCopyWith<$Res>
    implements $BalanseCasaModelCopyWith<$Res> {
  factory _$$_BalanseCasaModelCopyWith(
          _$_BalanseCasaModel value, $Res Function(_$_BalanseCasaModel) then) =
      __$$_BalanseCasaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sale, Inkas_model inkass, Vnes_model vnes, int amount});

  @override
  $Inkas_modelCopyWith<$Res> get inkass;
  @override
  $Vnes_modelCopyWith<$Res> get vnes;
}

/// @nodoc
class __$$_BalanseCasaModelCopyWithImpl<$Res>
    extends _$BalanseCasaModelCopyWithImpl<$Res, _$_BalanseCasaModel>
    implements _$$_BalanseCasaModelCopyWith<$Res> {
  __$$_BalanseCasaModelCopyWithImpl(
      _$_BalanseCasaModel _value, $Res Function(_$_BalanseCasaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sale = null,
    Object? inkass = null,
    Object? vnes = null,
    Object? amount = null,
  }) {
    return _then(_$_BalanseCasaModel(
      sale: null == sale
          ? _value.sale
          : sale // ignore: cast_nullable_to_non_nullable
              as int,
      inkass: null == inkass
          ? _value.inkass
          : inkass // ignore: cast_nullable_to_non_nullable
              as Inkas_model,
      vnes: null == vnes
          ? _value.vnes
          : vnes // ignore: cast_nullable_to_non_nullable
              as Vnes_model,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BalanseCasaModel extends _BalanseCasaModel {
  _$_BalanseCasaModel(
      {required this.sale,
      required this.inkass,
      required this.vnes,
      required this.amount})
      : super._();

  factory _$_BalanseCasaModel.fromJson(Map<String, dynamic> json) =>
      _$$_BalanseCasaModelFromJson(json);

  @override
  final int sale;
  @override
  final Inkas_model inkass;
  @override
  final Vnes_model vnes;
  @override
  final int amount;

  @override
  String toString() {
    return 'BalanseCasaModel(sale: $sale, inkass: $inkass, vnes: $vnes, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BalanseCasaModel &&
            (identical(other.sale, sale) || other.sale == sale) &&
            (identical(other.inkass, inkass) || other.inkass == inkass) &&
            (identical(other.vnes, vnes) || other.vnes == vnes) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sale, inkass, vnes, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BalanseCasaModelCopyWith<_$_BalanseCasaModel> get copyWith =>
      __$$_BalanseCasaModelCopyWithImpl<_$_BalanseCasaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BalanseCasaModelToJson(
      this,
    );
  }
}

abstract class _BalanseCasaModel extends BalanseCasaModel {
  factory _BalanseCasaModel(
      {required final int sale,
      required final Inkas_model inkass,
      required final Vnes_model vnes,
      required final int amount}) = _$_BalanseCasaModel;
  _BalanseCasaModel._() : super._();

  factory _BalanseCasaModel.fromJson(Map<String, dynamic> json) =
      _$_BalanseCasaModel.fromJson;

  @override
  int get sale;
  @override
  Inkas_model get inkass;
  @override
  Vnes_model get vnes;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$_BalanseCasaModelCopyWith<_$_BalanseCasaModel> get copyWith =>
      throw _privateConstructorUsedError;
}
