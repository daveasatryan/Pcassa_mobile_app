// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SprModel _$SprModelFromJson(Map<String, dynamic> json) {
  return _SprModel.fromJson(json);
}

/// @nodoc
mixin _$SprModel {
  String? get name => throw _privateConstructorUsedError;
  String? get kod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SprModelCopyWith<SprModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SprModelCopyWith<$Res> {
  factory $SprModelCopyWith(SprModel value, $Res Function(SprModel) then) =
      _$SprModelCopyWithImpl<$Res, SprModel>;
  @useResult
  $Res call({String? name, String? kod});
}

/// @nodoc
class _$SprModelCopyWithImpl<$Res, $Val extends SprModel>
    implements $SprModelCopyWith<$Res> {
  _$SprModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? kod = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      kod: freezed == kod
          ? _value.kod
          : kod // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SprModelCopyWith<$Res> implements $SprModelCopyWith<$Res> {
  factory _$$_SprModelCopyWith(
          _$_SprModel value, $Res Function(_$_SprModel) then) =
      __$$_SprModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? kod});
}

/// @nodoc
class __$$_SprModelCopyWithImpl<$Res>
    extends _$SprModelCopyWithImpl<$Res, _$_SprModel>
    implements _$$_SprModelCopyWith<$Res> {
  __$$_SprModelCopyWithImpl(
      _$_SprModel _value, $Res Function(_$_SprModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? kod = freezed,
  }) {
    return _then(_$_SprModel(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      kod: freezed == kod
          ? _value.kod
          : kod // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SprModel extends _SprModel {
  _$_SprModel({this.name, this.kod}) : super._();

  factory _$_SprModel.fromJson(Map<String, dynamic> json) =>
      _$$_SprModelFromJson(json);

  @override
  final String? name;
  @override
  final String? kod;

  @override
  String toString() {
    return 'SprModel(name: $name, kod: $kod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SprModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.kod, kod) || other.kod == kod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, kod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SprModelCopyWith<_$_SprModel> get copyWith =>
      __$$_SprModelCopyWithImpl<_$_SprModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SprModelToJson(
      this,
    );
  }
}

abstract class _SprModel extends SprModel {
  factory _SprModel({final String? name, final String? kod}) = _$_SprModel;
  _SprModel._() : super._();

  factory _SprModel.fromJson(Map<String, dynamic> json) = _$_SprModel.fromJson;

  @override
  String? get name;
  @override
  String? get kod;
  @override
  @JsonKey(ignore: true)
  _$$_SprModelCopyWith<_$_SprModel> get copyWith =>
      throw _privateConstructorUsedError;
}
