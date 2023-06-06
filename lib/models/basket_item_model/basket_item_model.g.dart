// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasketItemModel _$$_BasketItemModelFromJson(Map<String, dynamic> json) =>
    _$_BasketItemModel(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String,
      name: json['name'] as String? ?? '',
      deletepersonid: json['deletepersonid'] as int?,
      quantity: json['quantity'] as int? ?? 1,
      realprice: (json['realprice'] as num?)?.toDouble() ?? 0,
      saleprice: (json['saleprice'] as num?)?.toDouble() ?? 0,
      recorddate: json['recorddate'] == null
          ? null
          : DateTime.parse(json['recorddate'] as String),
      flag: json['flag'] as int? ?? 0,
      edizm: json['edizm'] as String?,
      kname: json['kname'] as String?,
      adg: json['adg'] as String?,
      excise: json['excise'] as String? ?? '',
      modifrequired: json['modifrequired'] as bool?,
      modifiresListItem:
          json['modifiresListItem'] as List<dynamic>? ?? const <dynamic>[],
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((e) => ModifierModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ModifierModel>[],
    );

Map<String, dynamic> _$$_BasketItemModelToJson(_$_BasketItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'deletepersonid': instance.deletepersonid,
      'quantity': instance.quantity,
      'realprice': instance.realprice,
      'saleprice': instance.saleprice,
      'recorddate': instance.recorddate?.toIso8601String(),
      'flag': instance.flag,
      'edizm': instance.edizm,
      'kname': instance.kname,
      'adg': instance.adg,
      'excise': instance.excise,
      'modifrequired': instance.modifrequired,
      'modifiresListItem': instance.modifiresListItem,
      'modifiers': instance.modifiers,
    };
