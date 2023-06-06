import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';

import '../../http/repositories/services_repository.dart';
import '../../popups/modifier_modal.dart';
import '../../screens/order_screen/widgets/actions_part.dart';
import '../../store/basket_state/basket_state.dart';
import '../../store/services_state/services_state.dart';
import 'basket_item.dart';

class BasketWidget extends StatefulWidget {
  BasketWidget(
      {Key? key,
      required this.orderId,
      required this.basketHeight,
      required this.delete_item})
      : super(key: key);
  int orderId;
  double basketHeight;
  bool? delete_item;
  @override
  State<BasketWidget> createState() => _BasketWidgetState();
}

class _BasketWidgetState extends State<BasketWidget> {
  final servicesState = GetIt.I<ServicesState>();
  final basketState = GetIt.I<BasketState>();
  final scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (basketState.basket.isNotEmpty) {
      // basketState.selectedBasketItem = basketState.basket.first;
    }
    // if (basketState.selectedBasketItem!.modifiers.length > 0) {
    //   setState(() {
    //     basketState.selectedBasketItem!.showModifires = true;
    //   });
    // } else {
    //   setState(() {
    //     basketState.selectedBasketItem!.showModifires == false;
    //   });
    // }
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Column(
      children: [
        const SizedBox(height: 2),
        Container(
       
          //decoration: BoxDecoration(color: AppColors.white),

          width: MediaQuery.of(context).size.width,

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Observer(
                builder: (_) => Column(
                  children: basketState.order!.basket
                      .map(
                        (item) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Dismissible(
                                direction: widget.delete_item == true
                                    ? DismissDirection.endToStart
                                    : DismissDirection.none,
                                key: UniqueKey(),
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  color: AppColors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      'Удалить',
                                      style: Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                ),
                                // secondaryBackground: Container(
                                //   alignment: Alignment.centerRight,
                                //   color: AppColors.red,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(right: 10),
                                //     child: Text(
                                //       'Удалить',
                                //       style: Theme.of(context).textTheme.caption,
                                //     ),
                                //   ),
                                // ),
                                onDismissed: (DismissDirection direction) async {
                                  if (direction == DismissDirection.endToStart) {
                                    // if (basketState.selectedBasketItem != null) {
                                    //deleteItem
                                    print(item.name);
          
                                    await basketState.onDeleteItem(
                                        orderId: widget.orderId, id: item.id);
                                    //}
                                  } else if (direction == DismissDirection.none) {
                                    AppSettings.toast(text: "permission".tr());
                                  } else {
                                    return null;
                                  }
                                },
                                child: Column(
                                  children: [
                                    BasketItem(
                                      delete_item: widget.delete_item,
                                      modifierHide: servicesState.products,
                                      item: item,
                                      onTap: () {
                                        // basketState.exciseText = basketState
                                        //     .selectedBasketItem!.excise;
                                        print(basketState.exciseText);
                                        print(basketState
                                            .selectedBasketItem!.excise);
                                        basketState.selectedBasketItem = item;
                                      },
                                      isSelected:
                                          basketState.selectedBasketItem?.id ==
                                              item.id,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
