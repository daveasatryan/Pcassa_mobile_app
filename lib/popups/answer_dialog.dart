import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/router.gr.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';
import 'package:pcassa_retail_mobile/store/close_change/close_change_state.dart';

import '../services.dart';
import '../themes/app_colors.dart';
import '../widgets/custom_button.dart';
import 'widgets/modal_header.dart';

void show({
  required BuildContext context,
  required String text,
}) {
  final authState = GetIt.I<AuthState>();
  final closeChangestate = CloseChangestate();
  logOut() async {
    await router.push(
      SplashRoute(),
    );
  }



  closeShrift1() async {
    await closeChangestate.closeChange1(
        n_smena: authState.info!.n_smena, context: context);
    // logOut();
    print("closeChangeGet");
    router.pop();
  }

  closeShriftgGet() async {
    await closeChangestate.closeChangeGet(
        n_smena: authState.info!.n_smena, context: context);
    // logOut();
    print("closeChangeGet");

    // router.pop();
  }

  showDialog(
    context: context,
    builder: (context) {
      bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
      return AlertDialog(
        backgroundColor:
            darkModeOn == false ? AppColors.white : AppColors.darkGray,
        elevation: 0,
        title: Text(
          "$text".tr(),
          style: const TextStyle(color: AppColors.purple, fontSize: 14),
        ),
        content: Row(children: [
          TextButton(
            onPressed: text == "you_have_open_check?"
                ? () async {
                    await closeShrift1();
                  }
                : text == "want_to_close_the_shift"
                    ? ()async{
                      await closeShriftgGet();
                    }
                    : text == "want_to_log_out"
                        ? logOut
                        : null,
            child: Text(
              "yes".tr(),
              style: TextStyle(
                color:
                    darkModeOn == true ? AppColors.white : AppColors.darkGray,
              ),
            ),
          ),
          TextButton(
            onPressed:
                text == "you_have_open_check?" ? closeShrift1 : router.pop,
            child: Text(
              "no".tr(),
              style: TextStyle(
                color:
                    darkModeOn == true ? AppColors.white : AppColors.darkGray,
              ),
            ),
          )
        ]),
      );
    },
  );
}
