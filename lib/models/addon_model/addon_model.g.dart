// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddonModel _$$_AddonModelFromJson(Map<String, dynamic> json) =>
    _$_AddonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      val: json['val'] as int,
      tip: json['tip'] as String?,
    );

Map<String, dynamic> _$$_AddonModelToJson(_$_AddonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'val': instance.val,
      'tip': instance.tip,
    };
