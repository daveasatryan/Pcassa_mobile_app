// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscountModel _$$_DiscountModelFromJson(Map<String, dynamic> json) =>
    _$_DiscountModel(
      id: json['id'] as int,
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => AddonModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AddonModel>[],
      linkfoto: json['linkfoto'] as String?,
    );

Map<String, dynamic> _$$_DiscountModelToJson(_$_DiscountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items,
      'linkfoto': instance.linkfoto,
    };
