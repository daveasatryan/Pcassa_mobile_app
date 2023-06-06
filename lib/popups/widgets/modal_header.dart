import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/services.dart';
import '../../themes/app_colors.dart';
import '../stop_list.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({
    Key? key,
    required this.title,
    this.addStopList,
    this.width,
    this.hasBorder = true,
  }) : super(key: key);

  final String title;
  final double? width;
  final bool hasBorder;
  final bool? addStopList;
  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
          decoration: BoxDecoration(
            color: darkModeOn == false ? AppColors.white : AppColors.darkGray,
            borderRadius: hasBorder
                ? const BorderRadius.only(
                    topRight: Radius.circular(4),
                    topLeft: Radius.circular(4),
                  )
                : null,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color:darkModeOn?AppColors.white: AppColors.darkGray
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   top: 0,
        //   right: 0,
        //   child: IconButton(
        //     icon: const Icon(Icons.close, color: AppColors.white),
        //     onPressed: () async {
        //       if (addStopList == true) {
        //         await router.pop();
        //         await showStopListDialog(
        //           context: context,
        //           title: 'StopList'.tr(),
        //         );
        //       } else {
        //         await router.pop();
        //       }
        //     },
        //   ),
        // ),
      ],
    );
  }
}
