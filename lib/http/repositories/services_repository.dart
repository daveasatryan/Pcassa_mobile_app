import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/all_change_model.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/balanse_casa_model.dart';
import 'package:pcassa_retail_mobile/models/change_language_model/chane_language_model.dart';
import 'package:pcassa_retail_mobile/models/payment_close_order_model/close_payment_model.dart';
import 'package:pcassa_retail_mobile/models/product_model/product_model.dart';
import 'package:pcassa_retail_mobile/models/spr_model/spr_model.dart';
import 'package:pcassa_retail_mobile/models/stop_list_model/stop_list_model.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/all_change_model.dart';
import 'package:pcassa_retail_mobile/utils/error_handler.dart';

import '../../constants/app_settings.dart';
import '../../constants/requests.dart';
import '../../models/RemaindingProductsModel/remainding_products_model.dart';
import '../../models/category_model/category_model.dart';
import '../../models/currency_model/currency_model.dart';
import '../../models/discount_model/discount_model.dart';
import '../../models/info_model/info_model.dart';
import '../../models/menu_model/menu_model.dart';
import '../../models/order_model/order_model.dart';
import '../../models/payment_model/payment_model.dart';
import '../../models/savedorder_model/savedorder_model.dart';
import '../../models/table_group/table_group_model.dart';
import '../../store/services_state/services_state.dart';
import '../dio_options.dart';

class ServicesRepository {
  // static Future<List<CategoryModel>> getServices() async {
  //   final res = await dio.get(
  //     Requests.getMenu,
  //     options: Options(
  //       headers: {
  //         'language': AppSettings.languageCode,
  //         'api_key': '',
  //         'sid': AppSettings.sid,
  //       },
  //     ),
  //   );
  //   return res.data.map<CategoryModel>(CategoryModel.fromJson).toList();
  // }

  static Future<InfoModel> getInfo() async {
    final res = await dio.get(
      Requests.getInfo,
    );
    return InfoModel.fromJson(res.data);
  }

  static Future<AllChangeModel> getAllChange() async {
    final res = await dio.get(
      Requests.saleproducts,
    );
    return AllChangeModel.fromJson(res.data);
  }

  static Future<Response> getVallets() async {
    Response res = await dio.get(
      Requests.viruchka,
    );

    return res;
  }

  static Future<BalanseCasaModel> getBalanseCasa() async {
    final res = await dio.get(
      Requests.cash,
    );
    return BalanseCasaModel.fromJson(res.data);
  }

  static Future<List<TableGroupModel>> getTables() async {
    final res = await dio.get(
      Requests.table,
    );
    return res.data
        // ignore:unnecessary_lambdas
        .map<TableGroupModel>((json) => TableGroupModel.fromJson(json))
        .toList();
  }

  // static Future<MenuModel> getMenu() async {
  //   final servicesState = GetIt.I<ServicesState>();
  //   servicesState.categoriesFirstLevel.clear();
  //   final res = await dio.get(
  //     Requests.menu,
  //   );
  //   return MenuModel.fromJson(res.data);
  // }

  static Future<List<DiscountModel>> getDiscount() async {
    final res = await dio.get(
      Requests.discount,
    );

    return res.data
        // ignore:unnecessary_lambdas
        .map<DiscountModel>((json) => DiscountModel.fromJson(json))
        .toList();
  }

  static Future<CurrencyModel> getCurrencies({required int orderid}) async {
    Map<String, dynamic> mapData = {
      "orderid": orderid,
    };
    final res = await dio.post(
      Requests.valyuta,
      data: mapData,
    );
    print(res);
    return CurrencyModel.fromJson(res.data);
    // ignore:unnecessary_lambdas
  }

  static Future<List<SprModel>> getSpravshik() async {
    final res = await dio.get(
      Requests.spr,
    );
    return res.data
        // ignore:unnecessary_lambdas
        .map<SprModel>((json) => SprModel.fromJson(json))
        .toList();
  }

  static Future<List<StopListModel>> getStopMenu() async {
    final res = await dio.get(
      Requests.getStopList,
    );
    // final datas = await jsonDecode(res.data);
    print("resssponce ${res.data}");

    return res.data
        // ignore:unnecessary_lambdas
        .map<StopListModel>((json) => StopListModel.fromJson(json))
        .toList();
  }

