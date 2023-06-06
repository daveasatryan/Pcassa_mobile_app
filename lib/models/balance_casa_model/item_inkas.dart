import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/items_model.dart';
import 'package:pcassa_retail_mobile/models/user/dostup_object.dart';

part 'item_inkas.freezed.dart';
part 'item_inkas.g.dart';

@freezed
class Item_inkas with _$Item_inkas {
  factory Item_inkas({
    required String? description,
    required String data_d,
    required int summa,
  }) = _Item_inkas;

  const Item_inkas._();

  factory Item_inkas.fromJson(Map<String, dynamic> json) =>
      _$Item_inkasFromJson(json);
}
