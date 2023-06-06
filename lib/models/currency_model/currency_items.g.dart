// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyItemsModel _$$_CurrencyItemsModelFromJson(
        Map<String, dynamic> json) =>
    _$_CurrencyItemsModel(
      cod: json['cod'] as int,
      name: json['name'] as String,
      b_valyuta: json['b_valyuta'] as bool? ?? false,
      linkfoto: json['linkfoto'] as String?,
      tip: json['tip'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CurrencyItemsModelToJson(
        _$_CurrencyItemsModel instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'name': instance.name,
      'b_valyuta': instance.b_valyuta,
      'linkfoto': instance.linkfoto,
      'tip': instance.tip,
    };
