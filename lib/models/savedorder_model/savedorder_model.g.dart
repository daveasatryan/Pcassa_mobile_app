// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savedorder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedOrderModel _$$_SavedOrderModelFromJson(Map<String, dynamic> json) =>
    _$_SavedOrderModel(
      group_id: json['group_id'] as int?,
      orderid: json['orderid'] as int?,
      table_name: json['table_name'] as String?,
      waiter_name: json['waiter_name'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      saleprice: json['saleprice'] as int?,
      paid: json['paid'] as int?,
    );

Map<String, dynamic> _$$_SavedOrderModelToJson(_$_SavedOrderModel instance) =>
    <String, dynamic>{
      'group_id': instance.group_id,
      'orderid': instance.orderid,
      'table_name': instance.table_name,
      'waiter_name': instance.waiter_name,
      'created_at': instance.created_at?.toIso8601String(),
      'saleprice': instance.saleprice,
      'paid': instance.paid,
    };
