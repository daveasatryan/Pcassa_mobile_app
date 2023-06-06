import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../widgets/custom_button.dart';

Future<void> onShowReportsModal({
  required BuildContext context,
  required String title,
}) async {
  await showBarModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              CustomButton(
                onTap: () {},
                minimumSize: const Size(380, 100),
                child: Text('totalRevenues'.tr()),
              ),
              const SizedBox(height: 12),
              CustomButton(
                onTap: () {},
                minimumSize: const Size(380, 100),
                child: Text('consumptionMeals'.tr()),
              ),
              const SizedBox(height: 12),
              CustomButton(
                onTap: () {},
                minimumSize: const Size(380, 100),
                child: Text('collectionApplication'.tr()),
              ),
            ],
          ),
        ),
      );
    },
  );
}
