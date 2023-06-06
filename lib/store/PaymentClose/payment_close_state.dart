import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/models/payment_close_order_model/close_payment_model.dart';
import 'package:pcassa_retail_mobile/router.gr.dart';
import 'package:pcassa_retail_mobile/services.dart';
import 'package:pcassa_retail_mobile/utils/error_handler.dart';

part 'payment_close_state.g.dart';

class Payment_close_state = Payment_close_stateBase with _$Payment_close_state;

abstract class Payment_close_stateBase with Store {
  @observable
  List<ClosePaymentModel> closeOrderList = [];

  @action
  Future paymentClose({
    required String waiter_name,
    required String order_by,
  }) async {
    final res = await ServicesRepository.paymentClose(
        waiter_name: waiter_name, order_by: order_by);
    closeOrderList = res;
    // print(object)
  }
}
