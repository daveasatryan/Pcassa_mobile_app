import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/popups/stop_list.dart';
import 'package:pcassa_retail_mobile/screens/order_screen/order_screen.dart';
import 'package:pcassa_retail_mobile/widgets/app_icons.dart';

import '../../../constants/custom_icons.dart';
import '../../../popups/discount_modal.dart';
import '../../../popups/order_selected_settings_modal.dart';
import '../../../popups/order_settings_modal.dart';
import '../../../popups/search_modal.dart';
import '../../../popups/top_products_modal.dart';
import '../../../store/basket_state/basket_state.dart';
import '../../../store/services_state/services_state.dart';
import '../../../store/stop_list_state/stop_list_state.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/custom_button.dart';

class ActionsPart extends StatefulWidget {
  ActionsPart({
    Key? key,
    required this.textController,
    required this.discount_product,
    required this.change_price,
    required this.surcharge,
    required this.pay,
    required this.delete_item,
  }) : super(key: key);
  TextEditingController textController;
  bool discount_product;
  bool change_price;
  bool surcharge;
  bool pay;
  bool delete_item;

  @override
  State<ActionsPart> createState() => _ActionsPartState();
}

class _ActionsPartState extends State<ActionsPart> {
  final servicesState = GetIt.I<ServicesState>();
  final basketState = GetIt.I<BasketState>();
  final stopListState = StopLisProducttState();
  int catIndex = 0;
  Future<String> scanCode() async {
    String scanRes;
    try {
      scanRes = await FlutterBarcodeScanner.scanBarcode(
          '#28386a', 'Cancel', true, ScanMode.BARCODE);

      return scanRes;
    } catch (e) {
      AppSettings.toast(text: "error".tr());
      return "";
    }
  }

  bool changeColor = false;
  @override
  Widget build(BuildContext context) {
     bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    List<CustomButton> buttonList = [
      CustomButton(
          onTap: () {
            setState(() {
              basketState.buttonIdentifire = "cart_mode";
              print(basketState.buttonIdentifire);
            });
          },
          backgroundColor: AppColors.mediumGray,
          child: AppIcons(
            icon: Icons.add_shopping_cart_rounded,
            iconColor: darkModeOn?AppColors.mediumGray:AppColors.darkGray,
            size: 28,
          )),
      CustomButton(
          onTap: () {
            setState(() {
              basketState.buttonIdentifire = "calculate_mode";
              print(basketState.buttonIdentifire); 
              if(!basketState.basketIsEmpty){
                 setState(() {
                                                          OrderScreen.controllerText!.text =
                                                              basketState
                                                                  .selectedBasketItem!
                                                                  .quantity
                                                                  .toString();
                                                        });
              }
              else {
                OrderScreen.controllerText!.text="0";
              }
            });
          },
          backgroundColor: AppColors.mediumGray,
          child: AppIcons(
            icon: Icons.calculate_outlined,
            iconColor:darkModeOn?AppColors.mediumGray: AppColors.darkGray,
            size: 28,
          )),
      CustomButton(
          onTap: () {
            setState(() {
              basketState.buttonIdentifire = "price_mode";
            });
          },
          backgroundColor: AppColors.mediumGray,
          child: AppIcons(
            icon: Icons.price_change_outlined,
            iconColor:darkModeOn?AppColors.mediumGray: AppColors.darkGray,
            size: 28,
          )),
      // CustomButton(
      //     onTap: () {
      //       setState(() {
      //         basketState.buttonIdentifire = "discount_mode";
      //       });
      //     },
      //     backgroundColor: AppColors.mediumGray,
      //     child: AppIcons(
      //       icon: Icons.percent,
      //       iconColor: AppColors.darkGray,
      //       size: 28,
      //     ))
    ];

    return Column(
      children: [
        Container(
          child: Row(
            children: [
              for (int index = 0; index < buttonList.length; index++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Observer(builder: (context) {
                      return CustomButton(
                        minimumSize: Size(75, 50),
                        backgroundColor: index == catIndex 

                            ?darkModeOn? AppColors.purple: AppColors.lightPurple
                            :darkModeOn? Colors.black26: AppColors.mediumGray.withOpacity(0.5),
                        foregroundColor: buttonList[index].foregroundColor,
                        onTap: () {
                          setState(() {
                            changeColor = true;
                           
                          });
                          catIndex = buttonList.indexOf(buttonList[index]);
                          buttonList[index].onTap!();
                        },
                        child: buttonList[index].child,
                      );
                    }),
                  ),
                )
            ],
          ),

          // ListView.(
          //     shrinkWrap: false,
          //     itemCount: buttonList.length,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.only(right: 4),
          //           child: Observer(builder: (context) {
          //             return CustomButton(
          //               backgroundColor: index == catIndex
          //                   ? AppColors.darkPurple
          //                   : AppColors.darkPurple.withOpacity(0.5),
          //               foregroundColor: buttonList[index].foregroundColor,
          //               onTap: () {
          //                 setState(() {
          //                   changeColor = true;
          //                 });
          //                 catIndex = buttonList.indexOf(buttonList[index]);
          //                 buttonList[index].onTap!();
          //               },
          //               child: buttonList[index].child,
          //             );
          //           }),
          //         ),
          //       );
          //       //     const SizedBox(height: 2),
          //       //     Expanded(
          //       //       child: Padding(
          //       //         padding: const EdgeInsets.only(right: 4),
          //       //         child: Observer(builder: (context) {
          //       //           return
          //       //         }),
          //       //       ),
          //       //     ),
          //       //     const SizedBox(height: 2),
          //       //     Expanded(
          //       //       child: Padding(
          //       //         padding: const EdgeInsets.only(right: 4),
          //       //         child: Observer(
          //       //           builder: (_) =>
          //       //         ),
          //       //       ),
          //       //     ),
          //       //     const SizedBox(height: 2),
          //       //     Expanded(
          //       //       child: Padding(
          //       //         padding: const EdgeInsets.only(right: 4),
          //       //         child: Observer(
          //       //           builder: (_) =>
          //       //         ),
          //       //       ),
          //       //     ),
          //       //     const SizedBox(height: 2),
          //       //     Expanded(
          //       //       child: Padding(
          //       //         padding: const EdgeInsets.only(right: 4),
          //       //         child: Observer(
          //       //           builder: (_) =>
          //       //         ),
          //       //       ),
          //       //     ),
          //       //     const SizedBox(height: 2),
          //       //     Expanded(
          //       //       child: Padding(
          //       //         padding: const EdgeInsets.only(right: 4),
          //       //         child: Observer(
          //       //           builder: (_) =>
          //       //         ),
          //       //       ),
          //       //     ),
          //       //     const SizedBox(height: 2),
          //       //     Expanded(
          //       //       child: Padding(
          //       //         padding: const EdgeInsets.only(right: 4),
          //       //         child: Observer(
          //       //           builder: (_) =>
          //       //         ),
          //       //       ),
          //       //     ),
          //       //   ],
          //       // );
          //     }),
        ),
      ],
    );
  }

//   Future<void> showExtraMenu() async {
//     final res = await onShowOrderSettingsModal(
//       title: 'extraMenu'.tr(),
//       context: context,
//     );
//     if (res != null) {
//       await orderSelectedSettingsModal(
//         type: res,
//         context: context,
//       );
//     }
//   }

//   Future<void> showStopListMenu() async {
//     final res = await onShowOrderSettingsModal(
//       title: 'StopMenu'.tr(),
//       context: context,
//     );
//     if (res != null) {
//       await orderSelectedSettingsModal(
//         type: res,
//         context: context,
//       );
//     }
//   }
}
