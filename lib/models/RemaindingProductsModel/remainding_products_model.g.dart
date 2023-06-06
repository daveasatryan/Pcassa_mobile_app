// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remainding_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RemaindingProductsModel _$$_RemaindingProductsModelFromJson(
        Map<String, dynamic> json) =>
    _$_RemaindingProductsModel(
      kod_tov: json['kod_tov'] as String?,
      barcode: json['barcode'] as String?,
      name: json['name'] as String?,
      ed_izm: json['ed_izm'] as String?,
      quantity: json['quantity'] as int?,
      price_o_r: json['price_o_r'] as int?,
      price_s: json['price_s'] as int?,
      sklname: json['sklname'] as String?,
    );

Map<String, dynamic> _$$_RemaindingProductsModelToJson(
        _$_RemaindingProductsModel instance) =>
    <String, dynamic>{
      'kod_tov': instance.kod_tov,
      'barcode': instance.barcode,
      'name': instance.name,
      'ed_izm': instance.ed_izm,
      'quantity': instance.quantity,
      'price_o_r': instance.price_o_r,
      'price_s': instance.price_s,
      'sklname': instance.sklname,
    };
