// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_change_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllChangeModel _$$_AllChangeModelFromJson(Map<String, dynamic> json) =>
    _$_AllChangeModel(
      summa: json['summa'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AllChangeModelToJson(_$_AllChangeModel instance) =>
    <String, dynamic>{
      'summa': instance.summa,
      'items': instance.items,
    };
