import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/constants/custom_icons.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/popups/answer_dialog.dart';
import 'package:pcassa_retail_mobile/screens/Finance_operation/finance_operation.dart';
import 'package:pcassa_retail_mobile/screens/admin_screen/admin_screen.dart';
import 'package:pcassa_retail_mobile/store/Finance_operation/finance_operation_state.dart';
import 'package:pcassa_retail_mobile/store/PaymentClose/payment_close_state.dart';
import 'package:pcassa_retail_mobile/store/dashboard_state/dashboard_state.dart';
import 'package:pcassa_retail_mobile/widgets/app_icons.dart';
import 'package:pcassa_retail_mobile/widgets/custom_app_bar.dart';
import '../../constants/order_page_types.dart';
import '../../models/order_info_model/order_info_model.dart';
import '../../models/order_model/order_model.dart';
import '../../router.gr.dart';
import '../../services.dart';
import '../../store/auth/auth_state.dart';
import '../../store/basket_state/basket_state.dart';
import '../../store/loading/loading_state.dart';
import '../../store/payment_state/payment_state.dart';
import '../../store/services_state/services_state.dart';
import '../../store/tables_state/tables_state.dart';
import '../../themes/app_colors.dart';
import '../../utils/error_handler.dart';
import '../application_screen/application_screen.dart';
import '../home_screen/home_screen.dart';
import '../payed_orders_screen/payed_orders_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final loadingState = LoadingState();
  final servicesState = GetIt.I<ServicesState>();
  final tablesState = GetIt.I<TablesState>();
  final paymentState = GetIt.I<PaymentState>();
  final basketState = GetIt.I<BasketState>();
  final authState = GetIt.I<AuthState>();
  final dashboardState = DashboardState();
  final finance_operation_state = Finance_operation_state();
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    loadingState.startLoading();
    pageController = PageController(
      initialPage: dashboardState.selectedTab,
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => afterFirstLayout(context),
    );
  }

  Future<void> afterFirstLayout(BuildContext context) async {
    try {
      defaultLangNum = language[authState.language]!;

      EasyLocalization.of(context)!.setLocale(langeList[defaultLangNum]);
      // await servicesState.getMenu();
      await servicesState.getDiscount();
      // await paymentState.getCurrencies();

      servicesState.categoriesFirstLevel
          .addAll(servicesState.categories.where((e) => e.isroot == 0));

      if (tablesState.tableGroups.isNotEmpty) {
        tablesState.selectedTableGroupId = tablesState.tableGroups.first.id;
      }

      if (servicesState.categories.isNotEmpty) {
        servicesState
          ..selectedMainCategoryId = servicesState.categories.first.guid
          ..onFilterCategory(servicesState.categories.first);
      }
    } catch (e) {
      await UiUtils.errorModal(
        context: context,
        errorCode: 'errors.any',
      );
    } finally {
      loadingState.stopLoading();
    }
  }

  Future<void> onCreateOrder() async {
    try {
      loadingState.startLoading();
      final createdOrder = OrderModel(
        orderinfo: OrderInfoModel(
          cashid: 1,
          waiter_name: authState.currentUser?.fio ?? '',
        ),
      );
      final order = await basketState.createOrder(createdOrder: createdOrder);

      await router.push(
        OrderRoute(
          order: order,
          orderPageType: OrderPageType.quickOrder,
          basket: [],
          onShowPayment: () {},
        ),
      );
    } catch (e) {
      await UiUtils.errorModal(
        context: context,
        errorCode: 'errors.any',
      );
    } finally {
      loadingState.stopLoading();
    }
  }

  Future<void> onLogOut() async {
    show(
      context: context,
      text: "want_to_log_out",
    );
  }

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
  static int defaultLangNum = 0;
  List<SvgPicture> langImageList = [
    SvgPicture.asset('assets/languages/am.svg', height: 20, width: 20),
    SvgPicture.asset('assets/languages/rus.svg', height: 20, width: 20),
    SvgPicture.asset('assets/languages/us.svg', height: 20, width: 20),
  ];
  bool shouldPop = true;
  bool shouldnt = false;
  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async {
        if (dashboardState.selectedTab != 5) {
          shouldPop = false;

          pageController.jumpToPage(1);
        } else {
          shouldPop = true;
          await showDialog<bool>(
            context: context,
            builder: (context) {
              bool darkModeOn =
                  MyUtility(context).brightness == Brightness.dark;
              return AlertDialog(
                backgroundColor:
                    darkModeOn == false ? AppColors.white : AppColors.darkGray,
                elevation: 0,
                title: Text(
                  "close_the_app".tr(),
                  style: const TextStyle(color: AppColors.purple, fontSize: 14),
                ),
                content: Row(children: [
                  TextButton(
                    onPressed: () {
                      exit(0);
                      //  Navigator.pop(context, true);
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
                      shouldPop = false;
                      Navigator.pop(context, false);
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
        }
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: 120,
          leading: Text(""),
          title: Text(
            authState.currentUser!.fio,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          centerTitle: true,
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
                    await dashboardState.changeLanguage(
                        authState.currentUser!.id,
                        "${langeList[value as int]}",
                        'casa');
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
                  onLogOut();
                },
                icon: AppIcons(
                    icon: Icons.exit_to_app_rounded,
                    size: 24,
                    iconColor: darkModeOn == false
                        ? AppColors.lightGray
                        : AppColors.white))
          ],
        ),
        body: Stack(
          children: [
            PageView(
              onPageChanged: (i) {
                dashboardState.selectedTab = i;
              },
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                PayedOrdersScreen(),
                HomeScreen(),
                Finance_operation(),
                AdminScreen(),
              ],
            ),
          ],
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.all(4),
        //   child: Stack(
        //     children: [
        //       Observer(
        //         builder: (_) => FloatingActionButton(
        //           splashColor: Colors.transparent,
        //           backgroundColor: dashboardState.selectedTab == 1
        //               ? darkModeOn == false
        //                   ? AppColors.primaryColor
        //                   : AppColors.purple
        //               : AppColors.gray,
        //           onPressed: () {
        //             pageController.jumpToPage(1);
        //           },
        //           child: const Icon(
        //             Icons.home,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: darkModeOn ? AppColors.darkGray : AppColors.mediumGray,
          height: 83,
          // shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          child: Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      pageController.jumpToPage(0);
                    },
                    icon: AppIcons(
                      icon: Icons.description,
                      size: 36,
                      iconColor: dashboardState.selectedTab == 0
                          ? darkModeOn == false
                              ? AppColors.lightGray
                              : AppColors.white
                          : darkModeOn
                              ? AppColors.lightGray
                              : AppColors.white,
                    )),
                IconButton(
                    onPressed: () {
                      print(MediaQuery.of(context).size.width.toString());
                      print(MediaQuery.of(context).size.height.toString());
                      pageController.jumpToPage(1);
                    },
                    icon: AppIcons(
                      icon: Icons.home_rounded,
                      size: 36,
                      iconColor: dashboardState.selectedTab == 1
                          ? darkModeOn == false
                              ? AppColors.lightGray
                              : AppColors.white
                          : darkModeOn
                              ? AppColors.lightGray
                              : AppColors.white,
                    )),
                IconButton(
                    onPressed: () {
                      pageController.jumpToPage(2);
                    },
                    icon: AppIcons(
                      icon: Icons.monetization_on_rounded,
                      size: 36,
                      iconColor: dashboardState.selectedTab == 2
                          ? darkModeOn == false
                              ? AppColors.lightGray
                              : AppColors.white
                          : darkModeOn
                              ? AppColors.lightGray
                              : AppColors.white,
                    )),
                IconButton(
                    onPressed: () {
                      pageController.jumpToPage(3);
                    },
                    icon: AppIcons(
                      icon: Icons.change_circle,
                      size: 36,
                      iconColor: dashboardState.selectedTab == 3
                          ? darkModeOn == false
                              ? AppColors.lightGray
                              : AppColors.white
                          : darkModeOn
                              ? AppColors.lightGray
                              : AppColors.white,
                    )),
                //              IconButton(
                //                splashColor: Colors.transparent,
                //                highlightColor: Colors.transparent,
                //                color: iconColor(1),
                //                onPressed: () {
                //                  pageController.jumpToPage(1);
                //                },
                //                icon: const Icon(Icons.add),
                //              ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onTap({
    required OrderPageType orderType,
  }) async {
    if (orderType == OrderPageType.quickOrder) {
      await onCreateOrder();
    } else {
      await router.push(
        TablesRoute(
          orderPageType: orderType,
          editedOrders: [],
        ),
      );
    }
  }

  Color iconColor(int i) {
    return i == dashboardState.selectedTab
        ? AppColors.primaryColor
        : AppColors.gray;
  }
}
