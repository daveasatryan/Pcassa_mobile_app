import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pcassa_retail_mobile/constants/custom_icons.dart';

import '../services.dart';
import '../themes/app_colors.dart';

class UiUtils {
  static Future<bool?> errorModal({
    required BuildContext context,
    required String errorCode,
  }) async {
    String? title;
    switch (errorCode) {
      case 'excise_code_posted':
        title = 'Excise code posted';
        break;
      case 'operationsucceeded':
        title = 'operationsucceeded';
        break;
      case 'Something is wrong':
        title = 'Something is wrong';
        break;
      case 'Empty_product':
        title = 'productNotFound';
        break;
      case 'errors.wrongCode':
        title = 'errors.wrongCode';
        break;
      case '07':
        title = 'errors.07';
        break;
      case '09':
        title = 'errors.09';
        break;
      case '17':
        title = 'errors.17';
        break;
      case '40':
        title = 'errors.40';
        break;
      case '41':
        title = 'errors.41';
        break;
      case '42':
        title = 'errors.42';
        break;
      case '43':
        title = 'errors.43';
        break;
      case '44':
        title = 'errors.44';
        break;
      case '45':
        title = 'errors.45';
        break;
      case '46':
        title = 'errors.46';
        break;
    }
    title ??= 'errors.any';
    return showDialog<bool?>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: title != null && title != "operationsucceeded"
              ? Text(
                  title.tr(),
                  style: Theme.of(context)
                      .inputDecorationTheme
                      .errorStyle!
                      .copyWith(),
                  textAlign: TextAlign.center,
                )
              : title == "operationsucceeded"
                  ? Text(
                      title!.tr(),
                      textAlign: TextAlign.center,
                    )
                  : null,
          children: [
            title == "operationsucceeded"
                ? SvgPicture.asset(CustomIcons.successed,
                    width: 36, height: 36, semanticsLabel: 'Label')
                : SvgPicture.asset(CustomIcons.notif_error,
                    width: 36, height: 36, semanticsLabel: 'Label'),
            TextButton(
              onPressed: router.pop,
              child: Text(
                'done'.tr(),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        );
      },
    );
  }
}
