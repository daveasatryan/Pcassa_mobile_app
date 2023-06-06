// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_change_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllChangeModel _$AllChangeModelFromJson(Map<String, dynamic> json) {
  return _AllChangeModel.fromJson(json);
}

/// @nodoc
mixin _$AllChangeModel {
  int get summa => throw _privateConstructorUsedError;
  List<ItemsModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllChangeModelCopyWith<AllChangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllChangeModelCopyWith<$Res> {
  factory $AllChangeModelCopyWith(
          AllChangeModel value, $Res Function(AllChangeModel) then) =
      _$AllChangeModelCopyWithImpl<$Res, AllChangeModel>;
  @useResult
  $Res call({int summa, List<ItemsModel> items});
}

/// @nodoc
class _$AllChangeModelCopyWithImpl<$Res, $Val extends AllChangeModel>
    implements $AllChangeModelCopyWith<$Res> {
  _$AllChangeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summa = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      summa: null == summa
          ? _value.summa
          : summa // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllChangeModelCopyWith<$Res>
    implements $AllChangeModelCopyWith<$Res> {
  factory _$$_AllChangeModelCopyWith(
          _$_AllChangeModel value, $Res Function(_$_AllChangeModel) then) =
      __$$_AllChangeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int summa, List<ItemsModel> items});
}

/// @nodoc
class __$$_AllChangeModelCopyWithImpl<$Res>
    extends _$AllChangeModelCopyWithImpl<$Res, _$_AllChangeModel>
    implements _$$_AllChangeModelCopyWith<$Res> {
  __$$_AllChangeModelCopyWithImpl(
      _$_AllChangeModel _value, $Res Function(_$_AllChangeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summa = null,
    Object? items = null,
  }) {
    return _then(_$_AllChangeModel(
      summa: null == summa
          ? _value.summa
          : summa // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllChangeModel extends _AllChangeModel {
  _$_AllChangeModel(
      {required this.summa, required final List<ItemsModel> items})
      : _items = items,
        super._();

  factory _$_AllChangeModel.fromJson(Map<String, dynamic> json) =>
      _$$_AllChangeModelFromJson(json);

  @override
  final int summa;
  final List<ItemsModel> _items;
  @override
  List<ItemsModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AllChangeModel(summa: $summa, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllChangeModel &&
            (identical(other.summa, summa) || other.summa == summa) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, summa, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllChangeModelCopyWith<_$_AllChangeModel> get copyWith =>
      __$$_AllChangeModelCopyWithImpl<_$_AllChangeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllChangeModelToJson(
      this,
    );
  }
}

abstract class _AllChangeModel extends AllChangeModel {
  factory _AllChangeModel(
      {required final int summa,
      required final List<ItemsModel> items}) = _$_AllChangeModel;
  _AllChangeModel._() : super._();

  factory _AllChangeModel.fromJson(Map<String, dynamic> json) =
      _$_AllChangeModel.fromJson;

  @override
  int get summa;
  @override
  List<ItemsModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_AllChangeModelCopyWith<_$_AllChangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
