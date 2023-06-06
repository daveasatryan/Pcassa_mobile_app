import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail_mobile/models/currency_model/currency_items.dart';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

@freezed
class CurrencyModel with _$CurrencyModel {
  factory CurrencyModel({
    double? saleprice,
    double? paid,
    List<CurrencyItemsModel>? items,
  }) = _CurrencyModel;

  const CurrencyModel._();

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
}
