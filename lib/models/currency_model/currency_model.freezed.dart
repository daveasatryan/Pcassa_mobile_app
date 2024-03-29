// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return _CurrencyModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyModel {
  double? get saleprice => throw _privateConstructorUsedError;
  double? get paid => throw _privateConstructorUsedError;
  List<CurrencyItemsModel>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyModelCopyWith<CurrencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyModelCopyWith<$Res> {
  factory $CurrencyModelCopyWith(
          CurrencyModel value, $Res Function(CurrencyModel) then) =
      _$CurrencyModelCopyWithImpl<$Res, CurrencyModel>;
  @useResult
  $Res call({double? saleprice, double? paid, List<CurrencyItemsModel>? items});
}

/// @nodoc
class _$CurrencyModelCopyWithImpl<$Res, $Val extends CurrencyModel>
    implements $CurrencyModelCopyWith<$Res> {
  _$CurrencyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleprice = freezed,
    Object? paid = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      saleprice: freezed == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as double?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as double?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CurrencyItemsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyModelCopyWith<$Res>
    implements $CurrencyModelCopyWith<$Res> {
  factory _$$_CurrencyModelCopyWith(
          _$_CurrencyModel value, $Res Function(_$_CurrencyModel) then) =
      __$$_CurrencyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? saleprice, double? paid, List<CurrencyItemsModel>? items});
}

/// @nodoc
class __$$_CurrencyModelCopyWithImpl<$Res>
    extends _$CurrencyModelCopyWithImpl<$Res, _$_CurrencyModel>
    implements _$$_CurrencyModelCopyWith<$Res> {
  __$$_CurrencyModelCopyWithImpl(
      _$_CurrencyModel _value, $Res Function(_$_CurrencyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleprice = freezed,
    Object? paid = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_CurrencyModel(
      saleprice: freezed == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as double?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as double?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CurrencyItemsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyModel extends _CurrencyModel {
  _$_CurrencyModel(
      {this.saleprice, this.paid, final List<CurrencyItemsModel>? items})
      : _items = items,
        super._();

  factory _$_CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyModelFromJson(json);

  @override
  final double? saleprice;
  @override
  final double? paid;
  final List<CurrencyItemsModel>? _items;
  @override
  List<CurrencyItemsModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CurrencyModel(saleprice: $saleprice, paid: $paid, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyModel &&
            (identical(other.saleprice, saleprice) ||
                other.saleprice == saleprice) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, saleprice, paid,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyModelCopyWith<_$_CurrencyModel> get copyWith =>
      __$$_CurrencyModelCopyWithImpl<_$_CurrencyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyModelToJson(
      this,
    );
  }
}

abstract class _CurrencyModel extends CurrencyModel {
  factory _CurrencyModel(
      {final double? saleprice,
      final double? paid,
      final List<CurrencyItemsModel>? items}) = _$_CurrencyModel;
  _CurrencyModel._() : super._();

  factory _CurrencyModel.fromJson(Map<String, dynamic> json) =
      _$_CurrencyModel.fromJson;

  @override
  double? get saleprice;
  @override
  double? get paid;
  @override
  List<CurrencyItemsModel>? get items;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyModelCopyWith<_$_CurrencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
