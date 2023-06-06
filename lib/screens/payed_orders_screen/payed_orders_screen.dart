import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/constants/order_page_types.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/models/basket_item_model/basket_item_model.dart';
import 'package:pcassa_retail_mobile/models/order_info_model/order_info_model.dart';
import 'package:pcassa_retail_mobile/models/order_model/order_model.dart';
import 'package:pcassa_retail_mobile/models/payment_close_order_model/close_payment_model.dart';
import 'package:pcassa_retail_mobile/router.gr.dart';
import 'package:pcassa_retail_mobile/services.dart';
import 'package:pcassa_retail_mobile/store/PaymentClose/payment_close_state.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import '../../popups/payed_order_modal.dart';
import '../../widgets/custom_text_field.dart';
import 'widget/payed_order_item.dart';

class PayedOrdersScreen extends StatefulWidget {
  PayedOrdersScreen({Key? key}) : super(key: key);

  @override
  State<PayedOrdersScreen> createState() => _PayedOrdersScreenState();
}

class _PayedOrdersScreenState extends State<PayedOrdersScreen> {
  final payment_close_state = Payment_close_state();
  final authState = GetIt.I<AuthState>();
  List<String> orderFilterList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getData({required String order_by}) async {
    // print(" authState.currentUser!.fio ${authState.currentUser!.fio}");
    await payment_close_state.paymentClose(
      waiter_name: authState.currentUser!.fio,
      order_by: order_by,
    );
  }

