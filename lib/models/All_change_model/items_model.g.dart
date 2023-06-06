// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemsModel _$$_ItemsModelFromJson(Map<String, dynamic> json) =>
    _$_ItemsModel(
      kod_tov: json['kod_tov'] as String?,
      barcode: json['barcode'] as String?,
      name: json['name'] as String?,
      ed_izm: json['ed_izm'] as String?,
      Quantity: json['Quantity'] as int?,
      SalePrice: json['SalePrice'] as int?,
      Amount: json['Amount'] as int?,
    );

Map<String, dynamic> _$$_ItemsModelToJson(_$_ItemsModel instance) =>
    <String, dynamic>{
      'kod_tov': instance.kod_tov,
      'barcode': instance.barcode,
      'name': instance.name,
      'ed_izm': instance.ed_izm,
      'Quantity': instance.Quantity,
      'SalePrice': instance.SalePrice,
      'Amount': instance.Amount,
    };
