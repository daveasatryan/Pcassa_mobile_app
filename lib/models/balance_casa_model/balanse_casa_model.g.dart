// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balanse_casa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BalanseCasaModel _$$_BalanseCasaModelFromJson(Map<String, dynamic> json) =>
    _$_BalanseCasaModel(
      sale: json['sale'] as int,
      inkass: Inkas_model.fromJson(json['inkass'] as Map<String, dynamic>),
      vnes: Vnes_model.fromJson(json['vnes'] as Map<String, dynamic>),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$$_BalanseCasaModelToJson(_$_BalanseCasaModel instance) =>
    <String, dynamic>{
      'sale': instance.sale,
      'inkass': instance.inkass,
      'vnes': instance.vnes,
      'amount': instance.amount,
    };
