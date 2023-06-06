import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/table_model/table_model.dart';
import '../services.dart';
import '../themes/app_colors.dart';
import '../widgets/custom_button.dart';
import 'widgets/modal_header.dart';

Future<String?> onShowGuestCountModal({
  required BuildContext context,
  required TableModel table,
  required String title,
}) async {
  final focusNode = FocusNode();
  final controller = TextEditingController(text: '1');

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: focusNode.requestFocus,
        child: SimpleDialog(
          titlePadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          title: ModalHeader(title: title),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: AppColors.gray,
                        ),
                  ),
                ),
                CustomButton(
                  onTap: () {
                    router.pop(controller.text);
                  },
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                  child: Text(
                    'orderPageTypes.createOrder'.tr(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
