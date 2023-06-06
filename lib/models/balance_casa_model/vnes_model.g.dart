// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vnes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vnes_model _$$_Vnes_modelFromJson(Map<String, dynamic> json) =>
    _$_Vnes_model(
      Amount: json['Amount'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item_inkas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_Vnes_modelToJson(_$_Vnes_model instance) =>
    <String, dynamic>{
      'Amount': instance.Amount,
      'items': instance.items,
    };
