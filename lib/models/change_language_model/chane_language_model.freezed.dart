// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chane_language_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChaneLanguageModel _$ChaneLanguageModelFromJson(Map<String, dynamic> json) {
  return _ChaneLanguageModel.fromJson(json);
}

/// @nodoc
mixin _$ChaneLanguageModel {
  int get id => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get fio => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  Dostup_object get dostup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChaneLanguageModelCopyWith<ChaneLanguageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaneLanguageModelCopyWith<$Res> {
  factory $ChaneLanguageModelCopyWith(
          ChaneLanguageModel value, $Res Function(ChaneLanguageModel) then) =
      _$ChaneLanguageModelCopyWithImpl<$Res, ChaneLanguageModel>;
  @useResult
  $Res call(
      {int id,
      String login,
      String fio,
      String language,
      Dostup_object dostup});

  $Dostup_objectCopyWith<$Res> get dostup;
}

/// @nodoc
class _$ChaneLanguageModelCopyWithImpl<$Res, $Val extends ChaneLanguageModel>
    implements $ChaneLanguageModelCopyWith<$Res> {
  _$ChaneLanguageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? fio = null,
    Object? language = null,
    Object? dostup = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      fio: null == fio
          ? _value.fio
          : fio // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      dostup: null == dostup
          ? _value.dostup
          : dostup // ignore: cast_nullable_to_non_nullable
              as Dostup_object,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $Dostup_objectCopyWith<$Res> get dostup {
    return $Dostup_objectCopyWith<$Res>(_value.dostup, (value) {
      return _then(_value.copyWith(dostup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChaneLanguageModelCopyWith<$Res>
    implements $ChaneLanguageModelCopyWith<$Res> {
  factory _$$_ChaneLanguageModelCopyWith(_$_ChaneLanguageModel value,
          $Res Function(_$_ChaneLanguageModel) then) =
      __$$_ChaneLanguageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String login,
      String fio,
      String language,
      Dostup_object dostup});

  @override
  $Dostup_objectCopyWith<$Res> get dostup;
}

/// @nodoc
class __$$_ChaneLanguageModelCopyWithImpl<$Res>
    extends _$ChaneLanguageModelCopyWithImpl<$Res, _$_ChaneLanguageModel>
    implements _$$_ChaneLanguageModelCopyWith<$Res> {
  __$$_ChaneLanguageModelCopyWithImpl(
      _$_ChaneLanguageModel _value, $Res Function(_$_ChaneLanguageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? fio = null,
    Object? language = null,
    Object? dostup = null,
  }) {
    return _then(_$_ChaneLanguageModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      fio: null == fio
          ? _value.fio
          : fio // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      dostup: null == dostup
          ? _value.dostup
          : dostup // ignore: cast_nullable_to_non_nullable
              as Dostup_object,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChaneLanguageModel extends _ChaneLanguageModel {
  _$_ChaneLanguageModel(
      {required this.id,
      required this.login,
      required this.fio,
      required this.language,
      required this.dostup})
      : super._();

  factory _$_ChaneLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChaneLanguageModelFromJson(json);

  @override
  final int id;
  @override
  final String login;
  @override
  final String fio;
  @override
  final String language;
  @override
  final Dostup_object dostup;

  @override
  String toString() {
    return 'ChaneLanguageModel(id: $id, login: $login, fio: $fio, language: $language, dostup: $dostup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChaneLanguageModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.fio, fio) || other.fio == fio) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.dostup, dostup) || other.dostup == dostup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, login, fio, language, dostup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChaneLanguageModelCopyWith<_$_ChaneLanguageModel> get copyWith =>
      __$$_ChaneLanguageModelCopyWithImpl<_$_ChaneLanguageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChaneLanguageModelToJson(
      this,
    );
  }
}

abstract class _ChaneLanguageModel extends ChaneLanguageModel {
  factory _ChaneLanguageModel(
      {required final int id,
      required final String login,
      required final String fio,
      required final String language,
      required final Dostup_object dostup}) = _$_ChaneLanguageModel;
  _ChaneLanguageModel._() : super._();

  factory _ChaneLanguageModel.fromJson(Map<String, dynamic> json) =
      _$_ChaneLanguageModel.fromJson;

  @override
  int get id;
  @override
  String get login;
  @override
  String get fio;
  @override
  String get language;
  @override
  Dostup_object get dostup;
  @override
  @JsonKey(ignore: true)
  _$$_ChaneLanguageModelCopyWith<_$_ChaneLanguageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
