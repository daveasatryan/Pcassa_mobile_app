import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/screens/Finance_operation/widgets_finance/collection.dart';
import 'package:pcassa_retail_mobile/screens/Finance_operation/widgets_finance/contribute.dart';
import 'package:pcassa_retail_mobile/store/Finance_operation/finance_operation_state.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/widgets/custom_button.dart';

class Finance_operation extends StatefulWidget {
  const Finance_operation({super.key});

  @override
  State<Finance_operation> createState() => _Finance_operationState();
}

class _Finance_operationState extends State<Finance_operation> {
  final PageController _pgController =
      PageController(initialPage: 0, keepPage: true);

  // List pageContent = [
  //   Collaction(),
  //   Contribute(),
  // ];

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        primary: true,
        body: ListView(
          children: [
            TabBar(
                unselectedLabelColor: AppColors.purple,
                // overlayColor: AppColors.purple,
                labelColor:
                    darkModeOn == false ? AppColors.purple : AppColors.white,
                indicatorColor:darkModeOn? AppColors.white:AppColors.darkGray,
                tabs: [
                  Tab(
                    child: FittedBox(
                      child: Text(
                        "collection".tr(),
                        style: TextStyle(
                            color: darkModeOn == false
                                ? AppColors.darkGray
                                : AppColors.white,
                            fontSize: 20),
                      ),
                    ),
                    // onTap: () => animated(0, _pgController, 500),
                  ),
                  Tab(
                    child: Text(
                      "contributed".tr(),
                      style: TextStyle(
                          color: darkModeOn == false
                              ? AppColors.darkGray
                              : AppColors.white,
                          fontSize: 20),
                    ),
                  ),
                  // onTap: () => animated(1, _pgController, 500),
                ]),
            SizedBox(
              height: 50,
            ),
            Container(
              height: MyUtility(context).height - 200,
              child: TabBarView(children: [
                Collaction(),
                Contribute(),
              ]),
            ),
          ],
          // padding: const EdgeInsets.only(left: 16, right: 16),
          // width: width,
          // height: height,
          // //color: Colors.amberAccent,
          // child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: CustomButton(
          //         minimumSize: const Size(80, 30),
          //         backgroundColor: AppColors.darkPurple,
          //         overlayColor: Colors.transparent,
          //         child: FittedBox(
          //           child: Text(
          //             "collection".tr(),
          //             style: Theme.of(context).textTheme.headline1,
          //           ),
          //         ),
          //         onTap: () => animated(0, _pgController, 500),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 5,
          //     ),
          //     Expanded(
          //       child: CustomButton(
          //         minimumSize: const Size(80, 30),
          //         backgroundColor: AppColors.darkPurple,
          //         overlayColor: Colors.transparent,
          //         child: FittedBox(
          //           child: Text(
          //             "contributed".tr(),
          //             style: Theme.of(context).textTheme.headline1,
          //           ),
          //         ),
          //         onTap: () => animated(1, _pgController, 500),
          //       ),
          //     ),
          //   ],
          // ),

          // Stack(
          //   children: [
          //     Container(
          //       alignment: Alignment.center,
          //       height: height / 2,
          //       width: width,
          //       child: PageView.builder(
          //         controller: _pgController,
          //         itemCount: pageContent.length,
          //         itemBuilder: (context, pageViewIndex) {
          //           return pageContent[pageViewIndex];
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }

  void animated(int index, PageController _controller, int duration) {
    setState(() {
      _controller.animateToPage(
        index,
        duration: Duration(milliseconds: duration),
        curve: Curves.easeIn,
      );
    });
  }
}
