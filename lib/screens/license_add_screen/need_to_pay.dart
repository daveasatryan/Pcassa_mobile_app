import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/widgets/app_icons.dart';

class NeedToPay extends StatefulWidget {
 const NeedToPay({Key? key}) : super(key: key);

  @override
  State<NeedToPay> createState() => _NeedToPayState();
}

class _NeedToPayState extends State<NeedToPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( "LicenseExpexctNeedToPay".tr()),
            SizedBox(height: 30),
            AppIcons(
              icon: Icons.warning_amber_rounded,
              size: 46,
              iconColor: AppColors.red,
            )
          ],
        ),
      )),
    );
  }
}
