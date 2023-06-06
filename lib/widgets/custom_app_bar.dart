import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';
import 'package:pcassa_retail_mobile/store/dashboard_state/dashboard_state.dart';
import 'package:pcassa_retail_mobile/widgets/app_icons.dart';

import '../constants/custom_icons.dart';
import '../http/repositories/services_repository.dart';
import '../popups/top_products_modal.dart';
import '../router.gr.dart';
import '../services.dart';
import '../store/basket_state/basket_state.dart';
import '../themes/app_colors.dart';
import 'header_content.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, this.title, this.orderId, this.pageCounter})
      : super(key: key);

  final String? title;
  int? orderId;
  int? pageCounter;

  static bool isPuprle = false;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final basketState = GetIt.I<BasketState>();
  final authState = GetIt.I<AuthState>();
  final dashboardState = DashboardState();
  static int defaultLangNum = 0;
  static List<Locale> langeList = [
    Locale('hy'),
    Locale('ru'),
    Locale('en'),
  ];
  static Map<String, int> language = {
    'hy': 0,
    'ru': 1,
    'en': 2,
  };
  List<SvgPicture> langImageList = [
    SvgPicture.asset('assets/languages/am.svg', height: 20, width: 20),
    SvgPicture.asset('assets/languages/rus.svg', height: 20, width: 20),
    SvgPicture.asset('assets/languages/us.svg', height: 20, width: 20),
  ];

  void show({required BuildContext context, bool? shouldPop}) {
    showDialog(
      context: context,
      builder: (context) {
        bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
        return AlertDialog(
          backgroundColor:
              darkModeOn == false ? AppColors.white : AppColors.darkGray,
          elevation: 0,
          title: Text(
            "want_to_close_this_screen".tr(),
            style: const TextStyle(color: AppColors.purple, fontSize: 14),
          ),
          content: Row(children: [
            TextButton(
              onPressed: () async {
                setState(() {
                  shouldPop = true;
                });

                await ServicesRepository.deleteBasketOrders(
                    orderId: widget.orderId!);

                await router.pushAndPopUntil(
                  const DashboardRoute(),
                  predicate: (_) => false,
                );

                print(shouldPop);

                //print(shouldPop);
              },
              child: Text(
                "yes".tr(),
                style: TextStyle(
                  color:
                      darkModeOn == true ? AppColors.white : AppColors.darkGray,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                router.pop();
              },
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

  onLogOut() async {
    show(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool shouldPop = false;
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async {
        if (widget.pageCounter == 0 && basketState.order!.basket.length == 0) {
          shouldPop = false;
          show(context: context, shouldPop: shouldPop);
        } else {
          shouldPop = true;
        }

        return shouldPop;
      },
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          iconSize: 28,
          icon: AppIcons(
            icon: Icons.arrow_back_ios_new_rounded,
            iconColor: darkModeOn ? AppColors.white : AppColors.darkGray,
            size: 28,
          ),
          onPressed: () {
            if (widget.pageCounter == 0 &&
                basketState.order!.basket.length == 0) {
              show(context: context, shouldPop: shouldPop);
            } else {
              router.pop();
            }
          },
        ),
        title: Text(
          widget.title ?? '',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: darkModeOn ? AppColors.white : AppColors.darkGray),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: DropdownButton(
                elevation: 0,
                underline: Container(color: Colors.transparent),
                //focusColor: Color.fromARGB(125, 223, 222, 222),
                items: langImageList.map((e) {
                  return DropdownMenuItem(
                    child: e,
                    value: langImageList.indexOf(e),
                  );
                }).toList(),
                icon: Icon(
                  Icons.language,
                  size: 24,
                  color: darkModeOn == false
                      ? AppColors.lightGray
                      : AppColors.white,
                ),
                onChanged: (value) async {
                  defaultLangNum = value as int;
                  await dashboardState.changeLanguage(authState.currentUser!.id,
                      "${langeList[value as int]}", 'casa');
                  defaultLangNum = language[authState.language]!;

                  EasyLocalization.of(context)!
                      .setLocale(langeList[defaultLangNum]);
                  // EasyLocalization.of(context)!
                  //     .setLocale(langeList[value as int]);

                  //context.setLocale(Locale('en'));
                  //print(context.locale);
                }),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    bool darkModeOn =
                        MyUtility(context).brightness == Brightness.dark;
                    return AlertDialog(
                      backgroundColor: darkModeOn == false
                          ? AppColors.white
                          : AppColors.darkGray,
                      elevation: 0,
                      title: Text(
                        "want_to_close_this_screen".tr(),
                        style: const TextStyle(
                            color: AppColors.purple, fontSize: 14),
                      ),
                      content: Row(children: [
                        TextButton(
                          onPressed: () async {
                            setState(() {
                              shouldPop = true;
                            });
                            await ServicesRepository.deleteBasketOrders(
                                orderId: widget.orderId!);
                            exit(0);
                            //print(shouldPop);
                          },
                          child: Text(
                            "yes".tr(),
                            style: TextStyle(
                              color: darkModeOn == true
                                  ? AppColors.white
                                  : AppColors.darkGray,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            router.pop();
                          },
                          child: Text(
                            "no".tr(),
                            style: TextStyle(
                              color: darkModeOn == true
                                  ? AppColors.white
                                  : AppColors.darkGray,
                            ),
                          ),
                        )
                      ]),
                    );
                  },
                );
              },
              icon: AppIcons(
                  icon: Icons.exit_to_app_rounded,
                  size: 24,
                  iconColor: darkModeOn == false
                      ? AppColors.lightGray
                      : AppColors.white))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
