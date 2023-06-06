import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/modifier_model/modifier_model.dart';
import '../services.dart';
import '../store/basket_state/basket_state.dart';
import '../store/services_state/services_state.dart';
import '../themes/app_colors.dart';
import '../widgets/custom_button.dart';
import 'widgets/modal_header.dart';

Future<void> onShowModifiersModal({
  required BuildContext context,
}) async {
  final servicesState = GetIt.I<ServicesState>();
  final basketState = GetIt.I<BasketState>();
  print("Lillllllll modifiersGroups ${servicesState.modifiersGroups.main}");

  // final mainModifiers = servicesState.modifiersGroups.main.where(
  //   (modifier) =>
  //       basketState.selectedBasketItem!.guid_mod.contains(modifier.guid),
  // );
  // print("mamamamamamamamamamamam $mainModifiers");
  // final optionalModifiers = servicesState.modifiersGroups.optional.where(
  //   (modifier) =>
  //       basketState.selectedBasketItem!.guid_mod.contains(modifier.guid),
  // );

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        titlePadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        title: ModalHeader(
          title: 'modifiers'.tr(),
        ),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // if (mainModifiers.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text('main'.tr()),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: servicesState.modifiersGroups.main
                            .map(
                              (item) => CustomButton(
                                onTap: () {
                                  basketState.onAddModifier(item);
                                },
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 28,
                                ),
                                minimumSize: const Size(200, 100),
                                //overlayColor: AppColors.darkPurple,
                                child: Text(
                                  item.name,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  //if (optionalModifiers.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text('optional'.tr()),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: servicesState.modifiersGroups.optional
                            .map(
                              (item) => CustomButton(
                                onTap: () {
                                  basketState..onAddModifier(item);
                                },
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 28,
                                ),
                                minimumSize: const Size(200, 100),
                                //overlayColor: AppColors.darkPurple,
                                child: Text(
                                  item.name,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
