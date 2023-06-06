// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifiers_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModifiersGroupModel _$$_ModifiersGroupModelFromJson(
        Map<String, dynamic> json) =>
    _$_ModifiersGroupModel(
      main: (json['main'] as List<dynamic>)
          .map((e) => ModifierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      optional: (json['optional'] as List<dynamic>)
          .map((e) => ModifierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ModifiersGroupModelToJson(
        _$_ModifiersGroupModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'optional': instance.optional,
    };