  Future<void> openSavedOrders({required String orderid}) async {
    final res = await ServicesRepository.openClosed(orderid: orderid);
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

  void show({required BuildContext context, required String orderId}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Text(
            "want_to_open_this_order".tr(),
            style: const TextStyle(color: AppColors.purple, fontSize: 14),
          ),
          content: Row(children: [
            TextButton(
              onPressed: () async {
                await openSavedOrders(
                  orderid: '$orderId',
                );
              },
              child: Text(
                "yes".tr(),
                style: TextStyle(color: AppColors.buttonColor),
              ),
            ),
            TextButton(
              onPressed: () {
                router.pop();
              },
              child: Text(
                "no".tr(),
                style: const TextStyle(color: AppColors.buttonColor),
              ),
            )
          ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    orderFilterList = [
      'paymentdate'.tr(),
      'chequenumber'.tr(),
      'created_at'.tr(),
      'saleprice'.tr()
    ];
    getData(order_by: "paymentdate");
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;

    print(authState.currentUser!.fio);
    print(payment_close_state.closeOrderList);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          // CustomTextField(
          //   showSuffixIcon: true,
          //   hintText: 'search'.tr(),
          // ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Observer(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DropdownSearch(
                        showClearButton: true,
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: orderFilterList,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "filter".tr(),
                          labelStyle: TextStyle(
                              color: darkModeOn
                                  ? AppColors.white
                                  : AppColors.darkGray),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.purple),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: darkModeOn == false
                              ? AppColors.mediumGray
                              : AppColors.darkGray,
                        ),
                        // popupItemDisabled: isItemDisabled,
                        onChanged: itemSelectionChanged,
                        //selectedItem: "",

                        showSearchBox: false,
                        // searchFieldProps: TextFieldProps(
                        //   decoration: InputDecoration(
                        //     hintText: "search".tr(),
                        //     hintStyle: TextStyle(
                        //       color: darkModeOn == true
                        //           ? AppColors.white
                        //           : AppColors.gray,
                        //     ),
                        //     filled: true,
                        //     fillColor: darkModeOn == false
                        //         ? AppColors.white
                        //         : AppColors.darkGray,
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(
                        //           width: 1, color: AppColors.purple),
                        //       borderRadius: BorderRadius.circular(10.0),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(
                        //           width: 2, color: AppColors.purple),
                        //       borderRadius: BorderRadius.circular(10.0),
                        //     ),
                        //   ),
                        //   cursorColor: AppColors.purple,
                        // ),
                      ),
                    );
                  }),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Observer(builder: (context) {
                      return Container(
                        width: double.infinity,
                        height: 550,
                        child: ListView.builder(
                          itemCount: payment_close_state.closeOrderList.length,

                          itemBuilder: (context, index) {
                            var item = payment_close_state.closeOrderList;

                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                clipBehavior: Clip.antiAlias,
                                margin: EdgeInsets.zero,
                                // child: Padding(
                                //   padding: const EdgeInsets.only(
                                //     top: 10,
                                //   ),

                                child: ExpansionTile(
                                  initiallyExpanded: true,
                                  iconColor: AppColors.white,
                                  trailing: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: darkModeOn
                                        ? AppColors.white
                                        : AppColors.darkGray,
                                  ),
                                  onExpansionChanged: (value) {
                                    setState(() {
                                      // isExpand = value;
                                    });
                                  },
                                  collapsedIconColor: darkModeOn
                                      ? Colors.black26
                                      : AppColors.mediumGray,
                                  collapsedBackgroundColor: darkModeOn
                                      ? Colors.black26
                                      : AppColors.mediumGray,
                                  backgroundColor: darkModeOn
                                      ? Colors.black26
                                      : AppColors.mediumGray,
                                  title: expandionTitile(item, index),
                                  subtitle: expandionSubTiltle(item, index),
                                  children: [
                                    expandionChildren(item, index),
                                  ],
                                ),

                                // InkWell(
                                //   onTap: () {
                                //     show(
                                //         context: context,
                                //         orderId: "${item[index].orderid}");
                                //   },
                                //   child: PayedOrderItem(
                                //     group_id: item[index].group_id,
                                //     orderid: item[index].orderid,
                                //     chequenumber: item[index].chequenumber,
                                //     waiter_name: item[index].waiter_name,
                                //     saleprice: item[index].saleprice,
                                //     created_at: item[index].created_at,
                                //     paymentdate: item[index].paymentdate,
                                //     items: item[index].items,
                                //   ),
                                // ),
                                //)
                              ),
                            );
                          },

                          //  PayedOrderItem(),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void itemSelectionChanged(String? s) {
    List<String> _orderFilterList = [
      'paymentdate',
      'chequenumber',
      'created_at',
      'saleprice'
    ];
    String itemList = "paymentdate";

    for (var i = 0; i < orderFilterList.length; i++) {
      if (i == 0) {
        itemList = "paymentdate";
      } else if (i == 1) {
        itemList = "chequenumber";
      } else if (i == 2) {
        itemList = "created_at";
      } else if (i == 3) {
        itemList = "saleprice";
      }

      if (s == orderFilterList[i]) {
        getData(order_by: itemList);
      }
    }
  }

  Container expandionChildren(List<ClosePaymentModel> item, int index) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      width: double.infinity,
      //  height: 130,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: item[index].items!.length,
        itemBuilder: (context, indexs) => Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: Text(
                    "${item[index].items![indexs].productname}",
                    style: TextStyle(
                        color: item[index].items![indexs].flag == 0
                            ? AppColors.darkGray
                            : AppColors.red,
                        fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${item[index].items![indexs].quantity}",
                    style: TextStyle(
                        color: item[index].items![indexs].flag == 0
                            ? AppColors.darkGray
                            : AppColors.red,
                        fontSize: 17),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 10.6,
                  ),
                  Text(
                    "${item[index].items![indexs].saleprice}",
                    style: TextStyle(
                        color: item[index].items![indexs].flag == 0
                            ? AppColors.darkGray
                            : AppColors.red,
                        fontSize: 17),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // List<String> SPRlist() {
  //   List<String> list = [];
  //   for (var i = 0; i < finance_operation_state.sprList.length; i++) {
  //     list.add(finance_operation_state.sprList[i].name!);
  //   }

  //   return list;
  // }

  Container expandionSubTiltle(List<ClosePaymentModel> item, int index) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            // InkWell(
            onTap: () {
              show(context: context, orderId: "${item[index].orderid}");
            },
            // child: PayedOrderItem(
            //   group_id: item[index].group_id,
            //   orderid: item[index].orderid,
            //   chequenumber: item[index].chequenumber,
            //   waiter_name: item[index].waiter_name,
            //   saleprice: item[index].saleprice,
            //   created_at: item[index].created_at,
            //   paymentdate: item[index].paymentdate,
            //   items: item[index].items,
            //   ),
            // ),
            //)

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Icon(
                    Icons.edit,
                    size: 16,
                    color: darkModeOn ? AppColors.white : AppColors.darkGray,
                  ),
                ),
                Flexible(
                  child: Text(
                    "edit".tr(),
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:
                            darkModeOn ? AppColors.white : AppColors.darkGray,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  "check_amount".tr(),
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: darkModeOn ? AppColors.white : AppColors.darkGray,
                      fontSize: 12),
                ),
              ),
              Flexible(
                child: Text(
                  "${item[index].saleprice}",
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: darkModeOn ? AppColors.white : AppColors.darkGray,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container expandionTitile(List<ClosePaymentModel> item, int index) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  "${"orderId".tr()}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: darkModeOn ? AppColors.white : AppColors.darkGray,
                      fontSize: 12),
                ),
              ),
              Flexible(
                child: Text(
                  "${item[index].chequenumber}",
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: darkModeOn ? AppColors.white : AppColors.darkGray,
                      fontSize: 12),
                ),
              ),
            ],
          ),
          Flexible(
            child: Text(
              "${item[index].created_at}",
              style: TextStyle(
                  color: darkModeOn ? AppColors.white : AppColors.darkGray,
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  void onShowPaymentModal(BuildContext context) {
    showBarModalBottomSheet(
      context: context,
      builder: (_) => const PayedOrderModal(),
    );
  }
}
