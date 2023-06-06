// ignore_for_file: prefer_const_constructors, unnecessary_parenthesis, cascade_invocations

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/constants/order_page_types.dart';
import 'package:pcassa_retail_mobile/models/order_info_model/order_info_model.dart';
import 'package:pcassa_retail_mobile/models/order_model/order_model.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';
import 'package:pcassa_retail_mobile/store/basket_state/basket_state.dart';
import 'package:pcassa_retail_mobile/store/loading/loading_state.dart';
import 'dart:math';
import '../constants/assets.dart';
import '../router.gr.dart';
import '../services.dart';
import '../store/payment_state/payment_state.dart';
import '../store/services_state/services_state.dart';
import '../themes/app_colors.dart';
import '../utils/error_handler.dart';
import '../widgets/custom_button.dart';
import 'widgets/modal_header.dart';

class PaymentModal extends StatefulWidget {
  const PaymentModal({Key? key}) : super(key: key);

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  final _textController = TextEditingController();
  final paymentState = GetIt.I<PaymentState>();
  final basketState = GetIt.I<BasketState>();
  final authState = GetIt.I<AuthState>();
  final loadingState = LoadingState();

  List waletsPayedList = [];
  final String inputValue = '';

  String value = '0.0';
  String valuePaid = '0.0';
  int payingNumber = 0;
  @override
  void initState() {
    super.initState();

    _textController.text = "${paymentState.saleprice! - paymentState.paid!}";

    paymentState.basketState.basketSum != paymentState.saleprice;
    double inputInitialValue = double.parse(_textController.text);
    paymentState.inputAmount = inputInitialValue;
    print(paymentState.basketState.basketSum);

    // value =
    //     '${paymentState.basketState.basketSum - double.parse(_textController.text)}';

    // _textController.addListener(() {
    //   //here you have the changes of your textfield
    //   // print("value: ${_textController.text}");
    //   //use setState to rebuild the widget
    //   setState(() {
    //     _textController.text;
    //   });
    // });

    paymentState.isPayed = null;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    paymentState
      ..isPayed = null
      ..typedValue = ''
      ..selectedCurrency = null;
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboard = false;
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    onClean() {
      print(paymentState.basketState.basketSum);
      _textController.clear();

      setState(() {
        value = '${0 - paymentState.saleprice! + paymentState.paid!}';
        double valuePaidDouble = double.parse(value);
        if (valuePaidDouble < 0) {
          value = "0.0";
        }
      });
      paymentState.valueParseToDouble = 0.0;
      print(paymentState.basketState.basketSum);
    }

    return Scaffold
    (
      resizeToAvoidBottomInset: false,
      body: InkWell(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: darkModeOn == false ? AppColors.white : AppColors.darkGray,
          height: height * 0.8,
          child: Stack(
            children: [
              Column(
                children: [
                  ModalHeader(
                    width: width,
                    title: 'payment'.tr(),
                    hasBorder: false,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: darkModeOn == false
                              ? AppColors.white
                              : AppColors.darkGray,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'cost'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(color:darkModeOn?AppColors.white: AppColors.darkGray),
                                ),
                                Observer(
                                  builder: (_) => Text(
                                    "${paymentState.saleprice}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(color:darkModeOn?AppColors.white: AppColors.darkGray),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    'contributed'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color:darkModeOn?AppColors.white: AppColors.darkGray),
                                  ),
                                ),
                                Observer(
                                    builder: (_) =>
                                        // ignore: prefer_const_constructors
                                        Expanded(
                                          flex: 1,
                                          child: TextFormField(
                                            // enabled: isInput,
                                            onTap: onClean,
                                            onChanged: (values) {
                                              if (values.isEmpty) {
                                                values = "0.0";
                                                paymentState.valueParseToDouble =
                                                    0.0;
                                                _textController.clear();
                                              } else {
                                                paymentState.valueParseToDouble =
                                                    double.parse(values);
                                              }
                                              final paid =
                                                  double.parse(valuePaid);
    
                                              print("paid $paid");
    
                                              var changeValue =
                                                  paymentState.saleprice! -
                                                      paymentState.paid!;
    
                                              print("change $changeValue");
    
                                              setState(() {
                                                value = values.isEmpty
                                                    ? "${paymentState.saleprice! - paymentState.paid!}"
                                                    : '${double.parse(values) - changeValue}';
                                                double valuePaidDouble =
                                                    double.parse(value);
                                                if (valuePaidDouble < 0) {
                                                  value = "0.0";
                                                }
                                                print("input $value");
                                              });
    
                                              if (_textController
                                                  .text.isNotEmpty) {
                                                paymentState.inputAmount =
                                                    double.parse(
                                                        _textController.text);
                                              }
                                            },
    
                                            textAlign: TextAlign.end,
                                            controller: _textController,
                                            keyboardType: TextInputType.number,
                                            autofocus: isKeyboard,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    color:darkModeOn?AppColors.white: AppColors.darkGray),
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: AppColors
                                                        .mediumGray), //<-- SEE HERE
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                //<-- SEE HERE
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: AppColors.mediumGray),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.all(10.0),
                                              filled: false,
                                              hintText: '',
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    103, 255, 255, 255),
                                                fontSize: 28,
                                                letterSpacing: 0.04,
                                              ),
                                            ),
                                          ),
                                        )),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'paid'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(color:darkModeOn?AppColors.white: AppColors.darkGray),
                                ),
                                //if (_)
                                // Text(
                                //   '${paymentState.basketState.basketSum}',
                                //   style: Theme.of(context).textTheme.headline3,
                                // )
                                // else
    
