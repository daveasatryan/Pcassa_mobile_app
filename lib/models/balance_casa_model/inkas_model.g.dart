// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inkas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Inkas_model _$$_Inkas_modelFromJson(Map<String, dynamic> json) =>
    _$_Inkas_model(
      Amount: json['Amount'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item_inkas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_Inkas_modelToJson(_$_Inkas_model instance) =>
    <String, dynamic>{
      'Amount': instance.Amount,
      'items': instance.items,
    };
