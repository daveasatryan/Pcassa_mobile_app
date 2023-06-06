import 'package:freezed_annotation/freezed_annotation.dart';

part 'remainding_products_model.freezed.dart';
part 'remainding_products_model.g.dart';

@freezed
class RemaindingProductsModel with _$RemaindingProductsModel {
  factory RemaindingProductsModel({
    String? kod_tov,
    String? barcode,
    String? name,
    String? ed_izm,
    int? quantity,
    int? price_o_r,
    int? price_s,
    String? sklname,
  }) = _RemaindingProductsModel;

  factory RemaindingProductsModel.fromJson(Map<String, dynamic> json) =>
      _$RemaindingProductsModelFromJson(json);
}
