import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/payed_order_actions_type.dart';
import '../themes/app_colors.dart';
import '../widgets/custom_button.dart';
import 'widgets/modal_header.dart';

class PayedOrderModal extends StatelessWidget {
  const PayedOrderModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.8,
      child: Column(
        children: [
          ModalHeader(
            width: width,
            title: 'orderId'.tr(
              namedArgs: {
                'number': '101',
              },
            ),
            hasBorder: false,
          ),
          const SizedBox(height: 48),
          ...PayedOrderActionsType.values
              .map(
                (orderType) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: CustomButton(
                    onTap: () {},
                    minimumSize: const Size(360, 100),
                    // backgroundColor: AppColors.primaryColor,
                    //overlayColor: AppColors.darkPurple,
                    child: Text(
                      orderType.title.tr(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
