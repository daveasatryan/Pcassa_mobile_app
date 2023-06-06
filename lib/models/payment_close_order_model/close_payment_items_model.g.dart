// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_payment_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClosePaymentItemsModel _$$_ClosePaymentItemsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ClosePaymentItemsModel(
      id: json['id'] as int?,
      productcode: json['productcode'] as String?,
      productname: json['productname'] as String?,
      quantity: json['quantity'] as int?,
      saleprice: json['saleprice'] as int?,
      realprice: json['realprice'] as int?,
      flag: json['flag'] as int?,
    );

Map<String, dynamic> _$$_ClosePaymentItemsModelToJson(
        _$_ClosePaymentItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productcode': instance.productcode,
      'productname': instance.productname,
      'quantity': instance.quantity,
      'saleprice': instance.saleprice,
      'realprice': instance.realprice,
      'flag': instance.flag,
    };
