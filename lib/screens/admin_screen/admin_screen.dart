import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/popups/answer_dialog.dart';
import 'package:pcassa_retail_mobile/screens/admin_screen/all_change.dart';
import 'package:pcassa_retail_mobile/screens/admin_screen/all_revenue.dart';
import 'package:pcassa_retail_mobile/screens/admin_screen/balance_casa.dart';
import 'package:pcassa_retail_mobile/screens/admin_screen/remaining_tradeable.dart';
import 'package:pcassa_retail_mobile/services.dart';
import 'package:pcassa_retail_mobile/store/All_change/all_change_state.dart';
import 'package:pcassa_retail_mobile/store/RemaindingTradeable/remainding_tradeable.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';
import 'package:pcassa_retail_mobile/store/balance_casa/balance_casa_state.dart';
import 'package:pcassa_retail_mobile/store/close_change/close_change_state.dart';
import 'package:pcassa_retail_mobile/store/valets_state/valets_state.dart';

import '../../popups/reports_modal.dart';
import '../../themes/app_colors.dart';
import '../../widgets/custom_button.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key}) : super(key: key);
  final authState = GetIt.I<AuthState>();
  final allChangeState = AllChangeState();
  final balanceCasaState = BalanceCasaState();

  final closeChangestate = CloseChangestate();
  final valetsState = ValetsState();

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'shift'.tr(namedArgs: {'number': '${authState.info!.n_smena}'}),
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: darkModeOn ? AppColors.white : AppColors.darkGray),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 300,
                height: 80,
                child: CustomButton(
                  backgroundColor:
                      darkModeOn == false ? AppColors.purple : AppColors.purple,
                  onTap: () {
                    show(
                      context: context,
                      text: "want_to_close_the_shift",
                    );
                  },
                  minimumSize: const Size(100, 10),

                  // backgroundColor: AppColors.,
                  child: Text(
                    'closingTheGeneralShift'.tr(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color:
                            darkModeOn ? AppColors.white : AppColors.darkGray,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("reports".tr(),
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      color:
                          darkModeOn ? AppColors.white : AppColors.darkGray)),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: CustomButton(
                hasBorderRadius: false,
                backgroundColor:
                    darkModeOn == false ? AppColors.mediumGray : Colors.black26,
                onTap: () async {
                  await allChangeState.getDataAll();
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllChange(
                        item: allChangeState.quick_check,
                        summa: allChangeState.summa),
                  ));
                  // onShowReportsModal(
                  //   context: context,
                  //   title: 'closingTheGeneralShift'.tr(),
                  // );
                },
                minimumSize: const Size(100, 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 24,
                ),
                child:
                    //  FittedBox(
                    //   child:
                    Text(
                  'ProductsSold'.tr(),
                  style: TextStyle(
                    color: darkModeOn ? AppColors.white : AppColors.darkGray,
                    fontSize: 16,
                  ), //Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // ),
            const SizedBox(height: 10),

            SizedBox(
              height: 70,
              width: width,
              child: CustomButton(
                hasBorderRadius: false,
                backgroundColor:
                    darkModeOn == false ? AppColors.mediumGray : Colors.black26,
                onTap: () async {
                  await valetsState.getValets();
                  print(valetsState.valetsList);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllRevenue(
                      nameValets: valetsState.valetsList,
                      sumValets: valetsState.sumList,
                    ),
                  ));
                  // onShowReportsModal(
                  //   context: context,
                  //   title: 'closingTheGeneralShift'.tr(),
                  // );
                },
                minimumSize: const Size(100, 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 24,
                ),
                child: Text(
                  'TotalRevenues'.tr(),
                  style: TextStyle(
                    color: darkModeOn ? AppColors.white : AppColors.darkGray,
                    fontSize: 16,
                  ), //Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: width,
              height: 70,
              child: CustomButton(
                hasBorderRadius: false,
                backgroundColor:
                    darkModeOn == false ? AppColors.mediumGray : Colors.black26,
                onTap: () async {
                  await balanceCasaState.getDataAll();
                  print(balanceCasaState.balanceList);
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BalanceCasa(
                      amount: balanceCasaState.amount,
                      inkasList: balanceCasaState.inkasList,
                      inkassAmount: balanceCasaState.inkassAmount,
                      sale: balanceCasaState.sale,
                      vnesAmount: balanceCasaState.vnesAmount,
                      vnesList: balanceCasaState.vnesList,
                    ),
                  ));
                  // onShowReportsModal(
                  //   context: context,
                  //   title: 'closingTheGeneralShift'.tr(),
                  // );
                },
                minimumSize: const Size(100, 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 24,
                ),
                child: Text(
                  'BalanceSheet'.tr(),
                  style: TextStyle(
                    color: darkModeOn ? AppColors.white : AppColors.darkGray,
                    fontSize: 16,
                  ), //Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              width: width,
              child: CustomButton(
                hasBorderRadius: false,
                backgroundColor:
                    darkModeOn == false ? AppColors.mediumGray : Colors.black26,
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RemainingTradeable(),
                  ));
                  // onShowReportsModal(
                  //   context: context,
                  //   title: 'closingTheGeneralShift'.tr(),
                  // );
                },
                minimumSize: const Size(100, 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 24,
                ),
                child: Text(
                  'remaining_Tradeable'.tr(),
                  style: TextStyle(
                    color: darkModeOn ? AppColors.white : AppColors.darkGray,
                    fontSize: 16,
                  ), //Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
