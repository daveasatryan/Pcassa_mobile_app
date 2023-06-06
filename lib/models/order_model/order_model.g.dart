// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      orderinfo:
          OrderInfoModel.fromJson(json['orderinfo'] as Map<String, dynamic>),
      basket: (json['basket'] as List<dynamic>?)
              ?.map((e) => BasketItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BasketItemModel>[],
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'orderinfo': instance.orderinfo,
      'basket': instance.basket,
    };
