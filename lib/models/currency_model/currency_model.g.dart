// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyModel _$$_CurrencyModelFromJson(Map<String, dynamic> json) =>
    _$_CurrencyModel(
      saleprice: (json['saleprice'] as num?)?.toDouble(),
      paid: (json['paid'] as num?)?.toDouble(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CurrencyItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CurrencyModelToJson(_$_CurrencyModel instance) =>
    <String, dynamic>{
      'saleprice': instance.saleprice,
      'paid': instance.paid,
      'items': instance.items,
    };
