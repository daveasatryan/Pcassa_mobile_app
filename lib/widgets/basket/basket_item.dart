import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';

import '../../models/basket_item_model/basket_item_model.dart';
import '../../store/basket_state/basket_state.dart';
import '../../store/services_state/services_state.dart';
import '../../themes/app_colors.dart';

class BasketItem extends StatelessWidget {
  BasketItem(
      {Key? key,
      required this.item,
      required this.onTap,
      this.isSelected = false,
      required this.modifierHide,
      required this.delete_item})
      : super(key: key);

  final BasketItemModel item;
  final bool isSelected;
  final VoidCallback onTap;
  final modifierHide;
  bool? delete_item;

  final basketState = GetIt.I<BasketState>();
  final servicesState = GetIt.I<ServicesState>();
  bool boolDataHide = false;
  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    print(delete_item);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: darkModeOn == false
                  ? isSelected
                      ? AppColors.mediumGray
                      : Colors.transparent
                  : isSelected
                      ? AppColors.purple
                      : AppColors.darkGray,
              borderRadius: BorderRadius.circular(4),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    item.name,
                                    style: TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                        '${item.saleprice} × (${item.quantity})',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16,)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ListView.builder(
                                  itemCount: item.modifiers.length,
                                  itemBuilder: (context, index) {
                                    boolDataHide = servicesState
                                        .products[index].modifrequired;
                                    return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${item.name} (${item.modifiers[index].count})',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(fontSize: 12),
                                          ),
                                        ]);
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  delete_item == true
                      ? const DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5),
                            ),
                          ),
                          child: SizedBox(
                            width: 6,
                            height: double.infinity,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          // boolDataHide == true
          //     ? Stack(children: [
          //         Container(
          //           padding: const EdgeInsets.only(left: 10, top: 5),
          //           alignment: Alignment.center,
          //           height: 30,
          //           child: Expanded(
          //             child: ListView.builder(
          //               itemCount: basketState.modifires.length,
          //               itemBuilder: (context, index) {
          //                 return Text(
          //                   basketState.modifires[index].name.toString(),
          //                   style: TextStyle(fontSize: 10),
          //                 );
          //               },
          //             ),
          //           ),
          //         ),
          //       ])
          //     : const SizedBox(),
          // const SizedBox(
          //   height: 5,
          // ),
        ],
      ),
    );
  }
}
