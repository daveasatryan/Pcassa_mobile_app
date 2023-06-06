import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/models/modifier_model/modifier_model.dart';
import 'package:pcassa_retail_mobile/screens/order_screen/order_screen.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/utils/error_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../http/repositories/services_repository.dart';
import '../../models/basket_item_model/basket_item_model.dart';
import '../../models/order_model/order_model.dart';
import '../../models/product_model/product_model.dart';
import '../services_state/services_state.dart';

part 'basket_state.g.dart';

class BasketState = BasketStateBase with _$BasketState;

abstract class BasketStateBase with Store {
  final servicesState = GetIt.I<ServicesState>();

  List<BasketItemModel> basket = <BasketItemModel>[];

  @observable
  List<ModifierModel> modifires = <ModifierModel>[];

  @observable
  BasketItemModel? selectedBasketItem;

  @observable
  String? buttonIdentifire;

  @observable
  OrderModel? order;

  @observable
  ProductModel? productModel;

  @observable
  bool? excise;

  @observable
  String exciseText = '';

  @observable
  String titleInput = '';

  @observable
  String textValue = "";

  @observable
  String kod_tov = "";

  @observable
  FocusNode focusNode = FocusNode();

  @action
  Future<OrderModel> createOrder({
    required OrderModel createdOrder,
  }) async {
    return await ServicesRepository.orderInfo(
      order: createdOrder,
    );
  }

  @action
  void onAddModifier(ModifierModel modifier) {
    // for (var i = 0; i < selectedBasketItem!.modifiers.length; i++) {
    //   if (basketState.selectedBasketItem!.modifiers[i].guid == modifier.guid) {
    //     basketState.selectedBasketItem!.modifiers[i] =
    //         basketState.selectedBasketItem!.modifiers[i].copyWith(
    //             count: basketState.selectedBasketItem!.modifiers[i].count + 1);
    //   }
    // }
    // servicesState.selectedBasketItem!.modifiers.add(modifier);
    //.onUpdateBasket(basketState.selectedBasketItem!);
    // router.pop();
    selectedBasketItem!.modifiers.add(modifier);

    print("modifires ------ add ${modifires}");
  }

  @action
  Future<void> updateOrder() async {
    final changedOrder = order!.copyWith(basket: basket);
    print("change $changedOrder");
    final result = await ServicesRepository.orderInfo(
      order: changedOrder,
    );
    print("result $result");
    order = result;
    //basket.clear();
    basket = order!.basket;

    // selectedBasketItem =
    //     basket.firstWhere((item) => item.code == selectedBasketItem!.code);

    // basket.clear();
  }

  // @action
  // Future<void> updateSavedOrder() async {
  //   final changedOrder = order!.copyWith(basket: basket);
  //   final result = await ServicesRepository.savedorder(
  //     order: changedOrder,
  //   );
  //   order = result;
  //   basket = order!.basket;
  // }

  @action
  Future<void> onIncrementBasketItem(
      String code, String add, int buttonNumber) async {
    if (add.isEmpty) {
      buttonNumber = 1;
    }
    var number = 0;
    try {
      number = add.isNotEmpty ? int.parse(add) : 0;
      if (code != null) {
        for (var i = 0; i < basket.length; i++) {
          if (basket[i].code == code && basket[i].excise == "") {
            basket[i] = basket[i].copyWith(
              quantity: buttonNumber == 4 ? number : basket[i].quantity + 1,
            );
            dynamic item = basket[i];
            basket.clear();
            print(item);
            basket.add(item);
          } else if (basket[i].code == code && basket[i].excise != "") {
            basket[i] = basket[i].copyWith(
              quantity: buttonNumber == 4 ? number : basket[i].quantity,
            );
          }
        }

        await updateOrder();
        selectedBasketItem = basket.firstWhere((item) => item.code == code);
      } else {}
    } catch (e) {
      print("sdfsdf s  $e");

      AppSettings.toast(text: "invalid_value".tr());
    }
  }

  @action
  Future<void> onDecrementBasketItem(
      String code, String minus, int buttonNumber) async {
    if (minus.isEmpty) {
      buttonNumber = 1;
    }
    var number = 1;
    try {
      number = minus.isNotEmpty ? int.parse(minus) : 1;
      if (code != null) {
        for (var i = 0; i < basket.length; i++) {
          if (basket[i].code == code && basket[i].excise == "") {
            basket[i] = basket[i].copyWith(
              quantity: buttonNumber == 4 || basket[i].quantity <= 1
                  ? number
                  : basket[i].quantity - 1,
            );
            dynamic item = basket[i];
            basket.clear();
            print(item);
            basket.add(item);
          } else if (basket[i].code == code && basket[i].excise != "") {
            basket[i] = basket[i].copyWith(
              quantity: buttonNumber == 4 ? number : basket[i].quantity,
            );
          }
        }

        await updateOrder();
        selectedBasketItem = basket.firstWhere((item) => item.code == code);
      } else {}
    } catch (e) {
      AppSettings.toast(text: "invalid_value".tr());
    }
  }

  @action
  Future<void> onCopyItem(String code) async {
    if (code != null) {
      await updateOrder();
      selectedBasketItem = basket.firstWhere((item) => item.code == code);
    } else {}
  }

  // @action
  // Future<void> onSaved() async {
  //   await updateSavedOrder();
  // }