  static Future<List<ProductModel>> getProductSearch(
      String? productName) async {
    final res = await dio.get(
      "${Requests.searchName}$productName",
    );
    // final datas = await jsonDecode(res.data);
    print("resssponce ${res.data}");

    return res.data
        // ignore:unnecessary_lambdas
        .map<ProductModel>((json) => ProductModel.fromJson(json))
        .toList();
  }

  static Future<List<StopListModel>> deleteStopListItem(
      {required dynamic kod_tov}) async {
    Map<String, String> mapData = {"kod_tov": kod_tov};
    final res = await dio.delete(
      Requests.deleteStopListItem,
      data: mapData,
    );
    // final datas = await jsonDecode(res.data);
    print("resssponce ${res.data}");

    return res.data
        // ignore:unnecessary_lambdas
        .map<StopListModel>((json) => StopListModel.fromJson(json))
        .toList();
  }

  static Future<List<StopListModel>> addListItem({
    required dynamic kod_tov,
    required String name,
    required String description,
    required int quantity,
  }) async {
    Map<String, dynamic> mapData = {
      "kod_tov": kod_tov,
      "name": name,
      "description": description,
      "quantity": quantity,
    };
    final res = await dio.post(
      Requests.addStopList,
      data: mapData,
    );
    // final datas = await jsonDecode(res.data);
    print("resssponce ${res.data}");

    return res.data
        // ignore:unnecessary_lambdas
        .map<StopListModel>((json) => StopListModel.fromJson(json))
        .toList();
  }

  static Future<List<ClosePaymentModel>> paymentClose({
    required String waiter_name,
    required String order_by,
  }) async {
    final res = await dio.post(
      Requests.ordersclose,
      data: {
        'waiter_name': waiter_name,
        'order_by': order_by,
      },
    );
    print(res);
    return res.data
        // ignore:unnecessary_lambdas
        .map<ClosePaymentModel>((json) => ClosePaymentModel.fromJson(json))
        .toList();

    //return
  }

  static Future sendSPR({
    required int kod,
    required String name,
    required int suma,
    required String dateNow,
  }) async {
    final res = await dio.post(
      Requests.openkassaorg,
      data: {
        "id": 0,
        "n_dok": "0",
        "data_d": dateNow,
        "typ_d": 22,
        "summa": suma,
        "id_osn": 0,
        "t_osn": 0,
        "prim": "",
        "kodpost": kod,
        "namepost": name,
        "val": "AMD",
        "aktiv": 1,
        "kurs": 0.0,
        "summa_v": 0,
        "pr_kassa": 0.0,
        "id_vidkas": 1
      },
    );
    print(res);
    return res;

    //return
  }

  static Future closeChangeGet() async {
    final res = await dio.get(
      Requests.getIsOPenCheck,
    );
    // final datas = await jsonDecode(res.data);
    print("resssponce ${res.data}");

    return res.data;
  }

  static Future<bool> closeChange({
    required String n_smena,
  }) async {
    try {
      final res = await dio.post(
        Requests.closeChange,
        data: {
          'n_smena': n_smena,
        },
      );
      return true;
    } on DioError catch (e) {
      return false;
    }

    //return
  }

  static Future<bool> closeChange1({
    required String n_smena,
  }) async {
    try {
      final res = await dio.post(
        Requests.closeChange1,
        data: {
          'n_smena': n_smena,
        },
      );
      return true;
    } on DioError catch (e) {
      return false;
    }

    //return
  }

  static Future<bool> sendFinanceOperationRequest({
    required int n_smena,
    required double amount,
    required String description,
    required int tip,
  }) async {
    try {
      final res = await dio.post(
        Requests.cashentryexit,
        data: {
          'n_smena': n_smena,
          'amount': amount,
          'description': description,
          'tip': tip,
        },
      );
      return true;
    } on DioError catch (e) {
      return false;
    }

    //return
  }

  static Future searchBarCode({
    required String barcode,
    required BuildContext context,
  }) async {
    Map<String, dynamic> mapData = {
      "barcode": barcode,
    };

    try {
      final res = await dio.post(
        Requests.scaner,
        data: mapData,
      );
      return ProductModel.fromJson(res.data);
    } on DioError catch (e) {
      print(e);
    }
  }

