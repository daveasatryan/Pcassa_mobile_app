// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderInfoModel _$$_OrderInfoModelFromJson(Map<String, dynamic> json) =>
    _$_OrderInfoModel(
      cashid: json['cashid'] as int,
      orderid: json['orderid'] as String? ?? '0',
      waiter_name: json['waiter_name'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      saleprice: json['saleprice'] as int? ?? 0,
      paidamount: json['paidamount'] as int? ?? 0,
      paidamountcard: json['paidamountcard'] as int? ?? 0,
      deptamount: json['deptamount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_OrderInfoModelToJson(_$_OrderInfoModel instance) =>
    <String, dynamic>{
      'cashid': instance.cashid,
      'orderid': instance.orderid,
      'waiter_name': instance.waiter_name,
      'created_at': instance.created_at?.toIso8601String(),
      'saleprice': instance.saleprice,
      'paidamount': instance.paidamount,
      'paidamountcard': instance.paidamountcard,
      'deptamount': instance.deptamount,
    };
