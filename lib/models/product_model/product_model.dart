import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/app_settings.dart';
import '../menu_abstract_model/menu_abstract_model.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel implements MenuAbstractModel {
  factory ProductModel({
    required String guid,
    required String? name,
    required String? ed_izm,
    required String? kod_tov,
    required String? barcode,
    required String? barcode_grupp,
    required String? kname,
    required String? adg,
    required int? priznak_sk,
    required bool? excise,
    @Default(true) bool isProduct,
    @Default(false) bool top,
    @Default(false) bool modifrequired,
    @Default([]) List<String>? guid_mod,
    @Default(0) double price_o_r,
    @Default(0) double price_o_o,
  }) = _ProductModel;

// required String guid,
//     @Default(true) bool isProduct,
//     @Default(false) bool top,
//     @Default(false) bool modifrequired,
//     @Default([]) List<String> guid_mod,
//     @Default(0) double price_o_r,
//     @Default(0) double price_o_o,
//     String? name,
//     String? gguid,
//     String? linkfoto,
//     String? kat_tov,
//     String? kod_tov,
//     String? description,
//     String? ed_izm,
//     String? kname,
//     String? adg,
//  "guid": "98392c82-f320-4302-944b-01abf6608ff9",
//     "name": "Хабрат Нахем",
//     "ed_izm": "порция",
//     "kod_tov": "0057",
//     "barcode": "0057",
//     "barcode_grupp": "0057",
//     "price_o_r": 2500,
//     "price_o_o": 0,
//     "kname": "Habrah Nayeh",
//     "adg": "56.29",
//     "priznak_sk": 0

  ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  // String get image => '${AppSettings.baseUrl}/images/$linkfoto';
}
