import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_info_model.freezed.dart';
part 'order_info_model.g.dart';

@freezed
class OrderInfoModel with _$OrderInfoModel {
  factory OrderInfoModel({
    required int cashid,
    @Default('0') String orderid,
    String? waiter_name,
    DateTime? created_at,
    @Default(0) int saleprice,
    @Default(0) int? paidamount,
    @Default(0) int? paidamountcard,
    @Default(0) int? deptamount,
  }) = _OrderInfoModel;

  const OrderInfoModel._();

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoModelFromJson(json);
}
