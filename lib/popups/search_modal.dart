import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/services.dart';
import 'package:pcassa_retail_mobile/store/stop_list_state/stop_list_state.dart';

import '../models/table_model/table_model.dart';
import '../store/basket_state/basket_state.dart';
import '../store/search_state/search_state.dart';
import '../store/services_state/services_state.dart';
import '../themes/app_colors.dart';
import '../widgets/custom_button.dart';
import 'widgets/modal_header.dart';

Future<void> showSearchDialog({
  required bool addStopList,
  required BuildContext context,
  required String title,
}) async {
  final servicesState = GetIt.I<ServicesState>();
  final basketState = GetIt.I<BasketState>();
  final searchState = SearchState();
  final controller = TextEditingController();
  final controller_quantity = TextEditingController(text: '1');
  final stopListState = StopLisProducttState();

  searchState
    ..products = servicesState.products
    ..searchProducts = servicesState.products;

  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  onTap(String value) {
    if (addStopList == false) {
      switch (value) {
        case 'Clear':
          controller.clear();
          searchState.onSearch(controller.text);
          break;
        case 'done':
          searchState.onSearch(controller.text);
          break;
        default:
          {
            controller.text = controller.text + value;
            searchState.onSearch(controller.text);
          }
      }
    } else if (addStopList == true) {
      // searchState.searchProducts.map(
      //   (product) => stopListState.addItem(
      //       kot_tov: product.kat_tov!,
      //       name: product.name!,
      //       dedescription: product.description!,
      //       quantity: 1),
      // );
    }
  }

  await showGeneralDialog(
    barrierLabel: '',
    barrierDismissible: false,
    context: context,
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
    pageBuilder: (context, anim1, anim2) {
      final focusNode = FocusNode();
      return SimpleDialog(
        titlePadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        contentPadding: const EdgeInsets.all(12),
        title: ModalHeader(addStopList: addStopList, title: 'search'.tr()),
        children: [
          SizedBox(
            height: height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: searchState.onSearch,
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: 'search'.tr(),
                        ),
                      ),
                      const Divider(),
                      // Expanded(
                      //   child: ListView.builder(
                      //     itemCount: searchState.searchProducts.length,
                      //     itemBuilder: (context, index) {
                      //       final product = searchState.searchProducts[index];
                      //       return CustomButton(
                      //         onTap: () async {
                      //           if (addStopList == false) {
                      //             basketState.onAddToBasket(product);
                      //           } else if (addStopList == true) {
                      //             int kod_tov = int.parse("${product.kod_tov}");
                      //             int quantityInt =
                      //                 int.parse("${controller_quantity.text}");

                      //             await stopListState.addItem(
                      //                 kod_tov: kod_tov,
                      //                 name: product.name.toString(),
                      //                 dedescription:
                      //                     product.description.toString(),
                      //                 quantity: quantityInt);
                      //           }
                      //         },
                      //         backgroundColor: AppColors.gray,
                      //         minimumSize: const Size(300, 100),
                      //         padding: const EdgeInsets.all(12),
                      //         foregroundColor: AppColors.white,
                      //         child: Row(
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Text(
                      //                 product.name!,
                      //                 maxLines: 2,
                      //                 overflow: TextOverflow.ellipsis,
                      //                 textAlign: TextAlign.center,
                      //               ),
                      //               const SizedBox(
                      //                 width: 5,
                      //               ),
                      //               addStopList == true
                      //                   ? Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.center,
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.end,
                      //                       children: [
                      //                         IconButton(
                      //                             iconSize: 20,
                      //                             onPressed: () {
                      //                               showDialog(
                      //                                 context: context,
                      //                                 builder: (BuildContext
                      //                                     context) {
                      //                                   return GestureDetector(
                      //                                     onTap: focusNode
                      //                                         .requestFocus,
                      //                                     child: SimpleDialog(
                      //                                       titlePadding:
                      //                                           EdgeInsets.zero,
                      //                                       shape:
                      //                                           const RoundedRectangleBorder(
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .all(Radius
                      //                                                     .circular(
                      //                                                         4)),
                      //                                       ),
                      //                                       title: ModalHeader(
                      //                                           addStopList:
                      //                                               false,
                      //                                           title: title),
                      //                                       children: [
                      //                                         Column(
                      //                                           mainAxisSize:
                      //                                               MainAxisSize
                      //                                                   .min,
                      //                                           children: [
                      //                                             SizedBox(
                      //                                               height: 60,
                      //                                               child:
                      //                                                   TextField(
                      //                                                 controller:
                      //                                                     controller_quantity,
                      //                                                 autofocus:
                      //                                                     true,
                      //                                                 textAlign:
                      //                                                     TextAlign
                      //                                                         .center,
                      //                                                 style: Theme.of(
                      //                                                         context)
                      //                                                     .textTheme
                      //                                                     .headline1!
                      //                                                     .copyWith(
                      //                                                       color:
                      //                                                           AppColors.gray,
                      //                                                     ),
                      //                                               ),
                      //                                             ),
                      //                                             CustomButton(
                      //                                               onTap:
                      //                                                   () async {
                      //                                                 router
                      //                                                     .pop();
                      //                                                 int kod_tov =
                      //                                                     int.parse(
                      //                                                         "${product.kod_tov}");
                      //                                                 int quantityInt =
                      //                                                     int.parse(
                      //                                                         "${controller_quantity.text}");

                      //                                                 await stopListState.addItem(
                      //                                                     kod_tov:
                      //                                                         kod_tov,
                      //                                                     name: product
                      //                                                         .name
                      //                                                         .toString(),
                      //                                                     dedescription: product
                      //                                                         .description
                      //                                                         .toString(),
                      //                                                     quantity:
                      //                                                         quantityInt);
                      //                                               },
                      //                                               padding:
                      //                                                   const EdgeInsets
                      //                                                       .symmetric(
                      //                                                 vertical:
                      //                                                     4,
                      //                                                 horizontal:
                      //                                                     10,
                      //                                               ),
                      //                                               child: Text(
                      //                                                 'add'
                      //                                                     .tr(),
                      //                                               ),
                      //                                             ),
                      //                                           ],
                      //                                         ),
                      //                                       ],
                      //                                     ),
                      //                                   );
                      //                                 },
                      //                               );
                      //                             },
                      //                             icon: Icon(Icons.add)),
                      //                       ],
                      //                     )
                      //                   : Text(""),
                      //             ]),
                      //       );
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: Observer(
                      builder: (_) => Column(
                        children: searchState.searchProducts
                            .map(
                              (product) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: CustomButton(
                                  onTap: () async {
                                    if (addStopList == false) {
                                      basketState.onAddToBasket(product, 1);
                                    } else if (addStopList == true) {
                                      int kod_tov =
                                          int.parse("${product.kod_tov}");
                                      int quantityInt = int.parse(
                                          "${controller_quantity.text}");

                                      // await stopListState.addItem(
                                      //     kod_tov: kod_tov,
                                      //     name: product.name.toString(),
                                      //     dedescription:
                                      //         product.description.toString(),
                                      //     quantity: quantityInt);
                                    }
                                  },
                                  backgroundColor: AppColors.gray,
                                  minimumSize: const Size(300, 100),
                                  padding: const EdgeInsets.all(12),
                                  foregroundColor: AppColors.white,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          product.name!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        addStopList == true
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                      iconSize: 20,
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return GestureDetector(
                                                              onTap: focusNode
                                                                  .requestFocus,
                                                              child:
                                                                  SimpleDialog(
                                                                titlePadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              4)),
                                                                ),
                                                                title: ModalHeader(
                                                                    addStopList:
                                                                        false,
                                                                    title:
                                                                        title),
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            60,
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              controller_quantity,
                                                                          autofocus:
                                                                              true,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .headline1!
                                                                              .copyWith(
                                                                                color: AppColors.gray,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      CustomButton(
                                                                        onTap:
                                                                            () async {
                                                                          router
                                                                              .pop();
                                                                          int kod_tov =
                                                                              int.parse("${product.kod_tov}");
                                                                          int quantityInt =
                                                                              int.parse("${controller_quantity.text}");

                                                                          // await stopListState.addItem(
                                                                          //     kod_tov: kod_tov,
                                                                          //     name: product.name.toString(),
                                                                          //     dedescription: product.description.toString(),
                                                                          //     quantity: quantityInt);
                                                                        },
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          vertical:
                                                                              4,
                                                                          horizontal:
                                                                              10,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'add'
                                                                              .tr(),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      icon: Icon(Icons.add)),
                                                ],
                                              )
                                            : Text(""),
                                      ]),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  ).then((value) async {
    // await router.pop();
    // await showStopListDialog(
    //   context: context,
    //   title: 'StopList'.tr(),
    // );
  });
}

// Future<String?> onShowGuestCountModal({
//   required BuildContext context,
//   required TextEditingController controller_quantity,
//   required String title,
// }) async {
//   final focusNode = FocusNode();

//   return 
// }
