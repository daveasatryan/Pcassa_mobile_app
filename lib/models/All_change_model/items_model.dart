import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail_mobile/models/user/dostup_object.dart';

part 'items_model.freezed.dart';
part 'items_model.g.dart';

@freezed
class ItemsModel with _$ItemsModel {
  factory ItemsModel({
    required String? kod_tov,
    required String? barcode,
    required String? name,
    required String? ed_izm,
    required int? Quantity,
    required int? SalePrice,
    required int? Amount,
  }) = _ItemsModel;
  const ItemsModel._();

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);
}
