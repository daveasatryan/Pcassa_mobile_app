// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vnes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vnes_model _$Vnes_modelFromJson(Map<String, dynamic> json) {
  return _Vnes_model.fromJson(json);
}

/// @nodoc
mixin _$Vnes_model {
  int get Amount => throw _privateConstructorUsedError;
  List<Item_inkas> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Vnes_modelCopyWith<Vnes_model> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Vnes_modelCopyWith<$Res> {
  factory $Vnes_modelCopyWith(
          Vnes_model value, $Res Function(Vnes_model) then) =
      _$Vnes_modelCopyWithImpl<$Res, Vnes_model>;
  @useResult
  $Res call({int Amount, List<Item_inkas> items});
}

/// @nodoc
class _$Vnes_modelCopyWithImpl<$Res, $Val extends Vnes_model>
    implements $Vnes_modelCopyWith<$Res> {
  _$Vnes_modelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Amount = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      Amount: null == Amount
          ? _value.Amount
          : Amount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item_inkas>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Vnes_modelCopyWith<$Res>
    implements $Vnes_modelCopyWith<$Res> {
  factory _$$_Vnes_modelCopyWith(
          _$_Vnes_model value, $Res Function(_$_Vnes_model) then) =
      __$$_Vnes_modelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int Amount, List<Item_inkas> items});
}

/// @nodoc
class __$$_Vnes_modelCopyWithImpl<$Res>
    extends _$Vnes_modelCopyWithImpl<$Res, _$_Vnes_model>
    implements _$$_Vnes_modelCopyWith<$Res> {
  __$$_Vnes_modelCopyWithImpl(
      _$_Vnes_model _value, $Res Function(_$_Vnes_model) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Amount = null,
    Object? items = null,
  }) {
    return _then(_$_Vnes_model(
      Amount: null == Amount
          ? _value.Amount
          : Amount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item_inkas>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Vnes_model extends _Vnes_model {
  _$_Vnes_model({required this.Amount, required final List<Item_inkas> items})
      : _items = items,
        super._();

  factory _$_Vnes_model.fromJson(Map<String, dynamic> json) =>
      _$$_Vnes_modelFromJson(json);

  @override
  final int Amount;
  final List<Item_inkas> _items;
  @override
  List<Item_inkas> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Vnes_model(Amount: $Amount, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Vnes_model &&
            (identical(other.Amount, Amount) || other.Amount == Amount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, Amount, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Vnes_modelCopyWith<_$_Vnes_model> get copyWith =>
      __$$_Vnes_modelCopyWithImpl<_$_Vnes_model>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Vnes_modelToJson(
      this,
    );
  }
}

abstract class _Vnes_model extends Vnes_model {
  factory _Vnes_model(
      {required final int Amount,
      required final List<Item_inkas> items}) = _$_Vnes_model;
  _Vnes_model._() : super._();

  factory _Vnes_model.fromJson(Map<String, dynamic> json) =
      _$_Vnes_model.fromJson;

  @override
  int get Amount;
  @override
  List<Item_inkas> get items;
  @override
  @JsonKey(ignore: true)
  _$$_Vnes_modelCopyWith<_$_Vnes_model> get copyWith =>
      throw _privateConstructorUsedError;
}