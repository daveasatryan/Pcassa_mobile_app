// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/constants/custom_icons.dart';
import 'package:pcassa_retail_mobile/models/basket_item_model/basket_item_model.dart';
import 'package:pcassa_retail_mobile/popups/discount_modal.dart';
import 'package:pcassa_retail_mobile/screens/order_screen/widgets/actions_part.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';
import 'package:pcassa_retail_mobile/store/payment_state/payment_state.dart';
import 'package:pcassa_retail_mobile/widgets/app_icons.dart';
import '../../constants/context_varebale.dart';
import '../../constants/order_page_types.dart';
import '../../models/order_model/order_model.dart';
import '../../popups/payment_modal.dart';
import '../../store/basket_state/basket_state.dart';
import '../../store/loading/loading_state.dart';
import '../../themes/app_colors.dart';
import '../../widgets/basket/basket_widget.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/header_content.dart';
import '../../widgets/loading_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OrderScreen extends StatefulWidget {
  static String textValue = '';
  static TextEditingController codeContrallerText = TextEditingController();
  static FocusNode myFocusNode = FocusNode();
  static TextEditingController? controllerText;
  OrderScreen({
    Key? key,
    required this.order,
    required this.orderPageType,
    required this.basket,
    required this.onShowPayment,
    this.page,
  }) : super(key: key);
  int? page;
  final OrderPageType orderPageType;
  final OrderModel order;
  final VoidCallback? onShowPayment;
  final List<BasketItemModel> basket;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final loadingState = LoadingState();
  final basketState = GetIt.I<BasketState>();
  final paymentState = GetIt.I<PaymentState>();
  final player = AudioPlayer();
  final authState = GetIt.I<AuthState>();

  bool discount_product = true;
  bool change_price = true;
  bool surcharge = true;
  bool pay = true;
  bool delete_item = true;

  // ScanController controllerScan = ScanController();

  String _scanTxt = 'No Scan';
  //String titleInput = 'search_by_barcode'.tr();
  //bool hideScan = false;

  @override
  void initState() {
    super.initState();
    OrderScreen.controllerText = TextEditingController();
    basketState.order = widget.order;
    basketState.basket = widget.basket;
    widget.order.orderinfo.orderid;
    basketState.buttonIdentifire = "cart_mode".tr();
    OrderScreen.textValue = "searchByCode";
    //OrderScreen.myFocusNode.requestFocus();
  }

  @override
  void dispose() {
    basketState.order = null;
    basketState.basket.clear();
    if (basketState.focusNode.hasFocus) {
      basketState.focusNode.dispose();
    }
    super.dispose();
  }

  // var keyboardType = TextInputType.text;
  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    if (authState.quick_check!.contains("discount_product")) {
      discount_product = false;
    }
    if (authState.quick_check!.contains("change_price")) {
      change_price = false;
    }
    if (authState.quick_check!.contains("surcharge")) {
      surcharge = false;
    }
    if (authState.quick_check!.contains("pay")) {
      pay = false;
    }
    if (authState.quick_check!.contains("delete_item")) {
      delete_item = false;
    }

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final isKeyboard = mediaQueryData.viewInsets.bottom != 0;
    int orderId = int.parse(widget.order.orderinfo.orderid);

    if (!isKeyboard) {}
    return Scaffold(
      appBar: CustomAppBar(
        pageCounter: 0,
        orderId: orderId,
        title: widget.orderPageType.title.tr(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      HeaderContent(order: widget.order),

                      const SizedBox(width: 2),

                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3.5,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: BasketWidget(
                              orderId: orderId,
                              basketHeight: isKeyboard == true ? 3.5 : 6.0,
                              delete_item: delete_item),
                        ),
                      ),

                      const SizedBox(width: 2),

                      //  const Expanded(flex: 4, child: MenuPart()),
                    ],
                  ),
                  Observer(
                    builder: (_) => loadingState.isLoading
                        ? const LoadingWidget()
                        : const SizedBox(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: darkModeOn == false
                              ? AppColors.white
                              : AppColors.darkGray),
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                color: darkModeOn
                                    ? Colors.black26
                                    : AppColors.mediumGray,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('orderCost'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              color: darkModeOn
                                                  ? AppColors.white
                                                  : AppColors.darkGray,
                                            )),
                                    Observer(
                                      builder: (_) => Text(
                                          "${GetIt.I<BasketState>().order?.orderinfo.saleprice}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                color: darkModeOn
                                                    ? AppColors.white
                                                    : AppColors.darkGray,
                                              )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: ActionsPart(
                                    textController: OrderScreen.controllerText!,
                                    discount_product: discount_product,
                                    change_price: change_price,
                                    delete_item: delete_item,
                                    pay: pay,
                                    surcharge: surcharge),
                              ),
                              SizedBox(
                                height: 42,
                              ),
                              Observer(builder: (_) {
                                return SizedBox(
                                  //   alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,

                                  child: Column(
                                    children: [
                                      basketState.buttonIdentifire ==
                                              "cart_mode"
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomButton(
                                                  backgroundColor: darkModeOn
                                                      ? Colors.black26
                                                      : AppColors.mediumGray,
                                                  onTap: () async {
                                                    await scanCode();
                                                    print(_scanTxt);
                                                    if (_scanTxt != "-1") {
                                                      await basketState
                                                          .onSearchBarCode(
                                                              _scanTxt,
                                                              context,
                                                              1);

                                                      basketState.excise == true
                                                          ? await scanCode()
                                                          : null;

                                                      basketState.excise == true
                                                          ? await basketState
                                                              .onSearchExise(
                                                                  basketState
                                                                      .kod_tov,
                                                                  _scanTxt,
                                                                  basketState
                                                                      .order!
                                                                      .orderinfo
                                                                      .orderid,
                                                                  context,
                                                                  1)
                                                          : null;
                                                    }
                                                    setState(() {
                                                      basketState
                                                              .buttonIdentifire =
                                                          "cart_mode";
                                                      print(basketState
                                                          .buttonIdentifire);
                                                    });
                                                  },
                                                  minimumSize: Size(85, 85),
                                                  child: Column(
                                                    children: [
                                                      SvgPicture.asset(
                                                          CustomIcons.scan,
                                                          width: 36,
                                                          height: 36,
                                                          color: darkModeOn ==
                                                                  false
                                                              ? AppColors
                                                                  .darkGray
                                                              : AppColors.white,
                                                          semanticsLabel:
                                                              'Label'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "searchByScanner".tr(),
                                                        style: TextStyle(
                                                            color: darkModeOn
                                                                ? AppColors
                                                                    .white
                                                                : AppColors
                                                                    .darkGray),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                CustomButton(
                                                  backgroundColor: darkModeOn
                                                      ? Colors.black26
                                                      : AppColors.mediumGray,
                                                  onTap: () {
                                                    onShowDiscountModal(
                                                      hideBottomSheet: false,
                                                      context: context,
                                                      title:
                                                          'discountsAndMarkups'
                                                              .tr(),
                                                      onTop: scanCode,
                                                    );
                                                  },
                                                  minimumSize: Size(85, 85),
                                                  child: Column(
                                                    children: [
                                                      AppIcons(
                                                        icon: Icons
                                                            .content_paste_search_outlined,
                                                        size: 36,
                                                        iconColor: darkModeOn ==
                                                                false
                                                            ? AppColors.darkGray
                                                            : AppColors.white,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "searchByName".tr(),
                                                        style: TextStyle(
                                                            color: darkModeOn
                                                                ? AppColors
                                                                    .white
                                                                : AppColors
                                                                    .darkGray),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                CustomButton(
                                                  backgroundColor: darkModeOn
                                                      ? Colors.black26
                                                      : AppColors.mediumGray,
                                                  onTap: () {
                                                    setState(() {
                                                      basketState
                                                              .buttonIdentifire =
                                                          "serachByCode";
                                                    });
                                                  },
                                                  minimumSize: Size(85, 85),
                                                  child: Column(
                                                    children: [
                                                      SvgPicture.asset(
                                                          CustomIcons.code,
                                                          width: 36,
                                                          height: 36,
                                                          color: darkModeOn ==
                                                                  false
                                                              ? AppColors
                                                                  .darkGray
                                                              : AppColors.white,
                                                          semanticsLabel:
                                                              'Label'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "searchByCode".tr(),
                                                        style: TextStyle(
                                                          color: darkModeOn
                                                              ? AppColors.white
                                                              : AppColors
                                                                  .darkGray,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : basketState.buttonIdentifire ==
                                                      "serachByCode" ||
                                                  basketState
                                                          .buttonIdentifire ==
                                                      "price_mode"
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0,
                                                          right: 20.0),
                                                  child: Container(
                                                    child: Observer(
                                                        builder: (context) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 3,
                                                                child:
                                                                    Container(
                                                                  // width: 200,
                                                                  child:
                                                                      TextField(
                                                                    scrollPadding:
                                                                        EdgeInsets.only(
                                                                            bottom:
                                                                                30),
                                                                    focusNode:
                                                                        OrderScreen
                                                                            .myFocusNode,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .characters,

                                                                    controller:
                                                                        OrderScreen
                                                                            .codeContrallerText,
                                                                    //style: TextStyle(color: AppColors.black),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,

                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText: basketState.buttonIdentifire ==
                                                                              "serachByCode"
                                                                          ? "writeCode"
                                                                              .tr()
                                                                          : "writeNewSumm"
                                                                              .tr(),
                                                                      filled:
                                                                          false,
                                                                      fillColor:
                                                                          AppColors
                                                                              .white,
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide: const BorderSide(
                                                                            width:
                                                                                1,
                                                                            color:
                                                                                AppColors.purple),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide: const BorderSide(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                AppColors.mediumGray),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Observer(
                                                                    builder:
                                                                        (context) {
                                                                  return CustomButton(
                                                                    minimumSize:
                                                                        Size(
                                                                            150,
                                                                            47),
                                                                    backgroundColor: darkModeOn ==
                                                                            false
                                                                        ? AppColors
                                                                            .purple
                                                                        : AppColors
                                                                            .purple,
                                                                    onTap: basketState.titleInput == "Write exise".tr() ||
                                                                            basketState.buttonIdentifire ==
                                                                                "serachByCode".tr()
                                                                        ? onSerarch
                                                                        : basketState.buttonIdentifire == "price_mode".tr()
                                                                            ? onPrice
                                                                            : basketState.titleInput == "discount_percentage".tr()
                                                                                ? onDiscount
                                                                                : basketState.titleInput == "number".tr()
                                                                                    ? onCounterAdd
                                                                                    : basketState.titleInput == "numberM".tr()
                                                                                        ? onCounterMinus
                                                                                        : null,
                                                                    child:
                                                                        AppIcons(
                                                                      iconColor: darkModeOn
                                                                          ? AppColors
                                                                              .white
                                                                          : AppColors
                                                                              .darkGray,
                                                                      icon: Icons
                                                                          .check,
                                                                      size: 36,
                                                                    ),
                                                                  );
                                                                }),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                                  ),
                                                )
                                              : basketState.buttonIdentifire ==
                                                      "calculate_mode"
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0,
                                                              right: 20.0),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                              child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child:
                                                                    CustomButton(
                                                                  onTap:
                                                                      () async {
                                                                    if (OrderScreen
                                                                        .controllerText!
                                                                        .text
                                                                        .isEmpty) {
                                                                      setState(
                                                                          () {
                                                                        OrderScreen
                                                                            .controllerText!
                                                                            .text = "0";
                                                                      });
                                                                    }
                                                                    if (!basketState
                                                                            .basketIsEmpty &&
                                                                        OrderScreen.controllerText!.text !=
                                                                            basketState.selectedBasketItem!.quantity
                                                                                .toString() &&
                                                                        basketState.selectedBasketItem !=
                                                                            null) {
                                                                      onCounterAdd();
                                                                    } else {
                                                                      if (OrderScreen
                                                                          .controllerText!
                                                                          .text
                                                                          .isEmpty) {
                                                                        setState(
                                                                            () {
                                                                          OrderScreen
                                                                              .controllerText!
                                                                              .text = "0";
                                                                        });
                                                                      }
                                                                      if (basketState
                                                                              .basketIsEmpty ||
                                                                          basketState.selectedBasketItem ==
                                                                              null ||
                                                                          basketState.selectedBasketItem!.excise !=
                                                                              "") {
                                                                        null;
                                                                      } else {
                                                                        await basketState.onDecrementBasketItem(
                                                                            basketState.selectedBasketItem!.code,
                                                                            "",
                                                                            4);
                                                                        if (!basketState
                                                                            .basketIsEmpty) {
                                                                          setState(
                                                                              () {
                                                                            OrderScreen.controllerText!.text =
                                                                                basketState.selectedBasketItem!.quantity.toString();
                                                                          });
                                                                        }
                                                                      }
                                                                    }
                                                                  },
                                                                  child:
                                                                      AppIcons(
                                                                    icon: Icons
                                                                        .remove,
                                                                    iconColor: darkModeOn
                                                                        ? AppColors
                                                                            .white
                                                                        : AppColors
                                                                            .darkGray,
                                                                  ),
                                                                  minimumSize:
                                                                      Size(50,
                                                                          50),
                                                                  backgroundColor: darkModeOn
                                                                      ? Colors
                                                                          .black26
                                                                      : AppColors
                                                                          .mediumGray,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 85,
                                                                child:
                                                                    TextFormField(
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  scrollPadding:
                                                                      EdgeInsets.only(
                                                                          bottom:
                                                                              10),
                                                                  controller:
                                                                      OrderScreen
                                                                          .controllerText,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    filled:
                                                                        false,
                                                                    fillColor: darkModeOn
                                                                        ? Colors
                                                                            .black26
                                                                        : AppColors
                                                                            .white,
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          width:
                                                                              1,
                                                                          color: darkModeOn
                                                                              ? Colors.black26
                                                                              : AppColors.purple),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          width:
                                                                              2,
                                                                          color: darkModeOn
                                                                              ? Colors.black26
                                                                              : AppColors.mediumGray),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                child:
                                                                    CustomButton(
                                                                  onTap:
                                                                      () async {
                                                                    if (OrderScreen
                                                                        .controllerText!
                                                                        .text
                                                                        .isEmpty) {
                                                                      setState(
                                                                          () {
                                                                        OrderScreen
                                                                            .controllerText!
                                                                            .text = "0";
                                                                      });
                                                                    }
                                                                    if (!basketState
                                                                            .basketIsEmpty &&
                                                                        OrderScreen.controllerText!.text !=
                                                                            basketState.selectedBasketItem!.quantity
                                                                                .toString() &&
                                                                        basketState.selectedBasketItem !=
                                                                            null) {
                                                                      onCounterAdd();
                                                                    } else {
                                                                      if (basketState
                                                                              .basketIsEmpty ||
                                                                          basketState.selectedBasketItem ==
                                                                              null ||
                                                                          basketState.selectedBasketItem!.excise !=
                                                                              "") {
                                                                        null;
                                                                      } else
                                                                        basketState.titleInput =
                                                                            "number".tr();
                                                                      basketState
                                                                          .focusNode
                                                                          .requestFocus();
                                                                      basketState.basketIsEmpty ||
                                                                              basketState.selectedBasketItem ==
                                                                                  null
                                                                          ? null
                                                                          : await basketState.onIncrementBasketItem(
                                                                              basketState.selectedBasketItem!.code,
                                                                              '',
                                                                              4);

                                                                      if (!basketState
                                                                          .basketIsEmpty) {
                                                                        setState(
                                                                            () {
                                                                          OrderScreen.controllerText!.text = basketState
                                                                              .selectedBasketItem!
                                                                              .quantity
                                                                              .toString();
                                                                        });
                                                                      }

                                                                      // widget.textController.clear();
                                                                      // widget.textController.text = '';

                                                                      ///
                                                                    }
                                                                  },
                                                                  backgroundColor: darkModeOn
                                                                      ? Colors
                                                                          .black26
                                                                      : AppColors
                                                                          .mediumGray,
                                                                  child:
                                                                      AppIcons(
                                                                    icon: Icons
                                                                        .add,
                                                                    iconColor: darkModeOn
                                                                        ? AppColors
                                                                            .white
                                                                        : AppColors
                                                                            .darkGray,
                                                                  ),
                                                                  minimumSize:
                                                                      Size(50,
                                                                          50),
                                                                ),
                                                              )
                                                            ],
                                                          )),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: CustomButton(
                                                                onTap: () {
                                                                  if (OrderScreen
                                                                      .controllerText!
                                                                      .text
                                                                      .isEmpty) {
                                                                    setState(
                                                                        () {
                                                                      OrderScreen
                                                                          .controllerText!
                                                                          .text = "0";
                                                                    });
                                                                  }
                                                                  if (!basketState
                                                                          .basketIsEmpty &&
                                                                      OrderScreen
                                                                              .controllerText!
                                                                              .text !=
                                                                          basketState
                                                                              .selectedBasketItem!
                                                                              .quantity
                                                                              .toString() &&
                                                                      basketState
                                                                              .selectedBasketItem !=
                                                                          null) {
                                                                    onCounterAdd();
                                                                  }
                                                                },
                                                                backgroundColor: darkModeOn
                                                                    ? Colors
                                                                        .black26
                                                                    : AppColors
                                                                        .mediumGray,
                                                                minimumSize:
                                                                    Size(220,
                                                                        55),
                                                                child: Text(
                                                                    "addCount"
                                                                        .tr(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: darkModeOn
                                                                          ? AppColors
                                                                              .white
                                                                          : AppColors
                                                                              .darkGray,
                                                                    ))),
                                                          ),
                                                        ],
                                                      ))
                                                  : basketState
                                                              .buttonIdentifire ==
                                                          "discount_mode"
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CustomButton(
                                                              backgroundColor:
                                                                  AppColors
                                                                      .mediumGray,
                                                              onTap:
                                                                  () async {},
                                                              minimumSize:
                                                                  Size(85, 85),
                                                              child: Column(
                                                                children: [
                                                                  AppIcons(
                                                                    icon: Icons
                                                                        .percent,
                                                                    size: 36,
                                                                    iconColor:
                                                                        AppColors
                                                                            .darkGray,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "discountSelectedItem",
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .darkGray),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            CustomButton(
                                                              backgroundColor:
                                                                  AppColors
                                                                      .mediumGray,
                                                              onTap: () {},
                                                              minimumSize:
                                                                  Size(85, 85),
                                                              child: Column(
                                                                children: [
                                                                  AppIcons(
                                                                    icon: Icons
                                                                        .percent,
                                                                    size: 36,
                                                                    iconColor:
                                                                        AppColors
                                                                            .darkGray,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "discountCheque",
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .darkGray),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Text(("d")),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      //
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top),
          child: Container(
            color: darkModeOn ? AppColors.darkGray : AppColors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20, bottom: isKeyboard == false ? 16 : 0),
              child: SizedBox(
                width: MyUtility(context).width,
                child: Observer(
                  builder: (_) => CustomButton(
                      minimumSize: Size(330, 55),
                      backgroundColor: darkModeOn
                          ? basketState.basketIsEmpty
                              ? AppColors.lightPurple
                              : AppColors.purple
                          : basketState.basketIsEmpty
                              ? AppColors.lightPurple
                              : AppColors.purple,
                      onTap: () {
                        if (pay != true) {
                          AppSettings.toast(text: "permission".tr());
                        } else if (GetIt.I<BasketState>().basketIsEmpty) {
                          null;
                        } else {
                          int orderIdInt =
                              int.parse(basketState.order!.orderinfo.orderid);
                          onShowPaymentModal(orderid: orderIdInt);
                        }
                      },
                      // pay == true
                      //     ? GetIt.I<BasketState>().basketIsEmpty
                      //         ? null
                      //         : onShowPaymentModal

                      //     : null,
                      // backgroundColor: AppColors.darkPurple,
                      overlayColor: Colors.transparent,
                      child: Text(
                        'pay'.tr(),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: darkModeOn
                                  ? AppColors.white
                                  : AppColors.darkGray,
                            ),
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
    );
  }

  Future<void> getCurrencie({required int orderid}) async {
    await paymentState.getCurrencies(orderid: orderid);
  }

  void onShowPaymentModal({required int orderid}) async {
    await getCurrencie(orderid: orderid);

    await showBarModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (_) => PaymentModal(),
    );
  }

  Future<void> scanCode() async {
    String scanRes;

    scanRes = await FlutterBarcodeScanner.scanBarcode(
        '#28386a', 'Cancel', true, ScanMode.BARCODE);

    if (!mounted) return;

    setState(() {
      _scanTxt = scanRes;
    });
  }

  void onSerarch() async {
    basketState.excise == true
        ? await basketState.onSearchExise(
            basketState.kod_tov,
            OrderScreen.codeContrallerText.text,
            basketState.order!.orderinfo.orderid,
            context,
            1)
        : await basketState.onSearchBarCode(
            OrderScreen.codeContrallerText.text, context, 1);

    OrderScreen.codeContrallerText.clear();
    OrderScreen.codeContrallerText.text = '';
    if (basketState.excise == true) {
      basketState.titleInput = "Write exise".tr();
      OrderScreen.myFocusNode.requestFocus();
    } else {
      basketState.titleInput = "search_by_barcode".tr();
      OrderScreen.myFocusNode.requestFocus();
    }
    OrderScreen.myFocusNode.unfocus();
    // setState(() {
    //   //  myFocusNode.unfocus();
    //   Future.delayed(const Duration(milliseconds: 50)).then((value) {
    //     OrderScreen.myFocusNode.requestFocus();
    //   });
    // });
  }

  void onPrice() async {
    OrderScreen.myFocusNode.unfocus();
    setState(() {
      //  myFocusNode.unfocus();
      Future.delayed(const Duration(milliseconds: 50)).then((value) {
        OrderScreen.myFocusNode.requestFocus();
      });
    });
    basketState.titleInput = "new_amount".tr();

    if (basketState.basketIsEmpty) {
    } else {
      await basketState.onPrice(basketState.selectedBasketItem!.code,
          OrderScreen.codeContrallerText.text);
    }
    setState(() {
      OrderScreen.codeContrallerText.clear();
      OrderScreen.codeContrallerText.text = '';
    });
  }

  void onDiscount() {
    OrderScreen.myFocusNode.unfocus();
    setState(() {
      //  myFocusNode.unfocus();
      Future.delayed(const Duration(milliseconds: 50)).then((value) {
        OrderScreen.myFocusNode.requestFocus();
      });
    });
    basketState.titleInput = "discount_percentage".tr();
    basketState.basketIsEmpty || basketState.selectedBasketItem == null
        ? null
        : basketState.onDiscountItem(OrderScreen.controllerText!.text,
            basketState.selectedBasketItem!.code);

    setState(() {
      OrderScreen.controllerText!.clear();
      OrderScreen.controllerText!.text = '';
    });
  }

  void onCounterAdd() async {
    OrderScreen.myFocusNode.unfocus();
    setState(() {
      //  myFocusNode.unfocus();
      Future.delayed(const Duration(milliseconds: 50)).then((value) {
        OrderScreen.myFocusNode.requestFocus();
      });
    });
    basketState.basketIsEmpty || basketState.selectedBasketItem == null
        ? null
        : await basketState.onIncrementBasketItem(
            basketState.selectedBasketItem!.code,
            OrderScreen.controllerText!.text,
            4);
    // setState(() {
    //   OrderScreen.controllerText!.clear();
    //   OrderScreen.controllerText!.text = '';
    // });
  }

  void onCounterMinus() async {
    basketState.basketIsEmpty || basketState.selectedBasketItem == null
        ? null
        : await basketState.onDecrementBasketItem(
            basketState.selectedBasketItem!.code,
            OrderScreen.controllerText!.text,
            4);
    setState(() {
      OrderScreen.controllerText!.text =
          basketState.selectedBasketItem!.quantity.toString();
    });
  }
}
