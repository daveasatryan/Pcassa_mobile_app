// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'close_payment_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClosePaymentItemsModel _$ClosePaymentItemsModelFromJson(
    Map<String, dynamic> json) {
  return _ClosePaymentItemsModel.fromJson(json);
}

/// @nodoc
mixin _$ClosePaymentItemsModel {
  int? get id => throw _privateConstructorUsedError;
  String? get productcode => throw _privateConstructorUsedError;
  String? get productname => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  int? get saleprice => throw _privateConstructorUsedError;
  int? get realprice => throw _privateConstructorUsedError;
  int? get flag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosePaymentItemsModelCopyWith<ClosePaymentItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosePaymentItemsModelCopyWith<$Res> {
  factory $ClosePaymentItemsModelCopyWith(ClosePaymentItemsModel value,
          $Res Function(ClosePaymentItemsModel) then) =
      _$ClosePaymentItemsModelCopyWithImpl<$Res, ClosePaymentItemsModel>;
  @useResult
  $Res call(
      {int? id,
      String? productcode,
      String? productname,
      int? quantity,
      int? saleprice,
      int? realprice,
      int? flag});
}

/// @nodoc
class _$ClosePaymentItemsModelCopyWithImpl<$Res,
        $Val extends ClosePaymentItemsModel>
    implements $ClosePaymentItemsModelCopyWith<$Res> {
  _$ClosePaymentItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productcode = freezed,
    Object? productname = freezed,
    Object? quantity = freezed,
    Object? saleprice = freezed,
    Object? realprice = freezed,
    Object? flag = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productcode: freezed == productcode
          ? _value.productcode
          : productcode // ignore: cast_nullable_to_non_nullable
              as String?,
      productname: freezed == productname
          ? _value.productname
          : productname // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      saleprice: freezed == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int?,
      realprice: freezed == realprice
          ? _value.realprice
          : realprice // ignore: cast_nullable_to_non_nullable
              as int?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClosePaymentItemsModelCopyWith<$Res>
    implements $ClosePaymentItemsModelCopyWith<$Res> {
  factory _$$_ClosePaymentItemsModelCopyWith(_$_ClosePaymentItemsModel value,
          $Res Function(_$_ClosePaymentItemsModel) then) =
      __$$_ClosePaymentItemsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? productcode,
      String? productname,
      int? quantity,
      int? saleprice,
      int? realprice,
      int? flag});
}

/// @nodoc
class __$$_ClosePaymentItemsModelCopyWithImpl<$Res>
    extends _$ClosePaymentItemsModelCopyWithImpl<$Res,
        _$_ClosePaymentItemsModel>
    implements _$$_ClosePaymentItemsModelCopyWith<$Res> {
  __$$_ClosePaymentItemsModelCopyWithImpl(_$_ClosePaymentItemsModel _value,
      $Res Function(_$_ClosePaymentItemsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productcode = freezed,
    Object? productname = freezed,
    Object? quantity = freezed,
    Object? saleprice = freezed,
    Object? realprice = freezed,
    Object? flag = freezed,
  }) {
    return _then(_$_ClosePaymentItemsModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productcode: freezed == productcode
          ? _value.productcode
          : productcode // ignore: cast_nullable_to_non_nullable
              as String?,
      productname: freezed == productname
          ? _value.productname
          : productname // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      saleprice: freezed == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int?,
      realprice: freezed == realprice
          ? _value.realprice
          : realprice // ignore: cast_nullable_to_non_nullable
              as int?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClosePaymentItemsModel extends _ClosePaymentItemsModel {
  _$_ClosePaymentItemsModel(
      {this.id,
      this.productcode,
      this.productname,
      this.quantity,
      this.saleprice,
      this.realprice,
      this.flag})
      : super._();

  factory _$_ClosePaymentItemsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClosePaymentItemsModelFromJson(json);

  @override
  final int? id;
  @override
  final String? productcode;
  @override
  final String? productname;
  @override
  final int? quantity;
  @override
  final int? saleprice;
  @override
  final int? realprice;
  @override
  final int? flag;

  @override
  String toString() {
    return 'ClosePaymentItemsModel(id: $id, productcode: $productcode, productname: $productname, quantity: $quantity, saleprice: $saleprice, realprice: $realprice, flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClosePaymentItemsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productcode, productcode) ||
                other.productcode == productcode) &&
            (identical(other.productname, productname) ||
                other.productname == productname) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.saleprice, saleprice) ||
                other.saleprice == saleprice) &&
            (identical(other.realprice, realprice) ||
                other.realprice == realprice) &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, productcode, productname,
      quantity, saleprice, realprice, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClosePaymentItemsModelCopyWith<_$_ClosePaymentItemsModel> get copyWith =>
      __$$_ClosePaymentItemsModelCopyWithImpl<_$_ClosePaymentItemsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClosePaymentItemsModelToJson(
      this,
    );
  }
}

abstract class _ClosePaymentItemsModel extends ClosePaymentItemsModel {
  factory _ClosePaymentItemsModel(
      {final int? id,
      final String? productcode,
      final String? productname,
      final int? quantity,
      final int? saleprice,
      final int? realprice,
      final int? flag}) = _$_ClosePaymentItemsModel;
  _ClosePaymentItemsModel._() : super._();

  factory _ClosePaymentItemsModel.fromJson(Map<String, dynamic> json) =
      _$_ClosePaymentItemsModel.fromJson;

  @override
  int? get id;
  @override
  String? get productcode;
  @override
  String? get productname;
  @override
  int? get quantity;
  @override
  int? get saleprice;
  @override
  int? get realprice;
  @override
  int? get flag;
  @override
  @JsonKey(ignore: true)
  _$$_ClosePaymentItemsModelCopyWith<_$_ClosePaymentItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
