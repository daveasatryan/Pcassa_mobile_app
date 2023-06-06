import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/widgets/app_icons.dart';

import '../constants/custom_icons.dart';
import '../models/order_model/order_model.dart';
import '../themes/app_colors.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(14),
      color:darkModeOn?
       Colors.black26
       :AppColors.mediumGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('yyyy-MM-dd HH:mm:ss').format(
                  order.orderinfo.created_at ?? DateTime.now(),
                ),
                style: Theme.of(context).textTheme.caption!.copyWith(
                  color:darkModeOn?
                  AppColors.white
                  : AppColors.darkGray
                ),
              ),
              Text(
                'orderId'.tr(
                  namedArgs: {'number': order.orderinfo.orderid},
                ),
                style: Theme.of(context).textTheme.caption!.copyWith(
                   color:darkModeOn?
                  AppColors.white
                  : AppColors.darkGray),
              ),
            ],
          ),
          Row(
            children: [
              // SettingsPage(),
              AppIcons(icon: Icons.person_sharp, size:36, iconColor:darkModeOn? AppColors.white:AppColors.darkGray,),
              const SizedBox(width: 12),
              Text(
                order.orderinfo.waiter_name ?? '',
                style: Theme.of(context).textTheme.caption!.copyWith(
                 color:darkModeOn?
                  AppColors.white
                  : AppColors.darkGray,)
              ),
            ],
          )
        ],
      ),
    );
  }
}
