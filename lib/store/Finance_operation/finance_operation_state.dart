import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/models/spr_model/spr_model.dart';
import 'package:pcassa_retail_mobile/utils/error_handler.dart';

part 'finance_operation_state.g.dart';

class Finance_operation_state = Finance_operation_stateBase
    with _$Finance_operation_state;

abstract class Finance_operation_stateBase with Store {
  @observable
  ObservableList<SprModel> sprList = ObservableList<SprModel>();
  @action
  Future<void> getSPRData() async {
    try {
      final res = await ServicesRepository.getSpravshik();
      sprList = res.asObservable();
      print(res);
    } catch (e) {
      print("error finance state");
    }
  }

  @action
  Future sendFinanceOperation(
    int n_smena,
    double amount,
    String description,
    int tip,
    BuildContext context, [
    String? name,
    String? dateNow,
    int? suma,
    int? kod,
  ]) async {
    final res = await ServicesRepository.sendFinanceOperationRequest(
        n_smena: n_smena, amount: amount, description: description, tip: tip);

    if (kod != null) {
      print(name);
      print(kod);

      final resSPR = await ServicesRepository.sendSPR(
          dateNow: dateNow!, kod: kod, name: name!, suma: suma!);
    }

    if (res == true) {
      UiUtils.errorModal(context: context, errorCode: "operationsucceeded");
    } else if (res == "amount does not exist") {
      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeh");
    } else {
      UiUtils.errorModal(context: context, errorCode: "Something is wrong");
    }
  }

  @action
  Future<bool> sentSPRData({
    required int kod,
    required String name,
    required String dateNow,
    required int suma,
    required BuildContext context,
  }) async {
    final res = await ServicesRepository.sendSPR(
        dateNow: dateNow, kod: kod, name: name, suma: suma);
    print(res);
    if (res.data["id"] != 0) {
      return true;
    } else {
      AppSettings.toast(text: "error".tr());
      return false;
    }
  }
}
