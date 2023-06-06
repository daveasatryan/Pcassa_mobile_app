import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    this.onTap,
    this.minimumSize,
    this.backgroundColor,
    this.overlayColor,
    this.hasBorderRadius = true,
    this.padding = EdgeInsets.zero,
    this.foregroundColor,
    this.fontSize = 12,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget child;
  final Size? minimumSize;
  final Color? backgroundColor;
  final Color? overlayColor;
  final bool hasBorderRadius;
  final EdgeInsets padding;
  final Color? foregroundColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            minimumSize: minimumSize != null
                ? MaterialStateProperty.all(
                    minimumSize,
                  )
                : null,
            padding: MaterialStateProperty.all(padding),
            overlayColor: MaterialStateProperty.all(overlayColor),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return backgroundColor?.withOpacity(0.5);
                }
                return backgroundColor;
              },
            ),
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.headline2!.copyWith(
                    fontSize: fontSize,
                  ),
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return AppColors.white;
                }
                return foregroundColor;
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: hasBorderRadius
                    ? BorderRadius.circular(4)
                    : BorderRadius.zero,
              ),
            ),
          ),
      child: child,
    );
  }
}
