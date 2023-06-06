// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      guid: json['guid'] as String,
      isProduct: json['isProduct'] as bool? ?? false,
      isroot: json['isroot'] as int?,
      haschildren: json['haschildren'] as int?,
      parentguid: json['parentguid'] as String?,
      caption: json['caption'] as String?,
      linkfoto: json['linkfoto'] as String?,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'isProduct': instance.isProduct,
      'isroot': instance.isroot,
      'haschildren': instance.haschildren,
      'parentguid': instance.parentguid,
      'caption': instance.caption,
      'linkfoto': instance.linkfoto,
    };
