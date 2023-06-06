import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';

import '../../../models/payment_close_order_model/close_payment_items_model.dart';
import '../../../themes/app_colors.dart';

class PayedOrderItem extends StatelessWidget {
  PayedOrderItem({
    Key? key,
    required this.group_id,
    required this.orderid,
    required this.saleprice,
    required this.created_at,
    required this.waiter_name,
    required this.chequenumber,
    required this.paymentdate,
    required this.items,
  }) : super(key: key);

  int group_id;
  int orderid;
  int saleprice;
  String created_at;
  String waiter_name;
  String chequenumber;
  String paymentdate;
  List<ClosePaymentItemsModel>? items;
  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(14),
      // margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'orderId'.tr(
                  namedArgs: {
                    'number': '$orderid',
                  },
                ),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                width: 100,
                child: FittedBox(
                  child: Text(
                    created_at,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                waiter_name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                '$saleprice',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
