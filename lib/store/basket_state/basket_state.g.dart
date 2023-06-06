// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BasketState on BasketStateBase, Store {
  Computed<bool>? _$basketIsEmptyComputed;

  @override
  bool get basketIsEmpty =>
      (_$basketIsEmptyComputed ??= Computed<bool>(() => super.basketIsEmpty,
              name: 'BasketStateBase.basketIsEmpty'))
          .value;
  Computed<double>? _$basketSumComputed;

  @override
  double get basketSum =>
      (_$basketSumComputed ??= Computed<double>(() => super.basketSum,
              name: 'BasketStateBase.basketSum'))
          .value;

  late final _$modifiresAtom =
      Atom(name: 'BasketStateBase.modifires', context: context);

  @override
  List<ModifierModel> get modifires {
    _$modifiresAtom.reportRead();
    return super.modifires;
  }

  @override
  set modifires(List<ModifierModel> value) {
    _$modifiresAtom.reportWrite(value, super.modifires, () {
      super.modifires = value;
    });
  }

  late final _$selectedBasketItemAtom =
      Atom(name: 'BasketStateBase.selectedBasketItem', context: context);

  @override
  BasketItemModel? get selectedBasketItem {
    _$selectedBasketItemAtom.reportRead();
    return super.selectedBasketItem;
  }

  @override
  set selectedBasketItem(BasketItemModel? value) {
    _$selectedBasketItemAtom.reportWrite(value, super.selectedBasketItem, () {
      super.selectedBasketItem = value;
    });
  }

  late final _$buttonIdentifireAtom =
      Atom(name: 'BasketStateBase.buttonIdentifire', context: context);

  @override
  String? get buttonIdentifire {
    _$buttonIdentifireAtom.reportRead();
    return super.buttonIdentifire;
  }

  @override
  set buttonIdentifire(String? value) {
    _$buttonIdentifireAtom.reportWrite(value, super.buttonIdentifire, () {
      super.buttonIdentifire = value;
    });
  }

  late final _$orderAtom =
      Atom(name: 'BasketStateBase.order', context: context);

  @override
  OrderModel? get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrderModel? value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$productModelAtom =
      Atom(name: 'BasketStateBase.productModel', context: context);

  @override
  ProductModel? get productModel {
    _$productModelAtom.reportRead();
    return super.productModel;
  }

  @override
  set productModel(ProductModel? value) {
    _$productModelAtom.reportWrite(value, super.productModel, () {
      super.productModel = value;
    });
  }

  late final _$exciseAtom =
      Atom(name: 'BasketStateBase.excise', context: context);

  @override
  bool? get excise {
    _$exciseAtom.reportRead();
    return super.excise;
  }

  @override
  set excise(bool? value) {
    _$exciseAtom.reportWrite(value, super.excise, () {
      super.excise = value;
    });
  }

  late final _$exciseTextAtom =
      Atom(name: 'BasketStateBase.exciseText', context: context);

  @override
  String get exciseText {
    _$exciseTextAtom.reportRead();
    return super.exciseText;
  }

  @override
  set exciseText(String value) {
    _$exciseTextAtom.reportWrite(value, super.exciseText, () {
      super.exciseText = value;
    });
  }

  late final _$titleInputAtom =
      Atom(name: 'BasketStateBase.titleInput', context: context);

  @override
  String get titleInput {
    _$titleInputAtom.reportRead();
    return super.titleInput;
  }

  @override
  set titleInput(String value) {
    _$titleInputAtom.reportWrite(value, super.titleInput, () {
      super.titleInput = value;
    });
  }

  late final _$textValueAtom =
      Atom(name: 'BasketStateBase.textValue', context: context);

  @override
  String get textValue {
    _$textValueAtom.reportRead();
    return super.textValue;
  }

  @override
  set textValue(String value) {
    _$textValueAtom.reportWrite(value, super.textValue, () {
      super.textValue = value;
    });
  }

  late final _$kod_tovAtom =
      Atom(name: 'BasketStateBase.kod_tov', context: context);

  @override
  String get kod_tov {
    _$kod_tovAtom.reportRead();
    return super.kod_tov;
  }

  @override
  set kod_tov(String value) {
    _$kod_tovAtom.reportWrite(value, super.kod_tov, () {
      super.kod_tov = value;
    });
  }

  late final _$focusNodeAtom =
      Atom(name: 'BasketStateBase.focusNode', context: context);

  @override
  FocusNode get focusNode {
    _$focusNodeAtom.reportRead();
    return super.focusNode;
  }

  @override
  set focusNode(FocusNode value) {
    _$focusNodeAtom.reportWrite(value, super.focusNode, () {
      super.focusNode = value;
    });
  }

  late final _$createOrderAsyncAction =
      AsyncAction('BasketStateBase.createOrder', context: context);

  @override
  Future<OrderModel> createOrder({required OrderModel createdOrder}) {
    return _$createOrderAsyncAction
        .run(() => super.createOrder(createdOrder: createdOrder));
  }

  late final _$updateOrderAsyncAction =
      AsyncAction('BasketStateBase.updateOrder', context: context);

  @override
  Future<void> updateOrder() {
    return _$updateOrderAsyncAction.run(() => super.updateOrder());
  }

  late final _$onIncrementBasketItemAsyncAction =
      AsyncAction('BasketStateBase.onIncrementBasketItem', context: context);

  @override
  Future<void> onIncrementBasketItem(
      String code, String add, int buttonNumber) {
    return _$onIncrementBasketItemAsyncAction
        .run(() => super.onIncrementBasketItem(code, add, buttonNumber));
  }

  late final _$onDecrementBasketItemAsyncAction =
      AsyncAction('BasketStateBase.onDecrementBasketItem', context: context);

  @override
  Future<void> onDecrementBasketItem(
      String code, String minus, int buttonNumber) {
    return _$onDecrementBasketItemAsyncAction
        .run(() => super.onDecrementBasketItem(code, minus, buttonNumber));
  }

  late final _$onCopyItemAsyncAction =
      AsyncAction('BasketStateBase.onCopyItem', context: context);

  @override
  Future<void> onCopyItem(String code) {
    return _$onCopyItemAsyncAction.run(() => super.onCopyItem(code));
  }

  late final _$onDiscountItemAsyncAction =
      AsyncAction('BasketStateBase.onDiscountItem', context: context);

  @override
  Future<void> onDiscountItem(String code, String discount) {
    return _$onDiscountItemAsyncAction
        .run(() => super.onDiscountItem(code, discount));
  }

  late final _$onPriceAsyncAction =
      AsyncAction('BasketStateBase.onPrice', context: context);

  @override
  Future<void> onPrice(String code, String price) {
    return _$onPriceAsyncAction.run(() => super.onPrice(code, price));
  }

  late final _$onDeleteItemAsyncAction =
      AsyncAction('BasketStateBase.onDeleteItem', context: context);

  @override
  Future<void> onDeleteItem({required int orderId, required int id}) {
    return _$onDeleteItemAsyncAction
        .run(() => super.onDeleteItem(orderId: orderId, id: id));
  }

  late final _$discountSellAsyncAction =
      AsyncAction('BasketStateBase.discountSell', context: context);

  @override
  Future<void> discountSell(int id) {
    return _$discountSellAsyncAction.run(() => super.discountSell(id));
  }

  late final _$onSearchBarCodeAsyncAction =
      AsyncAction('BasketStateBase.onSearchBarCode', context: context);

  @override
  Future<void> onSearchBarCode(
      String barcode, BuildContext context, int buttonNumber) {
    return _$onSearchBarCodeAsyncAction
        .run(() => super.onSearchBarCode(barcode, context, buttonNumber));
  }

  late final _$onSearchExiseAsyncAction =
      AsyncAction('BasketStateBase.onSearchExise', context: context);

  @override
  Future<void> onSearchExise(String kod_tov, String excise, String orderId,
      BuildContext context, int buttonNumber) {
    return _$onSearchExiseAsyncAction.run(() =>
        super.onSearchExise(kod_tov, excise, orderId, context, buttonNumber));
  }

  late final _$onAddToBasketAsyncAction =
      AsyncAction('BasketStateBase.onAddToBasket', context: context);

  @override
  Future<void> onAddToBasket(ProductModel product, int? buttonNumber,
      [String? excisee = ""]) {
    return _$onAddToBasketAsyncAction
        .run(() => super.onAddToBasket(product, buttonNumber, excisee));
  }

  late final _$BasketStateBaseActionController =
      ActionController(name: 'BasketStateBase', context: context);

  @override
  void onAddModifier(ModifierModel modifier) {
    final _$actionInfo = _$BasketStateBaseActionController.startAction(
        name: 'BasketStateBase.onAddModifier');
    try {
      return super.onAddModifier(modifier);
    } finally {
      _$BasketStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
modifires: ${modifires},
selectedBasketItem: ${selectedBasketItem},
buttonIdentifire: ${buttonIdentifire},
order: ${order},
productModel: ${productModel},
excise: ${excise},
exciseText: ${exciseText},
titleInput: ${titleInput},
textValue: ${textValue},
kod_tov: ${kod_tov},
focusNode: ${focusNode},
basketIsEmpty: ${basketIsEmpty},
basketSum: ${basketSum}
    ''';
  }
}
