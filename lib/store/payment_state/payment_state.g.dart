// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentState on PaymentStateBase, Store {
  Computed<double>? _$getSurrenderComputed;

  @override
  double get getSurrender =>
      (_$getSurrenderComputed ??= Computed<double>(() => super.getSurrender,
              name: 'PaymentStateBase.getSurrender'))
          .value;

  late final _$typedValueAtom =
      Atom(name: 'PaymentStateBase.typedValue', context: context);

  @override
  String get typedValue {
    _$typedValueAtom.reportRead();
    return super.typedValue;
  }

  @override
  set typedValue(String value) {
    _$typedValueAtom.reportWrite(value, super.typedValue, () {
      super.typedValue = value;
    });
  }

  late final _$valueParseToDoubleAtom =
      Atom(name: 'PaymentStateBase.valueParseToDouble', context: context);

  @override
  double get valueParseToDouble {
    _$valueParseToDoubleAtom.reportRead();
    return super.valueParseToDouble;
  }

  @override
  set valueParseToDouble(double value) {
    _$valueParseToDoubleAtom.reportWrite(value, super.valueParseToDouble, () {
      super.valueParseToDouble = value;
    });
  }

  late final _$inputAmountAtom =
      Atom(name: 'PaymentStateBase.inputAmount', context: context);

  @override
  double? get inputAmount {
    _$inputAmountAtom.reportRead();
    return super.inputAmount;
  }

  @override
  set inputAmount(double? value) {
    _$inputAmountAtom.reportWrite(value, super.inputAmount, () {
      super.inputAmount = value;
    });
  }

  late final _$isPayedAtom =
      Atom(name: 'PaymentStateBase.isPayed', context: context);

  @override
  bool? get isPayed {
    _$isPayedAtom.reportRead();
    return super.isPayed;
  }

  @override
  set isPayed(bool? value) {
    _$isPayedAtom.reportWrite(value, super.isPayed, () {
      super.isPayed = value;
    });
  }

  late final _$resIntAtom =
      Atom(name: 'PaymentStateBase.resInt', context: context);

  @override
  int? get resInt {
    _$resIntAtom.reportRead();
    return super.resInt;
  }

  @override
  set resInt(int? value) {
    _$resIntAtom.reportWrite(value, super.resInt, () {
      super.resInt = value;
    });
  }

  late final _$tipAtom = Atom(name: 'PaymentStateBase.tip', context: context);

  @override
  int? get tip {
    _$tipAtom.reportRead();
    return super.tip;
  }

  @override
  set tip(int? value) {
    _$tipAtom.reportWrite(value, super.tip, () {
      super.tip = value;
    });
  }

  late final _$selectedCurrencyAtom =
      Atom(name: 'PaymentStateBase.selectedCurrency', context: context);

  @override
  CurrencyItemsModel? get selectedCurrency {
    _$selectedCurrencyAtom.reportRead();
    return super.selectedCurrency;
  }

  @override
  set selectedCurrency(CurrencyItemsModel? value) {
    _$selectedCurrencyAtom.reportWrite(value, super.selectedCurrency, () {
      super.selectedCurrency = value;
    });
  }

  late final _$currenciesAtom =
      Atom(name: 'PaymentStateBase.currencies', context: context);

  @override
  ObservableList<CurrencyItemsModel> get currencies {
    _$currenciesAtom.reportRead();
    return super.currencies;
  }

  @override
  set currencies(ObservableList<CurrencyItemsModel> value) {
    _$currenciesAtom.reportWrite(value, super.currencies, () {
      super.currencies = value;
    });
  }

  late final _$salepriceAtom =
      Atom(name: 'PaymentStateBase.saleprice', context: context);

  @override
  double? get saleprice {
    _$salepriceAtom.reportRead();
    return super.saleprice;
  }

  @override
  set saleprice(double? value) {
    _$salepriceAtom.reportWrite(value, super.saleprice, () {
      super.saleprice = value;
    });
  }

  late final _$getCurrenciesAsyncAction =
      AsyncAction('PaymentStateBase.getCurrencies', context: context);

  @override
  Future<void> getCurrencies({required int orderid}) {
    return _$getCurrenciesAsyncAction
        .run(() => super.getCurrencies(orderid: orderid));
  }

  late final _$paymentOrderAsyncAction =
      AsyncAction('PaymentStateBase.paymentOrder', context: context);

  @override
  Future<void> paymentOrder() {
    return _$paymentOrderAsyncAction.run(() => super.paymentOrder());
  }

  @override
  String toString() {
    return '''
typedValue: ${typedValue},
valueParseToDouble: ${valueParseToDouble},
inputAmount: ${inputAmount},
isPayed: ${isPayed},
resInt: ${resInt},
tip: ${tip},
selectedCurrency: ${selectedCurrency},
currencies: ${currencies},
saleprice: ${saleprice},
getSurrender: ${getSurrender}
    ''';
  }
}
