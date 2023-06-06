// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chane_language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChaneLanguageModel _$$_ChaneLanguageModelFromJson(
        Map<String, dynamic> json) =>
    _$_ChaneLanguageModel(
      id: json['id'] as int,
      login: json['login'] as String,
      fio: json['fio'] as String,
      language: json['language'] as String,
      dostup: Dostup_object.fromJson(json['dostup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChaneLanguageModelToJson(
        _$_ChaneLanguageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'fio': instance.fio,
      'language': instance.language,
      'dostup': instance.dostup,
    };
