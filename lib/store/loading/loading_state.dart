import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/router.gr.dart';
import 'package:pcassa_retail_mobile/screens/license_add_screen/license_add_screen.dart';
import 'package:pcassa_retail_mobile/services.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';
import 'package:pcassa_retail_mobile/utils/error_handler.dart';

part 'loading_state.g.dart';

class LoadingState = LoadingStateBase with _$LoadingState;

abstract class LoadingStateBase with Store {
  @observable
  bool isLoading = false;
  final authState = GetIt.I<AuthState>();
  @action
  void startLoading() {
    isLoading = true;
  }

    Future<void> afterFirstLayout(BuildContext context) async {
    try {
      final result = await ServicesRepository.getInfo();
      authState.info = result;
      await Future.delayed(const Duration(seconds: 1));
      await router.pushAndPopUntil(
        const SignInRoute(),
        predicate: (_) => false,
      );
    } on DioError {
      await UiUtils.errorModal(
        context: context,
        errorCode: 'errors.any',
      );
    } finally {
      loadingState.stopLoading();
    }
  }

  @action
  void stopLoading() {
    isLoading = false;
  }
}
