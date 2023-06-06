// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StopListModel _$$_StopListModelFromJson(Map<String, dynamic> json) =>
    _$_StopListModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      kod_tov: json['kod_tov'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_StopListModelToJson(_$_StopListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'kod_tov': instance.kod_tov,
      'quantity': instance.quantity,
    };