  @action
  Future<void> onDiscountItem(String code, String discount) async {
    var count = double.parse(discount);
    if (code != null) {
      for (var i = 0; i < basket.length; i++) {
        if (basket[i].code == code) {
          basket[i] = basket[i].copyWith(
            saleprice: count,
          );
        }
      }
      await updateOrder();
      selectedBasketItem = basket.firstWhere((item) => item.code == code);
    } else {}
  }

  @action
  Future<void> onPrice(
    String code,
    String price,
  ) async {
    var saleprice = 0.0;
    try {
      saleprice = price.isNotEmpty ? double.parse(price) : 0.0;

      if (code != null) {
        for (var i = 0; i < basket.length; i++) {
          if (basket[i].code == code) {
            dynamic bascetItem = basket[i] = basket[i].copyWith(
              saleprice: saleprice,
            );
            basket.clear();
            basket.add(bascetItem);
          }
        }
        print(basket);
        await updateOrder();

        selectedBasketItem = basket.firstWhere((item) => item.code == code);
      } else {}
    } catch (e) {
      AppSettings.toast(text: "invalid_value".tr());
    }
  }

  @action
  Future<void> onDeleteItem({required int orderId, required int id}) async {
    //  basket.remove(selectedBasketItem!);
    final response =
        await ServicesRepository.deleteItems(orderId: orderId, itemId: id);
    print(response);
    order = response;
    basket = order!.basket;

    if (basket.isNotEmpty) {
      selectedBasketItem = basket.last;
    } else {
      selectedBasketItem = null;
    }
  }

  @action
  Future<void> discountSell(int id) async {
    basket.clear();
    final basketItemModel = BasketItemModel(
      id: id,
      code: "",
      name: "",
      saleprice: 2.0,
      recorddate: DateTime.now(),
      // guid_mod: [],
    );

    final changedOrder = order!.copyWith(basket: [basketItemModel]);
    print(changedOrder);
    final result = await ServicesRepository.orderInfo(
      order: changedOrder,
    );
    order = result;
    basket = order!.basket;
  }

  @action
  Future<void> onSearchBarCode(
      String barcode, BuildContext context, int buttonNumber) async {
    final res = await ServicesRepository.searchBarCode(
        barcode: barcode, context: context);
    if (res != null) {
      productModel = res;
      kod_tov = productModel!.kod_tov!;
      if (res.excise != true) {
        //basket.clear();
        await onAddToBasket(
          productModel!,
          buttonNumber,
        );
      } else {
        AppSettings.toast(text: "Write exise".tr());
        excise = true;
      }
    } else {
      excise = false;
      focusNode.unfocus();
      UiUtils.errorModal(context: context, errorCode: "Empty_product");
    }
  }

  @action
  Future<void> onSearchExise(String kod_tov, String excise, String orderId,
      BuildContext context, int buttonNumber) async {
    print(productModel);
    print(orderId);
    final res = await ServicesRepository.searchExise(
        kod_tov: kod_tov, exise: excise, orderId: orderId, context: context);
    //
    print(res);
    if (res != null) {
      if (res.data['status'] == "success") {
        await onAddToBasket(productModel!, buttonNumber, excise);
        this.excise = false;
      } else if (res.data['status'] == "excise code posted") {
        // UiUtils.errorModal(context: context, errorCode: "excise_code_posted");
        AppSettings.toast(text: "Excise code posted".tr());
        this.excise = false;
      }
    } else {
      if (this.excise != true) {
        this.excise = true;
        AppSettings.toast(text: "wrong_exsise".tr());
      } else {
        this.excise = false;
        AppSettings.toast(text: "wrong_exsise".tr());
        // this.excise = true;
        //UiUtils.errorModal(context: context, errorCode: "Empty_product");
      }
    }
  }

  @action
  Future<void> onAddToBasket(ProductModel product, int? buttonNumber,
      [String? excisee = ""]) async {
    //basket.clear();
    basket.clear();
    excise = product.excise;
    kod_tov = product.kod_tov!;

    for (var i = 0; i < basket.length; i++) {
      if (basket[i].code == product.kod_tov) {
        selectedBasketItem = basket[i];
        await onIncrementBasketItem(product.kod_tov!, "1", buttonNumber!);
        return;
      }
    }

    final basketItemModel = BasketItemModel(
      id: 0,
      code: product.kod_tov!,
      name: product.name!,
      edizm: product.ed_izm,
      adg: product.adg,
      kname: product.kname,
      deletepersonid: 0,
      saleprice: product.price_o_r,
      excise: excisee != null ? excisee : "",
      recorddate: DateTime.now(),

      // guid_mod: product.guid_mod,
    );

    basket.add(basketItemModel);

    await updateOrder();

    selectedBasketItem =
        basket.firstWhere((item) => item.code == product.kod_tov);
    titleInput = "search_by_barcode".tr();
    // selectedBasketItem!.excise == ""
    //     ? exciseText = ""
    //     : exciseText = selectedBasketItem!.excise;
  }
  // @computed
  // bool? get hasModifiers => selectedBasketItem?.guid_mod.isNotEmpty;

  @computed
  bool get basketIsEmpty => order != null && order!.basket.isEmpty;

  @computed
  double get basketSum {
    var sum = 0.0;
    for (var i = 0; i < order!.basket.length; i++) {
      sum += basket[i].saleprice * basket[i].quantity;
    }
    return sum;
  }
}
