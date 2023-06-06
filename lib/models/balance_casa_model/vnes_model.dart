import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/items_model.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/item_inkas.dart';
import 'package:pcassa_retail_mobile/models/user/dostup_object.dart';

part 'vnes_model.freezed.dart';
part 'vnes_model.g.dart';

@freezed
class Vnes_model with _$Vnes_model {
  factory Vnes_model({
    required int Amount,
    required List<Item_inkas> items,
  }) = _Vnes_model;

  const Vnes_model._();

  factory Vnes_model.fromJson(Map<String, dynamic> json) =>
      _$Vnes_modelFromJson(json);
}
