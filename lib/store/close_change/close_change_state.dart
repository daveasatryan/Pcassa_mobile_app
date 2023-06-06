import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/popups/answer_dialog.dart';
import 'package:pcassa_retail_mobile/router.gr.dart';
import 'package:pcassa_retail_mobile/services.dart';
import 'package:pcassa_retail_mobile/utils/error_handler.dart';

part 'close_change_state.g.dart';

class CloseChangestate = CloseChangestateBase with _$CloseChangestate;

abstract class CloseChangestateBase with Store {
  @action
  Future closeChangeGet({
    required int n_smena,
    required BuildContext context,
  }) async {
    final res = await ServicesRepository.closeChangeGet();

    //final res = await ServicesRepository.closeChange(n_smena: "$n_smena");

    if (res["status"] == "1") {
      await router.pop();
      print("status: 1");
      show(context: context, text: "you_have_open_check?");
    } else if (res["status"] == "0") {
      print("0");
     await closeChange(n_smena: n_smena, context: context);
      await router.push(
        SplashRoute(),
      );
    } else {
      UiUtils.errorModal(context: context, errorCode: "Something is wrong");
    }
  }

  @action
  Future closeChange({
    required int n_smena,
    required BuildContext context,
  }) async {
    final res = await ServicesRepository.closeChange(n_smena: "$n_smena");
    if (res == true) {
      await router.push(
        SplashRoute(),
      );
    } else {
      UiUtils.errorModal(context: context, errorCode: "Something is wrong");
    }
  }
    @action
  Future closeChange1({
    required int n_smena,
    required BuildContext context,
  }) async {
    final res = await ServicesRepository.closeChange1(n_smena: "$n_smena");
    if (res == true) {
      await router.push(
        SplashRoute(),
      );
    } else {
      UiUtils.errorModal(context: context, errorCode: "Something is wrong");
    }
  }
}
