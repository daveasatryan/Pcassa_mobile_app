import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/constants/custom_icons.dart';
import 'package:pcassa_retail_mobile/store/sign_in_state/sign_in_state.dart';

import '../../constants/order_page_types.dart';
import '../../http/repositories/services_repository.dart';
import '../../models/order_info_model/order_info_model.dart';
import '../../models/order_model/order_model.dart';
import '../../router.gr.dart';
import '../../services.dart';
import '../../store/auth/auth_state.dart';
import '../../store/basket_state/basket_state.dart';
import '../../store/loading/loading_state.dart';
import '../../themes/app_colors.dart';
import '../../utils/error_handler.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final loadingState = LoadingState();
  final basketState = GetIt.I<BasketState>();
  final authState = GetIt.I<AuthState>();

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image(
                    width: 150,
                    image: AssetImage(darkModeOn == false
                        ? CustomIcons.iconLogo
                        : CustomIcons.logo_for_dark),
                  ),
                  //  ExtendedImage.network(
                  //   GetIt.I<AuthState>().info!.logo,
                  // ),
                ),
                const SizedBox(height: 80),
                ...OrderPageType.values
                    .map(
                      (orderType) => Padding(
                        padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                        child: CustomButton(
                          backgroundColor:darkModeOn == false
                          ? AppColors.lightPurple:AppColors.purple,
                          
                          onTap: () {
                            onTap(orderType: orderType);
                          },
                          minimumSize: const Size(360, 100),
                          //backgroundColor: AppColors.primaryColor,
                          //overlayColor: AppColors.darkPurple,
                          child: Text(
                            orderType.title.tr(),
                            
                            style: Theme.of(context).textTheme.headline1! .copyWith(
                                                                      color:darkModeOn == false
                          ? AppColors.darkGray:AppColors.white,)
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
        Observer(
          builder: (_) =>
              loadingState.isLoading ? const LoadingWidget() : const SizedBox(),
        ),
      ],
    );
  }

  //GetSavedORders
  Future<void> submitData() async {
    final res = await ServicesRepository.getSaved(
      waiter_name: authState.currentUser!.fio,
    );

    print(res);

    await router.popAndPush(
      TablesRoute(orderPageType: OrderPageType.editOrder, editedOrders: res),
    );
  }

  Future<void> onTap({
    required OrderPageType orderType,
  }) async {
    if (orderType == OrderPageType.quickOrder) {
      await onCreateOrder();
    } else if (orderType == OrderPageType.editOrder) {
      await submitData();
    }
  }
  // Future<void> onTap({required OrderPageType orderType}) async {
  //   if (orderType == OrderPageType.quickOrder) {
  //     await onCreateOrder();
  //   } else {
  //     await router.push(
  //       TablesRoute(orderPageType: orderType),
  //     );
  //   }
  // }

  Future<void> onCreateOrder() async {
    try {
      loadingState.startLoading();
      final createdOrder = OrderModel(
        orderinfo: OrderInfoModel(
          cashid: 1,
          waiter_name: authState.currentUser?.fio ?? '',
        ),
      );
      final order = await basketState.createOrder(createdOrder: createdOrder);

      await router.push(
        OrderRoute(
            order: order,
            orderPageType: OrderPageType.quickOrder,
            basket: [],
            onShowPayment: () {}),
      );
    } catch (e) {
      await UiUtils.errorModal(
        context: context,
        errorCode: 'errors.any',
      );
    } finally {
      loadingState.stopLoading();
    }
  }
}
