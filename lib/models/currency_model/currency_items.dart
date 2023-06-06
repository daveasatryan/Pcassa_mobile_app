import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_items.freezed.dart';
part 'currency_items.g.dart';

@freezed
class CurrencyItemsModel with _$CurrencyItemsModel {
  factory CurrencyItemsModel({
    required int cod,
    required String name,
    @Default(false) bool b_valyuta,
    String? linkfoto,
    @Default(0) int tip,
  }) = _CurrencyItemsModel;

  const CurrencyItemsModel._();

  factory CurrencyItemsModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyItemsModelFromJson(json);
}
