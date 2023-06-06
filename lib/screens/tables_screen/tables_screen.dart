import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/models/savedorder_model/savedorder_model.dart';

import '../../constants/custom_icons.dart';
import '../../constants/order_page_types.dart';
import '../../http/repositories/services_repository.dart';
import '../../models/basket_item_model/basket_item_model.dart';
import '../../models/error/error_model.dart';
import '../../models/order_info_model/order_info_model.dart';
import '../../models/order_model/order_model.dart';
import '../../models/table_model/table_model.dart';
import '../../popups/guest_count.dart';
import '../../router.gr.dart';
import '../../services.dart';
import '../../store/auth/auth_state.dart';
import '../../store/basket_state/basket_state.dart';
import '../../store/loading/loading_state.dart';
import '../../store/tables_state/tables_state.dart';
import '../../themes/app_colors.dart';
import '../../utils/error_handler.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/table_groups.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({
    Key? key,
    required this.orderPageType,
    required this.editedOrders,
  }) : super(key: key);

  final OrderPageType orderPageType;
  final List<SavedOrderModel> editedOrders;

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  final loadingState = LoadingState();
  final tablesState = GetIt.I<TablesState>();
  final basketState = GetIt.I<BasketState>();
  final authState = GetIt.I<AuthState>();

  @override
  void initState() {
    super.initState();
    loadingState.startLoading();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => afterFirstLayout(context),
    );
  }

  Future<void> afterFirstLayout(BuildContext context) async {
    try {
      await tablesState.getTableGroups();
    } on DioError catch (e) {
      try {
        final error = ErrorModel.fromJson(e.response!.data);

        await UiUtils.errorModal(
          context: context,
          errorCode: error.errors,
        );
      } catch (e) {
        await UiUtils.errorModal(
          context: context,
          errorCode: 'errors.any',
        );
      }
    } finally {
      loadingState.stopLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Observer(
              //   builder: (_) => loadingState.isLoading
              //       ? const SizedBox()
              //       : TableGroups(
              //           tableGroups: tablesState.tableGroups,
              //           selectedTableGroupId: tablesState.selectedTableGroupId,
              //           onChangeGroup: (id) {
              //             tablesState.selectedTableGroupId = id;
              //           },
              //         ),
              // ),
              Observer(builder: (_) {
                print(widget.editedOrders);
                return widget.orderPageType == OrderPageType.editOrder
                    ? Expanded(
                        child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            for (int i = 0; i < widget.editedOrders.length; i++)
                              // if (tablesState.selectedTableGroupId ==
                              //     widget.editedOrders[i].group_id)
                              InkWell(
                                onTap: () {
                                  openSavedOrders(
                                    orderid:
                                        '${widget.editedOrders[i].orderid}',
                                  );
                                },
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    child: Container(
                                        height: 180,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.gray,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      FittedBox(
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              4,
                                                          child: Text(
                                                              DateFormat(
                                                                      'yyyy-MM-dd HH:mm:ss')
                                                                  .format(
                                                                widget
                                                                        .editedOrders[
                                                                            i]
                                                                        .created_at ??
                                                                    DateTime
                                                                        .now(),
                                                              ),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .caption!
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .white,
                                                                      fontSize:
                                                                          20)),
                                                        ),
                                                      ),
                                                      Text(
                                                          '${widget.editedOrders[i].waiter_name}',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .caption!
                                                              .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  fontSize:
                                                                      20)),
                                                    ]),
                                                Text(
                                                    '${widget.editedOrders[i].saleprice}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                            color:
                                                                AppColors.white,
                                                            fontSize: 35)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Observer(
                                                            builder: (context) {
                                                          return Text(
                                                              '${widget.editedOrders[i].orderid}',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .caption!
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .white,
                                                                      fontSize:
                                                                          20));
                                                        }),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('paid'.tr(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption!
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .white,
                                                                    fontSize:
                                                                        20)),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                            '${widget.editedOrders[i].paid}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption!
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .white,
                                                                    fontSize:
                                                                        20)),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )))),
                              ),
                          ],
                        ),
                      ))
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: tablesState.tables
                              .map(
                                (table) => CustomButton(
                                  onTap: () {
                                    if (table.status) {
                                      whenTableIsBusy();
                                    } else {
                                      onTabTable(table: table);
                                    }
                                  },
                                  minimumSize: const Size(150, 100),
                                  padding: const EdgeInsets.all(24),
                                  backgroundColor: table.status
                                      ? AppColors.red
                                      : AppColors.mediumGray,
                                  child: Stack(
                                    children: [
                                      if (table.linkfoto != null)
                                        ExtendedImage.network(
                                          table.image,
                                        ),
                                      Text(
                                        table.n_t,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ));
              }),
            ],
          ),
          Observer(
            builder: (_) => loadingState.isLoading
                ? const LoadingWidget()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Future<void> openSavedOrders({required String orderid}) async {
    final res = await ServicesRepository.openSaved(orderid: orderid);
    await router.popAndPush(
      OrderRoute(
          orderPageType: OrderPageType.editOrder,
          order: OrderModel(
              orderinfo: OrderInfoModel(
                orderid: orderid,
                waiter_name: authState.currentUser!.fio,
                cashid: 1,
                created_at: res.orderinfo.created_at,
                saleprice: res.orderinfo.saleprice,
                deptamount: res.orderinfo.deptamount,
                paidamount: res.orderinfo.paidamount,
                paidamountcard: res.orderinfo.paidamountcard,
              ),
              basket: <BasketItemModel>[
                for (int i = 0; i < res.basket.length; i++)
                  BasketItemModel(
                    quantity: res.basket[i].quantity,
                    code: res.basket[i].code,
                    name: res.basket[i].name,
                    adg: res.basket[i].adg,
                    deletepersonid: res.basket[i].deletepersonid,
                    edizm: res.basket[i].edizm,
                    flag: res.basket[i].flag,
                    id: res.basket[i].id,
                    kname: res.basket[i].kname,
                    realprice: res.basket[i].realprice,
                    modifrequired: res.basket[i].modifrequired,
                    recorddate: res.basket[i].recorddate,
                    modifiers: res.basket[i].modifiers,
                    modifiresListItem: res.basket[i].modifiresListItem,
                    saleprice: res.basket[i].saleprice,
                  )
              ]),
          basket: res.basket,
          onShowPayment: () {}),
    );
  }

  Future<void> onTabTable({
    required TableModel table,
  }) async {
    var guestsCount = 1;
    final res = await onShowGuestCountModal(
      context: context,
      table: table,
      title: 'numberOfGuests'.tr(),
    );
    // if (res != null) {
    //   guestsCount = int.parse(res);
    //   await onCreateOrder(
    //     guestsCount: guestsCount,
    //     table: table,
    //   );
    // }
  }

  // Future<void> onCreateOrder({
  //   required int guestsCount,
  //   required TableModel table,
  // }) async {
  //   try {
  //     loadingState.startLoading();
  //     final order = OrderModel(
  //       orderinfo: OrderInfoModel(
  //         k_g: guestsCount,
  //         waiter_name: authState.currentUser!.fio,
  //         cashid: 1,
  //         table_name: table.n_t,
  //       ),
  //     );
  //     final createdOrder = await basketState.createOrder(
  //       createdOrder: order,
  //     );
  //     await router.popAndPush(
  //       OrderRoute(
  //         orderPageType: OrderPageType.createOrder,
  //         order: createdOrder,
  //         basket: [],
  //         onShowPayment: () {},
  //       ),
  //     );
  //   } catch (e) {
  //     await UiUtils.errorModal(
  //       context: context,
  //       errorCode: 'errors.any',
  //     );
  //   } finally {
  //     loadingState.stopLoading();
  //   }
  // }

  void whenTableIsBusy() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'tableIsBusy'.tr(),
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColors.red),
            textAlign: TextAlign.center,
          ),
          children: [
            TextButton(
              onPressed: router.pop,
              child: Text(
                'done'.tr(),
              ),
            ),
          ],
        );
      },
    );
  }
}
