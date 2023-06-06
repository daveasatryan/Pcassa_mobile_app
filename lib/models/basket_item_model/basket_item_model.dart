import 'package:freezed_annotation/freezed_annotation.dart';

import '../modifier_model/modifier_model.dart';

part 'basket_item_model.freezed.dart';
part 'basket_item_model.g.dart';

@freezed
class BasketItemModel with _$BasketItemModel {
  factory BasketItemModel({
    @Default(0) int id,
    required String code,
    @Default('') String name,
    int? deletepersonid,
    @Default(1) int quantity,
    @Default(0) double realprice,
    @Default(0) double saleprice,
    DateTime? recorddate,
    @Default(0) int flag,
    String? edizm,
    String? kname,
    String? adg,
    @Default('') String excise,
    bool? modifrequired,
    @Default(<dynamic>[]) List modifiresListItem,
    @Default(<ModifierModel>[]) List<ModifierModel> modifiers,
  }) = _BasketItemModel;

  const BasketItemModel._();

  factory BasketItemModel.fromJson(Map<String, dynamic> json) =>
      _$BasketItemModelFromJson(json);
}
