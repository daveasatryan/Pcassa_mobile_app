import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.showSuffixIcon = false,
    required this.hintText,
  }) : super(key: key);
  final String hintText;
  final bool showSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.purple,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          suffixIcon: showSuffixIcon
              ? const Icon(
                  Icons.filter_alt_off_sharp,
                  color: AppColors.purple,
                )
              : null,
          hintText: hintText,
        ),
      ),
    );
  }
}
