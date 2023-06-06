// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'close_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClosePaymentModel _$ClosePaymentModelFromJson(Map<String, dynamic> json) {
  return _ClosePaymentModel.fromJson(json);
}

/// @nodoc
mixin _$ClosePaymentModel {
  int get group_id => throw _privateConstructorUsedError;
  int get orderid => throw _privateConstructorUsedError;
  String get chequenumber => throw _privateConstructorUsedError;
  String get waiter_name => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get paymentdate => throw _privateConstructorUsedError;
  int get saleprice => throw _privateConstructorUsedError;
  List<ClosePaymentItemsModel>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosePaymentModelCopyWith<ClosePaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosePaymentModelCopyWith<$Res> {
  factory $ClosePaymentModelCopyWith(
          ClosePaymentModel value, $Res Function(ClosePaymentModel) then) =
      _$ClosePaymentModelCopyWithImpl<$Res, ClosePaymentModel>;
  @useResult
  $Res call(
      {int group_id,
      int orderid,
      String chequenumber,
      String waiter_name,
      String created_at,
      String paymentdate,
      int saleprice,
      List<ClosePaymentItemsModel>? items});
}

/// @nodoc
class _$ClosePaymentModelCopyWithImpl<$Res, $Val extends ClosePaymentModel>
    implements $ClosePaymentModelCopyWith<$Res> {
  _$ClosePaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group_id = null,
    Object? orderid = null,
    Object? chequenumber = null,
    Object? waiter_name = null,
    Object? created_at = null,
    Object? paymentdate = null,
    Object? saleprice = null,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      group_id: null == group_id
          ? _value.group_id
          : group_id // ignore: cast_nullable_to_non_nullable
              as int,
      orderid: null == orderid
          ? _value.orderid
          : orderid // ignore: cast_nullable_to_non_nullable
              as int,
      chequenumber: null == chequenumber
          ? _value.chequenumber
          : chequenumber // ignore: cast_nullable_to_non_nullable
              as String,
      waiter_name: null == waiter_name
          ? _value.waiter_name
          : waiter_name // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      paymentdate: null == paymentdate
          ? _value.paymentdate
          : paymentdate // ignore: cast_nullable_to_non_nullable
              as String,
      saleprice: null == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClosePaymentItemsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClosePaymentModelCopyWith<$Res>
    implements $ClosePaymentModelCopyWith<$Res> {
  factory _$$_ClosePaymentModelCopyWith(_$_ClosePaymentModel value,
          $Res Function(_$_ClosePaymentModel) then) =
      __$$_ClosePaymentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int group_id,
      int orderid,
      String chequenumber,
      String waiter_name,
      String created_at,
      String paymentdate,
      int saleprice,
      List<ClosePaymentItemsModel>? items});
}

/// @nodoc
class __$$_ClosePaymentModelCopyWithImpl<$Res>
    extends _$ClosePaymentModelCopyWithImpl<$Res, _$_ClosePaymentModel>
    implements _$$_ClosePaymentModelCopyWith<$Res> {
  __$$_ClosePaymentModelCopyWithImpl(
      _$_ClosePaymentModel _value, $Res Function(_$_ClosePaymentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group_id = null,
    Object? orderid = null,
    Object? chequenumber = null,
    Object? waiter_name = null,
    Object? created_at = null,
    Object? paymentdate = null,
    Object? saleprice = null,
    Object? items = freezed,
  }) {
    return _then(_$_ClosePaymentModel(
      group_id: null == group_id
          ? _value.group_id
          : group_id // ignore: cast_nullable_to_non_nullable
              as int,
      orderid: null == orderid
          ? _value.orderid
          : orderid // ignore: cast_nullable_to_non_nullable
              as int,
      chequenumber: null == chequenumber
          ? _value.chequenumber
          : chequenumber // ignore: cast_nullable_to_non_nullable
              as String,
      waiter_name: null == waiter_name
          ? _value.waiter_name
          : waiter_name // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      paymentdate: null == paymentdate
          ? _value.paymentdate
          : paymentdate // ignore: cast_nullable_to_non_nullable
              as String,
      saleprice: null == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClosePaymentItemsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClosePaymentModel extends _ClosePaymentModel {
  _$_ClosePaymentModel(
      {required this.group_id,
      required this.orderid,
      required this.chequenumber,
      required this.waiter_name,
      required this.created_at,
      required this.paymentdate,
      required this.saleprice,
      final List<ClosePaymentItemsModel>? items})
      : _items = items,
        super._();

  factory _$_ClosePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClosePaymentModelFromJson(json);

  @override
  final int group_id;
  @override
  final int orderid;
  @override
  final String chequenumber;
  @override
  final String waiter_name;
  @override
  final String created_at;
  @override
  final String paymentdate;
  @override
  final int saleprice;
  final List<ClosePaymentItemsModel>? _items;
  @override
  List<ClosePaymentItemsModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClosePaymentModel(group_id: $group_id, orderid: $orderid, chequenumber: $chequenumber, waiter_name: $waiter_name, created_at: $created_at, paymentdate: $paymentdate, saleprice: $saleprice, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClosePaymentModel &&
            (identical(other.group_id, group_id) ||
                other.group_id == group_id) &&
            (identical(other.orderid, orderid) || other.orderid == orderid) &&
            (identical(other.chequenumber, chequenumber) ||
                other.chequenumber == chequenumber) &&
            (identical(other.waiter_name, waiter_name) ||
                other.waiter_name == waiter_name) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.paymentdate, paymentdate) ||
                other.paymentdate == paymentdate) &&
            (identical(other.saleprice, saleprice) ||
                other.saleprice == saleprice) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      group_id,
      orderid,
      chequenumber,
      waiter_name,
      created_at,
      paymentdate,
      saleprice,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClosePaymentModelCopyWith<_$_ClosePaymentModel> get copyWith =>
      __$$_ClosePaymentModelCopyWithImpl<_$_ClosePaymentModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClosePaymentModelToJson(
      this,
    );
  }
}

abstract class _ClosePaymentModel extends ClosePaymentModel {
  factory _ClosePaymentModel(
      {required final int group_id,
      required final int orderid,
      required final String chequenumber,
      required final String waiter_name,
      required final String created_at,
      required final String paymentdate,
      required final int saleprice,
      final List<ClosePaymentItemsModel>? items}) = _$_ClosePaymentModel;
  _ClosePaymentModel._() : super._();

  factory _ClosePaymentModel.fromJson(Map<String, dynamic> json) =
      _$_ClosePaymentModel.fromJson;

  @override
  int get group_id;
  @override
  int get orderid;
  @override
  String get chequenumber;
  @override
  String get waiter_name;
  @override
  String get created_at;
  @override
  String get paymentdate;
  @override
  int get saleprice;
  @override
  List<ClosePaymentItemsModel>? get items;
  @override
  @JsonKey(ignore: true)
  _$$_ClosePaymentModelCopyWith<_$_ClosePaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
