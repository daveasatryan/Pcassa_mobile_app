import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/items_model.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/item_inkas.dart';
import 'package:pcassa_retail_mobile/models/user/dostup_object.dart';

part 'inkas_model.freezed.dart';
part 'inkas_model.g.dart';

@freezed
class Inkas_model with _$Inkas_model {
  factory Inkas_model({
    required int Amount,
    required List<Item_inkas> items,
  }) = _Inkas_model;

  const Inkas_model._();

  factory Inkas_model.fromJson(Map<String, dynamic> json) =>
      _$Inkas_modelFromJson(json);
}
