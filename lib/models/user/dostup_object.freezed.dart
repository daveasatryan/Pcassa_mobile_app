// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dostup_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dostup_object _$Dostup_objectFromJson(Map<String, dynamic> json) {
  return _Dostup_object.fromJson(json);
}

/// @nodoc
mixin _$Dostup_object {
  List<dynamic>? get quick_check => throw _privateConstructorUsedError;
  List<dynamic>? get my_orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Dostup_objectCopyWith<Dostup_object> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Dostup_objectCopyWith<$Res> {
  factory $Dostup_objectCopyWith(
          Dostup_object value, $Res Function(Dostup_object) then) =
      _$Dostup_objectCopyWithImpl<$Res, Dostup_object>;
  @useResult
  $Res call({List<dynamic>? quick_check, List<dynamic>? my_orders});
}

/// @nodoc
class _$Dostup_objectCopyWithImpl<$Res, $Val extends Dostup_object>
    implements $Dostup_objectCopyWith<$Res> {
  _$Dostup_objectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quick_check = freezed,
    Object? my_orders = freezed,
  }) {
    return _then(_value.copyWith(
      quick_check: freezed == quick_check
          ? _value.quick_check
          : quick_check // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      my_orders: freezed == my_orders
          ? _value.my_orders
          : my_orders // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Dostup_objectCopyWith<$Res>
    implements $Dostup_objectCopyWith<$Res> {
  factory _$$_Dostup_objectCopyWith(
          _$_Dostup_object value, $Res Function(_$_Dostup_object) then) =
      __$$_Dostup_objectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? quick_check, List<dynamic>? my_orders});
}

/// @nodoc
class __$$_Dostup_objectCopyWithImpl<$Res>
    extends _$Dostup_objectCopyWithImpl<$Res, _$_Dostup_object>
    implements _$$_Dostup_objectCopyWith<$Res> {
  __$$_Dostup_objectCopyWithImpl(
      _$_Dostup_object _value, $Res Function(_$_Dostup_object) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quick_check = freezed,
    Object? my_orders = freezed,
  }) {
    return _then(_$_Dostup_object(
      quick_check: freezed == quick_check
          ? _value._quick_check
          : quick_check // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      my_orders: freezed == my_orders
          ? _value._my_orders
          : my_orders // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dostup_object implements _Dostup_object {
  _$_Dostup_object(
      {final List<dynamic>? quick_check, final List<dynamic>? my_orders})
      : _quick_check = quick_check,
        _my_orders = my_orders;

  factory _$_Dostup_object.fromJson(Map<String, dynamic> json) =>
      _$$_Dostup_objectFromJson(json);

  final List<dynamic>? _quick_check;
  @override
  List<dynamic>? get quick_check {
    final value = _quick_check;
    if (value == null) return null;
    if (_quick_check is EqualUnmodifiableListView) return _quick_check;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _my_orders;
  @override
  List<dynamic>? get my_orders {
    final value = _my_orders;
    if (value == null) return null;
    if (_my_orders is EqualUnmodifiableListView) return _my_orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Dostup_object(quick_check: $quick_check, my_orders: $my_orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dostup_object &&
            const DeepCollectionEquality()
                .equals(other._quick_check, _quick_check) &&
            const DeepCollectionEquality()
                .equals(other._my_orders, _my_orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_quick_check),
      const DeepCollectionEquality().hash(_my_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Dostup_objectCopyWith<_$_Dostup_object> get copyWith =>
      __$$_Dostup_objectCopyWithImpl<_$_Dostup_object>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Dostup_objectToJson(
      this,
    );
  }
}

abstract class _Dostup_object implements Dostup_object {
  factory _Dostup_object(
      {final List<dynamic>? quick_check,
      final List<dynamic>? my_orders}) = _$_Dostup_object;

  factory _Dostup_object.fromJson(Map<String, dynamic> json) =
      _$_Dostup_object.fromJson;

  @override
  List<dynamic>? get quick_check;
  @override
  List<dynamic>? get my_orders;
  @override
  @JsonKey(ignore: true)
  _$$_Dostup_objectCopyWith<_$_Dostup_object> get copyWith =>
      throw _privateConstructorUsedError;
}
