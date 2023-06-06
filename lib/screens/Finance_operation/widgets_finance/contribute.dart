import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/widgets/custom_button.dart';

import '../../../store/Finance_operation/finance_operation_state.dart';

class Contribute extends StatefulWidget {
  Contribute({super.key});

  @override
  State<Contribute> createState() => _ContributeState();
}

class _ContributeState extends State<Contribute>
    with SingleTickerProviderStateMixin {
  final sumController = TextEditingController();

  final descriptionController = TextEditingController();

  final finance_operation_state = Finance_operation_state();

  final authState = GetIt.I<AuthState>();

  bool errorColor = false;
  String sumHintText = "sum".tr();

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  errorColor = false;
                });
              } else {
                setState(() {
                  errorColor = true;
                });
              }
            },
            controller: sumController,
            //onChanged: (value) {}
            keyboardType: TextInputType.number,
            //controller: controllerText,
            decoration: InputDecoration(
              filled: true, //<-- SEE HERE
              fillColor:
                  darkModeOn == false ? AppColors.white : AppColors.darkGray,
              hintText: "sum".tr(),
              hintStyle: TextStyle(
                  color: darkModeOn ? AppColors.white : Colors.black26),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: errorColor == false
                        ? darkModeOn == false
                            ? AppColors.primaryColor
                            : AppColors.purple
                        : AppColors.red),
                borderRadius: BorderRadius.circular(4.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: errorColor == false
                        ? darkModeOn == false
                            ? AppColors.mediumGray
                            : AppColors.white
                        : AppColors.red),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: descriptionController,
            //onChanged: (value) {}
            keyboardType: TextInputType.text,
            //controller: controllerText,
            decoration: InputDecoration(
              filled: true, //<-- SEE HERE
              fillColor:
                  darkModeOn == false ? AppColors.white : AppColors.darkGray,
              hintText: "cause".tr(),
              hintStyle: TextStyle(
                  color: darkModeOn ? AppColors.white : Colors.black26),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.2,
                    color: darkModeOn == false
                        ? AppColors.primaryColor
                        : AppColors.purple),
                borderRadius: BorderRadius.circular(4.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.9,
                    color: darkModeOn == false
                        ? AppColors.mediumGray
                        : AppColors.white),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          //search

          CustomButton(
            backgroundColor:
                darkModeOn == false ? AppColors.mediumGray : Colors.black26,
            minimumSize: const Size(double.infinity, 60),
            //backgroundColor: AppColors.primaryColor,
            //overlayColor: AppColors.darkPurple,
            onTap: () async {
              if (sumController.text.isNotEmpty) {
                final amount = double.parse(sumController.text);
                await finance_operation_state.sendFinanceOperation(
                    authState.info!.n_smena,
                    amount,
                    descriptionController.text,
                    1,
                    context);
                setState(() {
                  errorColor = false;
                });
              } else {
                setState(() {
                  sumHintText = "requiredfiled".tr();
                  errorColor = true;
                });
              }
            },
            child: Text(
              "contributed".tr(),
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: darkModeOn ? AppColors.white : AppColors.darkGray),
            ),
          ),
        ],
      ),
    );
  }
}
