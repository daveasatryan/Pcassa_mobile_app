import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail_mobile/models/payment_close_order_model/close_payment_items_model.dart';

part 'close_payment_model.freezed.dart';
part 'close_payment_model.g.dart';

@freezed
class ClosePaymentModel with _$ClosePaymentModel {
  factory ClosePaymentModel({
    required int group_id,
    required int orderid,
    required String chequenumber,
    required String waiter_name,
    required String created_at,
    required String paymentdate,
    required int saleprice,
    List<ClosePaymentItemsModel>? items,
  }) = _ClosePaymentModel;

  const ClosePaymentModel._();

  factory ClosePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$ClosePaymentModelFromJson(json);
}
