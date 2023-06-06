// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModifierModel _$$_ModifierModelFromJson(Map<String, dynamic> json) =>
    _$_ModifierModel(
      guid: json['guid'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      ed_izm: json['ed_izm'] as String?,
      gguid: json['gguid'] as String?,
      kat_tov: json['kat_tov'] as String?,
      kod_tov: json['kod_tov'] as String?,
      linkfoto: json['linkfoto'] as String?,
      barcode: json['barcode'] as String?,
      barcode_grupp: json['barcode_grupp'] as String?,
      price_o_r: json['price_o_r'] as int? ?? 0,
      price_o_o: json['price_o_o'] as int? ?? 0,
      kname: json['kname'] as String?,
      adg: json['adg'] as String?,
      priznak_sk: json['priznak_sk'] as int?,
      komplekt_id: json['komplekt_id'] as int?,
      top: json['top'] as bool? ?? false,
      count: json['count'] as int? ?? 1,
    );

Map<String, dynamic> _$$_ModifierModelToJson(_$_ModifierModel instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'name': instance.name,
      'description': instance.description,
      'ed_izm': instance.ed_izm,
      'gguid': instance.gguid,
      'kat_tov': instance.kat_tov,
      'kod_tov': instance.kod_tov,
      'linkfoto': instance.linkfoto,
      'barcode': instance.barcode,
      'barcode_grupp': instance.barcode_grupp,
      'price_o_r': instance.price_o_r,
      'price_o_o': instance.price_o_o,
      'kname': instance.kname,
      'adg': instance.adg,
      'priznak_sk': instance.priznak_sk,
      'komplekt_id': instance.komplekt_id,
      'top': instance.top,
      'count': instance.count,
    };
