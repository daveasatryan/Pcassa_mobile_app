import 'package:freezed_annotation/freezed_annotation.dart';

part 'close_payment_items_model.freezed.dart';
part 'close_payment_items_model.g.dart';

@freezed
class ClosePaymentItemsModel with _$ClosePaymentItemsModel {
  factory ClosePaymentItemsModel({
    int? id,
    String? productcode,
    String? productname,
    int? quantity,
    int? saleprice,
    int? realprice,
    int? flag,
  }) = _ClosePaymentItemsModel;

  const ClosePaymentItemsModel._();

  factory ClosePaymentItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ClosePaymentItemsModelFromJson(json);
}
