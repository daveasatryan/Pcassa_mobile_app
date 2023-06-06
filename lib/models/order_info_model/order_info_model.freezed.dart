// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderInfoModel _$OrderInfoModelFromJson(Map<String, dynamic> json) {
  return _OrderInfoModel.fromJson(json);
}

/// @nodoc
mixin _$OrderInfoModel {
  int get cashid => throw _privateConstructorUsedError;
  String get orderid => throw _privateConstructorUsedError;
  String? get waiter_name => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  int get saleprice => throw _privateConstructorUsedError;
  int? get paidamount => throw _privateConstructorUsedError;
  int? get paidamountcard => throw _privateConstructorUsedError;
  int? get deptamount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderInfoModelCopyWith<OrderInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderInfoModelCopyWith<$Res> {
  factory $OrderInfoModelCopyWith(
          OrderInfoModel value, $Res Function(OrderInfoModel) then) =
      _$OrderInfoModelCopyWithImpl<$Res, OrderInfoModel>;
  @useResult
  $Res call(
      {int cashid,
      String orderid,
      String? waiter_name,
      DateTime? created_at,
      int saleprice,
      int? paidamount,
      int? paidamountcard,
      int? deptamount});
}

/// @nodoc
class _$OrderInfoModelCopyWithImpl<$Res, $Val extends OrderInfoModel>
    implements $OrderInfoModelCopyWith<$Res> {
  _$OrderInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashid = null,
    Object? orderid = null,
    Object? waiter_name = freezed,
    Object? created_at = freezed,
    Object? saleprice = null,
    Object? paidamount = freezed,
    Object? paidamountcard = freezed,
    Object? deptamount = freezed,
  }) {
    return _then(_value.copyWith(
      cashid: null == cashid
          ? _value.cashid
          : cashid // ignore: cast_nullable_to_non_nullable
              as int,
      orderid: null == orderid
          ? _value.orderid
          : orderid // ignore: cast_nullable_to_non_nullable
              as String,
      waiter_name: freezed == waiter_name
          ? _value.waiter_name
          : waiter_name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleprice: null == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int,
      paidamount: freezed == paidamount
          ? _value.paidamount
          : paidamount // ignore: cast_nullable_to_non_nullable
              as int?,
      paidamountcard: freezed == paidamountcard
          ? _value.paidamountcard
          : paidamountcard // ignore: cast_nullable_to_non_nullable
              as int?,
      deptamount: freezed == deptamount
          ? _value.deptamount
          : deptamount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderInfoModelCopyWith<$Res>
    implements $OrderInfoModelCopyWith<$Res> {
  factory _$$_OrderInfoModelCopyWith(
          _$_OrderInfoModel value, $Res Function(_$_OrderInfoModel) then) =
      __$$_OrderInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cashid,
      String orderid,
      String? waiter_name,
      DateTime? created_at,
      int saleprice,
      int? paidamount,
      int? paidamountcard,
      int? deptamount});
}

/// @nodoc
class __$$_OrderInfoModelCopyWithImpl<$Res>
    extends _$OrderInfoModelCopyWithImpl<$Res, _$_OrderInfoModel>
    implements _$$_OrderInfoModelCopyWith<$Res> {
  __$$_OrderInfoModelCopyWithImpl(
      _$_OrderInfoModel _value, $Res Function(_$_OrderInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashid = null,
    Object? orderid = null,
    Object? waiter_name = freezed,
    Object? created_at = freezed,
    Object? saleprice = null,
    Object? paidamount = freezed,
    Object? paidamountcard = freezed,
    Object? deptamount = freezed,
  }) {
    return _then(_$_OrderInfoModel(
      cashid: null == cashid
          ? _value.cashid
          : cashid // ignore: cast_nullable_to_non_nullable
              as int,
      orderid: null == orderid
          ? _value.orderid
          : orderid // ignore: cast_nullable_to_non_nullable
              as String,
      waiter_name: freezed == waiter_name
          ? _value.waiter_name
          : waiter_name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleprice: null == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int,
      paidamount: freezed == paidamount
          ? _value.paidamount
          : paidamount // ignore: cast_nullable_to_non_nullable
              as int?,
      paidamountcard: freezed == paidamountcard
          ? _value.paidamountcard
          : paidamountcard // ignore: cast_nullable_to_non_nullable
              as int?,
      deptamount: freezed == deptamount
          ? _value.deptamount
          : deptamount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderInfoModel extends _OrderInfoModel {
  _$_OrderInfoModel(
      {required this.cashid,
      this.orderid = '0',
      this.waiter_name,
      this.created_at,
      this.saleprice = 0,
      this.paidamount = 0,
      this.paidamountcard = 0,
      this.deptamount = 0})
      : super._();

  factory _$_OrderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderInfoModelFromJson(json);

  @override
  final int cashid;
  @override
  @JsonKey()
  final String orderid;
  @override
  final String? waiter_name;
  @override
  final DateTime? created_at;
  @override
  @JsonKey()
  final int saleprice;
  @override
  @JsonKey()
  final int? paidamount;
  @override
  @JsonKey()
  final int? paidamountcard;
  @override
  @JsonKey()
  final int? deptamount;

  @override
  String toString() {
    return 'OrderInfoModel(cashid: $cashid, orderid: $orderid, waiter_name: $waiter_name, created_at: $created_at, saleprice: $saleprice, paidamount: $paidamount, paidamountcard: $paidamountcard, deptamount: $deptamount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderInfoModel &&
            (identical(other.cashid, cashid) || other.cashid == cashid) &&
            (identical(other.orderid, orderid) || other.orderid == orderid) &&
            (identical(other.waiter_name, waiter_name) ||
                other.waiter_name == waiter_name) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.saleprice, saleprice) ||
                other.saleprice == saleprice) &&
            (identical(other.paidamount, paidamount) ||
                other.paidamount == paidamount) &&
            (identical(other.paidamountcard, paidamountcard) ||
                other.paidamountcard == paidamountcard) &&
            (identical(other.deptamount, deptamount) ||
                other.deptamount == deptamount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cashid, orderid, waiter_name,
      created_at, saleprice, paidamount, paidamountcard, deptamount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderInfoModelCopyWith<_$_OrderInfoModel> get copyWith =>
      __$$_OrderInfoModelCopyWithImpl<_$_OrderInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderInfoModelToJson(
      this,
    );
  }
}

abstract class _OrderInfoModel extends OrderInfoModel {
  factory _OrderInfoModel(
      {required final int cashid,
      final String orderid,
      final String? waiter_name,
      final DateTime? created_at,
      final int saleprice,
      final int? paidamount,
      final int? paidamountcard,
      final int? deptamount}) = _$_OrderInfoModel;
  _OrderInfoModel._() : super._();

  factory _OrderInfoModel.fromJson(Map<String, dynamic> json) =
      _$_OrderInfoModel.fromJson;

  @override
  int get cashid;
  @override
  String get orderid;
  @override
  String? get waiter_name;
  @override
  DateTime? get created_at;
  @override
  int get saleprice;
  @override
  int? get paidamount;
  @override
  int? get paidamountcard;
  @override
  int? get deptamount;
  @override
  @JsonKey(ignore: true)
  _$$_OrderInfoModelCopyWith<_$_OrderInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
