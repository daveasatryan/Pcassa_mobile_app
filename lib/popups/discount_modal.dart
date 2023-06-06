import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/constants/custom_icons.dart';

import '../models/category_model/category_model.dart';
import '../models/menu_abstract_model/menu_abstract_model.dart';
import '../models/product_model/product_model.dart';
import '../services.dart';
import '../store/basket_state/basket_state.dart';
import '../store/services_state/services_state.dart';
import '../themes/app_colors.dart';
import '../widgets/custom_button.dart';
import 'modifier_modal.dart';
import 'widgets/modal_header.dart';

Future<void> onShowDiscountModal({
  required bool hideBottomSheet,
  required BuildContext context,
  required String title,
  Function? onTop,
}) async {
  final basketState = GetIt.I<BasketState>();
  final servicesState = GetIt.I<ServicesState>();
  String _scanTxt = 'No Scan';
  await showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      final theme = Theme.of(context);
      bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
      servicesState.products.clear();

      return Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Container(
          padding: EdgeInsets.only(
            left: 5,
          ),
          color: darkModeOn == false ? AppColors.white : AppColors.darkGray,
          child: Wrap(
              //height: MediaQuery.of(context).size.height / 1.9,

              children: [
                Center(
                    child: hideBottomSheet == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ...GetIt.I<ServicesState>()
                                  .addons
                                  .map(
                                    (addonGroup) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(addonGroup.name),

                                            ///TODO added icon depends discount type
                                            // const SizedBox(width: 10),
                                            // const Icon(CustomIcons.skidka)
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Wrap(
                                          spacing: 10,
                                          runSpacing: 10,
                                          children: addonGroup.items
                                              .map(
                                                (item) => CustomButton(
                                                  backgroundColor: darkModeOn ==
                                                          false
                                                      ? AppColors.purple
                                                      : AppColors.lightPurple,
                                                  onTap: () async {
                                                    await router.pop();
                                                    await GetIt.I<BasketState>()
                                                        .discountSell(-item.id);
                                                  },
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 16,
                                                      horizontal: 28),
                                                  overlayColor:
                                                      AppColors.darkPurple,
                                                  child: Text(
                                                    '${item.name} ${item.val}${item.tip}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        )
                                      ],
                                    ),
                                  )
                                  .toList(),
                              const SizedBox(height: 20),
                            ],
                          )
                        : GestureDetector(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  onChanged: (value) async {
                                    if (value.length > 2) {
                                      servicesState.products.clear();
                                      await servicesState.getSearchProduct(value);
                                    } else {
                                      null;
                                      servicesState.products.clear();
                                    }
                                  },
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    hintText: "search_by_name".tr(),
                                    hintStyle: TextStyle(
                                      color: darkModeOn == true
                                          ? AppColors.white
                                          : AppColors.darkGray,
                                    ),
                                    filled: true,
                                    fillColor: darkModeOn == false
                                        ? AppColors.white
                                        : AppColors.darkGray,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: AppColors.purple),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: AppColors.purple),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 5),
                                  width: MediaQuery.of(context).size.width,
                                  // height:
                                  //     30, // MediaQuery.of(context).size.height / 2.4,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Container(
                                      height: 150,
                                      child: SingleChildScrollView(
                                        child: Observer(
                                          builder: (_) => Column(
                                            children: [
                                              ...GetIt.I<ServicesState>()
                                                  .products
                                                  .map(
                                                    (addonGroup) => Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const SizedBox(
                                                            height: 10),
                                                        InkWell(
                                                          onTap: () async {
                                                            print(addonGroup
                                                                .excise
                                                                .runtimeType);
                                                            if (addonGroup
                                                                    .excise !=
                                                                true) {
                                                              await basketState
                                                                  .onAddToBasket(
                                                                      addonGroup,
                                                                      1);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            } else if (addonGroup
                                                                    .excise ==
                                                                true) {
                                                              showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context: context,
                                                                builder:
                                                                    (context) {
                                                                  final controller =
                                                                      TextEditingController();
                                                                  return AlertDialog(
                                                                    title: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "exise"
                                                                              .tr(),
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  16,
                                                                              color: darkModeOn == true
                                                                                  ? AppColors.white
                                                                                  : AppColors.black),
                                                                        ),
                                                                        IconButton(
                                                                          onPressed:
                                                                              () async {
                                                                            basketState.productModel =
                                                                                addonGroup;
                                                                            await onTop!()
                                                                                .then((text) {
                                                                              _scanTxt =
                                                                                  text;
                                                                            });
                        
                                                                            await basketState.onSearchExise(
                                                                                addonGroup.kod_tov!,
                                                                                _scanTxt,
                                                                                basketState.order!.orderinfo.orderid,
                                                                                context,
                                                                                1);
                                                                            Navigator.pop(
                                                                                context);
                                                                            Navigator.pop(
                                                                                context);
                                                                          },
                                                                          icon: SvgPicture.asset(
                                                                              CustomIcons
                                                                                  .scan,
                                                                              width:
                                                                                  30,
                                                                              height:
                                                                                  30,
                                                                              color: darkModeOn == false
                                                                                  ? AppColors.black
                                                                                  : AppColors.white,
                                                                              semanticsLabel: 'Label'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    content:
                                                                        TextField(
                                                                      autofocus:
                                                                          true,
                                                                      controller:
                                                                          controller,
                                                                      //style: TextStyle(color: AppColors.black),
                                                                      // keyboardType: TextInputType.number,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        filled:
                                                                            false, //<-- SEE HERE
                                                                        fillColor:
                                                                            AppColors
                                                                                .white,
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: const BorderSide(
                                                                              width:
                                                                                  1,
                                                                              color:
                                                                                  AppColors.purple),
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: const BorderSide(
                                                                              width:
                                                                                  2,
                                                                              color:
                                                                                  AppColors.purple),
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            context,
                                                                            'Cancel'),
                                                                        child: Text(
                                                                            'cancel'
                                                                                .tr()),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () async {
                                                                          basketState.productModel =
                                                                              addonGroup;
                                                                          print(addonGroup
                                                                              .kod_tov);
                                                                          print(addonGroup
                                                                              .barcode);
                                                                          await basketState.onSearchExise(
                                                                              addonGroup.kod_tov!,
                                                                              controller.text,
                                                                              basketState.order!.orderinfo.orderid,
                                                                              context,
                                                                              1);
                                                                          Navigator.pop(
                                                                              context,
                                                                              'ok');
                                                                          Navigator.pop(
                                                                              context,
                                                                              'ok');
                                                                        },
                                                                        child: Text(
                                                                            'ok'.tr()),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: Container(
                                                            width:
                                                                MyUtility(context)
                                                                        .width -
                                                                    30,
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Text(
                                                                addonGroup.name!,
                                                                style: TextStyle(
                                                                  color: darkModeOn == true
                                                                      ? AppColors
                                                                          .white
                                                                      : AppColors
                                                                          .darkGray,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                      ],
                                                    ),
                                                  )
                                                  .toList(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        )),
              ]),
        ),
      );
    },
  );

  void onTap({
    required BuildContext context,
    required MenuAbstractModel item,
  }) {
    if (item.isProduct) {
      //  basketState.basket.clear();
      print(item);
      final product = item as ProductModel;
      basketState.onAddToBasket(product, 1);
      // if (product.modifrequired && product.guid_mod.isNotEmpty) {
      //   onShowModifiersModal(context: context);
      // }
    } else {
      servicesState.onFilterCategory(item as CategoryModel);
    }
  }
}
