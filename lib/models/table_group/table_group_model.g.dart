// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TableGroup _$$_TableGroupFromJson(Map<String, dynamic> json) =>
    _$_TableGroup(
      id: json['id'] as int,
      name: json['name'] as String,
      tables: (json['tables'] as List<dynamic>?)
              ?.map((e) => TableModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TableModel>[],
      linkfoto: json['linkfoto'] as String?,
    );

Map<String, dynamic> _$$_TableGroupToJson(_$_TableGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tables': instance.tables,
      'linkfoto': instance.linkfoto,
    };