                                Text(
                                  "${paymentState.paid}",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ],
                            )),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'surrender'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: AppColors.red),
                                ),
                                //if (_)
                                // Text(
                                //   '${paymentState.basketState.basketSum}',
                                //   style: Theme.of(context).textTheme.headline3,
                                // )
                                // else
    
                                Text(
                                  value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: AppColors.red),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: paymentState.currencies
                              .map(
                                (paymentMethod) => Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Observer(builder: (_) {
                                    // if (paymentState.listPayidValets
                                    //     .contains(paymentMethod.tip)) {
                                    //   paymentState.selectedCurrency == null;
                                    // }
    
                                    return CustomButton(
                                      onTap: () {
                                        print(paymentMethod.name);
                                        print(paymentMethod.tip);
    
                                        FocusScope.of(context).unfocus();
                                        paymentState.selectedCurrency =
                                            paymentMethod;
    
                                        paymentState.tip = paymentMethod.tip;
                                      },
                                      backgroundColor:
                                          paymentState.selectedCurrency?.cod ==
                                                  paymentMethod.cod
                                              ?darkModeOn?AppColors.purple: AppColors.lightPurple
                                              : AppColors.mediumGray,
                                      foregroundColor:
                                          paymentState.selectedCurrency?.cod ==
                                                  paymentMethod.cod
                                              ?darkModeOn?AppColors.white: AppColors.darkGray
                                              : AppColors.darkGray,
                                      minimumSize: Size(width, 55),
                                      child: Text(paymentMethod.name),
                                    );
                                  }),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Observer(
                builder: (_) => paymentState.isPayed != null
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: AppColors.blue.withOpacity(0.3),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              paymentState.isPayed == true
                                  ? Assets.checkMark
                                  : Assets.error,
                              controller: animationController,
                              width: 240,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
              Observer(builder: (_) {
                double valueChangeElse = double.parse(value);
                String valueChangeElseString = "${valueChangeElse * -1}";
                return paymentState.paymentLoading.isLoading
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: AppColors.blue.withOpacity(0.3),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    valueChangeElse >= 0
                                        ? 'surrender'.tr()
                                        : 'surplus'.tr(),
                                    style: Theme.of(context).textTheme.headline2,
                                  ),
                                  Observer(
                                    builder: (_) => Text(
                                      valueChangeElse >= 0
                                          ? value
                                          : valueChangeElseString,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IgnorePointer(
                              ignoring: false,
                              child: Lottie.asset(
                                Assets.printingAnimation,
                                width: 240,
                              ),
                            )
                          ],
                        ),
                      )
                    : const SizedBox();
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        
        child: Align(
      
                alignment: Alignment.bottomCenter,
                child: Container(
                  color:darkModeOn?AppColors.darkGray: AppColors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                        children: [
                          Expanded(
                            child:           Padding(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: isKeyboard == false ? 16 : 0),
                                    child: SizedBox(
                                      width: MyUtility(context).width,
                                      child:
                           Observer(builder: (_) {
                                final valueParseToDouble = double.parse(value);
                                return CustomButton(
                                   minimumSize: Size(330, 55),
                                          backgroundColor:darkModeOn?AppColors.purple: AppColors.lightPurple,
                                    onTap: paymentState.selectedCurrency != null
                                        ? () {
                                            confirmPayment();
                                          }
                                        : null,
                      
                                    foregroundColor: AppColors.darkGray,
                                    child: Text(
                                      'pay'.tr(),
                                      style: TextStyle(fontSize: 24, color: darkModeOn?AppColors.white:AppColors.darkGray),
                                    ));
                              }),
                            ),)
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              
      ),
  floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
    );
    // bottomSheet: 
  }

  onTap(String value) {
    switch (value) {
      case 'Clear':
        paymentState.typedValue = '';
        break;
      case 'done':
        confirmPayment();
        break;
      default:
        {
          paymentState.typedValue = paymentState.typedValue + value;
        }
    }
  }

  Future<void> untilConfirmPayment() async {
    paymentState.inputAmount = double.parse(_textController.text);
    final servicesState = GetIt.I<ServicesState>();
    try {
      paymentState.isPayed = null;

      paymentState.paymentLoading.startLoading();
      await Future.delayed(const Duration(seconds: 3));
      await paymentState.paymentOrder();
      paymentState.paymentLoading.stopLoading();

      paymentState.isPayed = true;
      animationController.duration = const Duration(seconds: 2);
      await animationController.forward().whenComplete(() async {
        if (paymentState.isPayed == true) {
          paymentState.basketState.basket.clear();
          servicesState.categoriesFirstLevel.clear();

          try {
            final createdOrder = OrderModel(
              orderinfo: OrderInfoModel(
                cashid: 1,
                waiter_name: authState.currentUser?.fio ?? '',
              ),
            );

            final order =
                await basketState.createOrder(createdOrder: createdOrder);

            paymentState.isPayed = null;

            await router.push(
              OrderRoute(
                  order: order,
                  orderPageType: OrderPageType.quickOrder,
                  basket: [],
                  onShowPayment: () {}),
            );

            // paymentState.listPayidValets.clear();
          } catch (e) {
            await UiUtils.errorModal(
              context: context,
              errorCode: '',
            );
          } finally {
            loadingState.stopLoading();
          }
        }
      });
    } catch (e) {
      paymentState.isPayed = false;
      animationController
        ..duration = const Duration(seconds: 2)
        ..forward();
      await UiUtils.errorModal(
        context: context,
        errorCode: 'errors.any',
      );
    } finally {
      paymentState.paymentLoading.stopLoading();
    }
  }

  Future<void> confirmPayment() async {
    // paymentState.basketState.basketSum =
    //      paymentState.basketState.order?.orderinfo.saleprice.toDouble();

    final servicesState = GetIt.I<ServicesState>();
    try {
      paymentState.isPayed = null;
      if (paymentState.isPayed == null) {
        //isInput = true;
      }
      paymentState.paymentLoading.startLoading();
      await Future.delayed(const Duration(seconds: 3));
      await paymentState.paymentOrder();
      paymentState.paymentLoading.stopLoading();

      paymentState.isPayed = true;
      animationController.duration = const Duration(seconds: 2);
      await animationController.forward().whenComplete(() async {
        if (paymentState.isPayed == true) {
          print(paymentState.basketState.basketSum);
          // paymentState.basketState.basket.clear();
          servicesState.categoriesFirstLevel.clear();

          try {
            final createdOrder = OrderModel(
              orderinfo: OrderInfoModel(
                cashid: 1,
                waiter_name: authState.currentUser?.fio ?? '',
              ),
            );

            final order =
                await basketState.createOrder(createdOrder: createdOrder);

            if (paymentState.resInt == 0) {
              print("paymentState.resInt == 0");
              paymentState.selectedCurrency = null;
              final paid = double.parse(valuePaid);
              print("$paid");
              //0

              final inputValue = double.parse(_textController.text);
              print("$inputValue");
//200
              setState(() {
                payingNumber++;

                valuePaid = '${paymentState.inputAmount! + paid}';

                double valuePaidValid = double.parse(
                    '${paymentState.basketState.basketSum - paid}');

                print("${valuePaidValid}");

                final paids = double.parse(valuePaid);
                print("$paids");

                //print("$payMonay");

                print("${_textController.text}");

                //  isInput = false;
                value = "0.0";
                valuePaid = "${inputValue + paid}";
                final paidss = double.parse(valuePaid);
                // String payMonay =
                //     "${paymentState.basketState.basketSum - paidss}";

                _textController.text =
                    "${paymentState.basketState.basketSum - paidss}";
                print("$valuePaid");

                paymentState.inputAmount = double.parse(_textController.text);

                // waletsPayedList.add(paymentState.currencies[i].tip);

                // if (paymentState.currencies.length - waletsPayedList.length ==
                //     1) {

                // } else {
                //   print("object");
                // }
                // }
              });

              paymentState.isPayed = null;
            } else if (paymentState.resInt == 1) {
              print("paymentState.resInt == 1");
              await router.push(
                OrderRoute(
                    order: order,
                    orderPageType: OrderPageType.quickOrder,
                    basket: [],
                    onShowPayment: () {}),
              );
              //  paymentState.listPayidValets.clear();
              paymentState.basketState.basket.clear();
            }
          } catch (e) {
            await UiUtils.errorModal(
              context: context,
              errorCode: '',
            );
          } finally {
            loadingState.stopLoading();
          }
        }
      });
    } catch (e) {
      paymentState.isPayed = false;
      animationController
        ..duration = const Duration(seconds: 2)
        ..forward();
      await UiUtils.errorModal(
        context: context,
        errorCode: 'errors.any',
      );
    } finally {
      paymentState.paymentLoading.stopLoading();
    }
  }
}
