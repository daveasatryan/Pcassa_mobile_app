import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/popups/search_modal.dart';
import 'package:pcassa_retail_mobile/store/stop_list_state/stop_list_state.dart';

import '../constants/custom_icons.dart';
import '../services.dart';
import '../store/basket_state/basket_state.dart';
import '../store/search_state/search_state.dart';
import '../store/services_state/services_state.dart';
import '../themes/app_colors.dart';
import '../widgets/custom_button.dart';
import 'widgets/modal_header.dart';

Future<void> showStopListDialog({
  required BuildContext context,
  required String title,
}) async {
  //final servicesState = GetIt.I<ServicesState>();
  // final basketState = GetIt.I<BasketState>();
  final stopListState = StopLisProducttState();

  final controller = TextEditingController();

  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  onTap(String value) {
    // switch (value) {
    //   case 'Clear':
    //     controller.clear();
    //     stopListState.getPosts();
    //     break;
    //   case 'done':
    //     stopListState.onSearch(controller.text);
    //     break;
    //   default:
    //     {
    //       controller.text = controller.text + value;
    //       searchState.onSearch(controller.text);
    //     }
    // }
  }

  await showGeneralDialog(
    barrierLabel: '',
    barrierDismissible: true,
    context: context,
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
    pageBuilder: (context, anim1, anim2) {
      stopListState.getPosts();
      return LayoutBuilder(builder: (context, _) {
        return SimpleDialog(
          titlePadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          contentPadding: const EdgeInsets.all(12),
          title: ModalHeader(title: 'stop_list'.tr()),
          children: [
            SizedBox(
              height: height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          //onChanged: searchState.onSearch,
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: 'search'.tr(),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Observer(builder: (context) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 50),
                          width: width,
                          height: 450,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 119,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 3 / 2,
                              ),
                              itemCount: stopListState.postsProducts.length,
                              itemBuilder: (context, index) {
                                return Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: CustomButton(
                                      onTap: () {
                                        // basketState.onAddToBasket(product);
                                      },
                                      backgroundColor: const Color.fromRGBO(
                                          216, 210, 246, 1),
                                      minimumSize: const Size(300, 100),
                                      padding: const EdgeInsets.all(12),
                                      foregroundColor: AppColors.darkGray,
                                      child: Column(
                                        children: [
                                          Text(
                                            stopListState
                                                .postsProducts[index].name!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            stopListState
                                                .postsProducts[index].quantity!
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.purple),
                                      child: IconButton(
                                        iconSize: 10,
                                        icon: SvgPicture.asset(
                                            CustomIcons.close,
                                            width: 12,
                                            height: 12,
                                            color: AppColors.white,
                                            semanticsLabel: 'Label'),
                                        onPressed: () async {
                                          await stopListState.deleteItem(
                                              kot_tov: stopListState
                                                  .postsProducts[index].kod_tov!
                                                  .toString());
                                          //deleteStop
                                        },

                                        //onPressed: router.pop,
                                      ),
                                    ),
                                  ),
                                ]);
                              }),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () async {
                      await router.pop();
                      await showSearchDialog(
                        addStopList: true,
                        context: context,
                        title: 'search'.tr(),
                      );
                    },
                    child: const Icon(Icons.add))),
          ],
        );
      });
    },
  );
}
