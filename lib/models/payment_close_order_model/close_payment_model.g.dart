// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClosePaymentModel _$$_ClosePaymentModelFromJson(Map<String, dynamic> json) =>
    _$_ClosePaymentModel(
      group_id: json['group_id'] as int,
      orderid: json['orderid'] as int,
      chequenumber: json['chequenumber'] as String,
      waiter_name: json['waiter_name'] as String,
      created_at: json['created_at'] as String,
      paymentdate: json['paymentdate'] as String,
      saleprice: json['saleprice'] as int,
      items: (json['items'] as List<dynamic>?)
          ?.map(
              (e) => ClosePaymentItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ClosePaymentModelToJson(
        _$_ClosePaymentModel instance) =>
    <String, dynamic>{
      'group_id': instance.group_id,
      'orderid': instance.orderid,
      'chequenumber': instance.chequenumber,
      'waiter_name': instance.waiter_name,
      'created_at': instance.created_at,
      'paymentdate': instance.paymentdate,
      'saleprice': instance.saleprice,
      'items': instance.items,
    };