  static Future searchExise({
    required String kod_tov,
    required String exise,
    required String orderId,
    required BuildContext context,
  }) async {
    print(kod_tov);
    print(exise);
    print(orderId);
    Map<String, dynamic> mapData = {
      "kod_tov": kod_tov,
      "excise": exise,
      "orderid": orderId
    };

    try {
      final res = await dio.post(
        Requests.excise,
        data: mapData,
      );
      //if (res.statusCode == 200) {
      return res;
      //}
    } on DioError catch (e) {
      // UiUtils.errorModal(context: context, errorCode: "Empty_product");

      //return false;
    }
  }
  // static Future onChangePrice({
  //   required String price,
  //   required BuildContext context,
  // }) async {

  //   try {
  //     final res = await dio.post(
  //       Requests.scaner,
  //       data: mapData,
  //     );
  //     return ProductModel.fromJson(res.data);
  //   } on DioError catch (e) {
  //     print(e);
  //   }
  // }
  // static Future<OrderModel> savedorder({
  //   required OrderModel order,
  // }) async {
  //   final res = await dio.post(Requests.savedorders, data: order);

  //   return OrderModel.fromJson(res.data);
  // }

  static Future<OrderModel> openSaved({
    required String orderid,
  }) async {
    final res = await dio.post(
      Requests.orderitems,
      data: {
        'orderid': orderid,
      },
    );

    return OrderModel.fromJson(res.data);
  }

  static Future<OrderModel> openClosed({
    required String orderid,
  }) async {
    final res = await dio.post(
      Requests.ordersedit,
      data: {
        'orderid': orderid,
      },
    );

    return OrderModel.fromJson(res.data);
  }

  static Future<ChaneLanguageModel> changeLanguage({
    required int id,
    required String language,
    required String tip,
  }) async {
    final res = await dio.post(
      Requests.changedlanguage,
      data: {
        'id': id,
        'language': language,
        'tip': tip,
      },
    );

    return ChaneLanguageModel.fromJson(res.data);
  }

  static Future<OrderModel> orderInfo({
    required OrderModel order,
  }) async {
    print(order);
    final res = await dio.post(
      Requests.openorder,
      data: order.toJson(),
    );
    return OrderModel.fromJson(res.data);
  }

  static Future<List<SavedOrderModel>> getSaved(
      {required String waiter_name}) async {
    final res = await dio.post(
      Requests.orders,
      data: {
        'waiter_name': waiter_name,
      },
    );
    return res.data
        .map<SavedOrderModel>((json) => SavedOrderModel.fromJson(json))
        .toList();
  }

  static Future<List<RemaindingProductsModel>> getRemaindingProducts(
      {required String barCode}) async {
    final res = await dio.post(
      Requests.barcodeostatok,
      data: {
        'barcode': barCode,
      },
    );

    print(res.data);
    return res.data
        .map<RemaindingProductsModel>(
            (json) => RemaindingProductsModel.fromJson(json))
        .toList();
  }

  static Future paymentOrder({
    required PaymentModel paymentOrder,
  }) async {
    print(paymentOrder.amount);
    print(paymentOrder.tip);

    final res = await dio.post(
      Requests.paymentorder,
      data: paymentOrder.toJson(),
    );
    print(res.data["status"]);
    return res.data;
    // if (res.data != null) {
    //   return 1;
    // } else {
    //   return 0;
    // }
  }

  static Future<bool> deleteBasketOrders({required int orderId}) async {
    Map<String, int> mapData = {"orderid": orderId};
    if (orderId == null) {
    } else {
      final res = await dio.delete(
        Requests.deleteOrders,
        data: mapData,
      );
    }
    try {
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<OrderModel?> deleteItems(
      {required int orderId, required int itemId}) async {
    Map<String, int> mapData = {"orderid": orderId, "id": itemId};

    if (itemId != null) {
      final res = await dio.delete(
        Requests.deleteItems,
        data: mapData,
      );
      print(res);

      return OrderModel.fromJson(res.data);
    } else {
      return null;
    }
  }
}
