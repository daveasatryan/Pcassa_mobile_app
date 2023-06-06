// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TableModel _$$_TableModelFromJson(Map<String, dynamic> json) =>
    _$_TableModel(
      id: json['id'] as int,
      n_t: json['n_t'] as String,
      k_g: json['k_g'] as int,
      linkfoto: json['linkfoto'] as String?,
      skidnac: json['skidnac'] as int?,
      fio: json['fio'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      sum: json['sum'] as int? ?? 0,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TableModelToJson(_$_TableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'n_t': instance.n_t,
      'k_g': instance.k_g,
      'linkfoto': instance.linkfoto,
      'skidnac': instance.skidnac,
      'fio': instance.fio,
      'date': instance.date?.toIso8601String(),
      'sum': instance.sum,
      'status': instance.status,
    };
