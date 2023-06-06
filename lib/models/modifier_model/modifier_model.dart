import 'package:freezed_annotation/freezed_annotation.dart';

part 'modifier_model.freezed.dart';

part 'modifier_model.g.dart';

@freezed
class ModifierModel with _$ModifierModel {
  factory ModifierModel({
    required String guid,
    required String name,
    String? description,
    String? ed_izm,
    String? gguid,
    String? kat_tov,
    String? kod_tov,
    String? linkfoto,
    String? barcode,
    String? barcode_grupp,
    @Default(0) int price_o_r,
    @Default(0) int price_o_o,
    String? kname,
    String? adg,
    int? priznak_sk,
    int? komplekt_id,
    @Default(false) bool? top,
    @Default(1) int count,
  }) = _ModifierModel;

  factory ModifierModel.fromJson(Map<String, dynamic> json) =>
      _$ModifierModelFromJson(json);
}
