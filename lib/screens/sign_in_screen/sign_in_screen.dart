import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/constants/custom_icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../router.gr.dart';
import '../../services.dart';
import '../../store/auth/auth_state.dart';
import '../../store/loading/loading_state.dart';
import '../../store/sign_in_state/sign_in_state.dart';
import '../../themes/app_colors.dart';
import '../../widgets/loading_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final loadingState = LoadingState();
  final signInState = SignInState();
  final controller = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  @override
  void dispose() {
    ///TODO check dispose
    // controller.dispose();
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 48, horizontal: 92),
                    child: Image(
                      width: 150,
                      image: AssetImage(darkModeOn == false
                          ? CustomIcons.iconLogo
                          : CustomIcons.logo_for_dark),
                    )
                    // ExtendedImage.network(
                    //   GetIt.I<AuthState>().info!.logo,
                    // ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 72,
                    bottom: 12,
                    right: 72,
                  ),
                  child: Material(
                    child: PinCodeTextField(
                      controller: controller,
                      cursorColor: darkModeOn == false
                          ? AppColors.darkPurple
                          : AppColors.darkGray,
                      keyboardType: TextInputType.number,
                      appContext: context,
                      length: 4,
                      obscureText: true,
                      autoFocus: true,
                      animationType: AnimationType.fade,
                      errorAnimationController: errorController,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: AppColors.white,
                        inactiveColor: darkModeOn == false
                            ? AppColors.darkPurple
                            : AppColors.darkGray,
                        inactiveFillColor: darkModeOn == false
                            ? AppColors.white
                            : AppColors.mediumGray,
                        selectedFillColor: AppColors.white,
                        selectedColor: darkModeOn == false
                            ? AppColors.darkPurple
                            : AppColors.darkGray,
                      ),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      textStyle: TextStyle(
                        color: darkModeOn == false
                            ? AppColors.darkPurple
                            : AppColors.darkGray,
                      ),
                      onCompleted: (_) {
                        onSignIn();
                      },
                      onChanged: (String value) {
                        signInState.code = value;
                      },
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.clear();
                    signInState.code = '';
                  },
                  child: Text(
                    'clear'.tr(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: darkModeOn == false
                              ? AppColors.darkPurple
                              : AppColors.white,
                        ),
                  ),
                ),
              ],
            ),
            Observer(
              builder: (_) => loadingState.isLoading
                  ? const LoadingWidget()
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSignIn() async {
    try {
      loadingState.startLoading();

      await signInState.signIn();
      controller.clear();
      signInState.code = '';
      await router.push(const DashboardRoute());
    } catch (e) {
      errorController.add(ErrorAnimationType.shake);
      controller.clear();
      signInState.code = '';
    } finally {
      loadingState.stopLoading();
    }
  }
}
