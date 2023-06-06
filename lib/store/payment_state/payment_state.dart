import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/models/currency_model/currency_items.dart';

import '../../http/repositories/services_repository.dart';
import '../../models/currency_model/currency_model.dart';
import '../../models/payment_model/payment_model.dart';
import '../basket_state/basket_state.dart';
import '../loading/loading_state.dart';

part 'payment_state.g.dart';

class PaymentState = PaymentStateBase with _$PaymentState;

abstract class PaymentStateBase with Store {
  final basketState = GetIt.I<BasketState>();
  final paymentLoading = LoadingState();

  @observable
  String typedValue = '';

  @observable
  double valueParseToDouble = 0.0;

  @observable
  double? inputAmount;

  @observable
  bool? isPayed;

  @observable
  int? resInt;

  @observable
  int? tip;

  // @observable
  // ObservableList<int> listPayidValets = ObservableList<int>();
  @observable
  CurrencyItemsModel? selectedCurrency;

  @observable
  ObservableList<CurrencyItemsModel> currencies =
      ObservableList<CurrencyItemsModel>();

  @observable
  double? saleprice;
  double? paid;

  @action
  Future<void> getCurrencies({required int orderid}) async {
    final result = await ServicesRepository.getCurrencies(orderid: orderid);
    currencies = result.items!.asObservable();
    saleprice = result.saleprice;
    paid = result.paid;

    print(currencies);
  }

  @computed
  double get getSurrender =>
      (typedValue.trim() != '' ? double.parse(typedValue) : 0.0) -
      basketState.basketSum;

  @action
  Future<void> paymentOrder() async {
    print("aaaaa $inputAmount");
    final res = await ServicesRepository.paymentOrder(
      paymentOrder: PaymentModel(
        tip: tip!,
        cod: selectedCurrency!.cod,
        amount: inputAmount!,
        orderid: basketState.order!.orderinfo.orderid,
      ),
    );

    print("ressss $res");

    if (res["status"] == "success") {
      print("res == 1");
      resInt = 1;

      isPayed != null;
      //listPayidValets.clear();

      print(res);
    } else {
      paid = res["status"] * 1.0;
      resInt = 0;
      isPayed == null;
      print("res == 0");
      selectedCurrency == null;
      //listPayidValets.add(tip!);
    }
    //  else {
    //   print("ressssElse $res");

    //   //resInt = res;
    //   //  isPayed == null;
    //   print("res == 0");
    //   //selectedCurrency == null;
    //   listPayidValets.add(tip!);
    // }

    // if (res == 1) {
    //   resInt = res;
    //   isPayed != null;
    //   print("res == 1");
    //   listPayidValets.clear();
    // } else {
    //   resInt = res;
    //   isPayed == null;
    //   print("res == 0");
    //   selectedCurrency == null;
    //   listPayidValets.add(tip!);
    // }
  }
}
