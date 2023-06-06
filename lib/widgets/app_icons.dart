import 'package:flutter/material.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';

class AppIcons extends StatelessWidget {
  final IconData icon;
  Color? backGroundColor;
  final Color iconColor;
  final double size;
  AppIcons({
    Key? key,
    required this.icon,
    this.backGroundColor,
    this.iconColor = AppColors.black,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: iconColor,
      size: size==0?(MediaQuery.of(context).size.height/52.75):size
    );
  }
}
