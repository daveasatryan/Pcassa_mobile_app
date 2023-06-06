// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_casa_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BalanceCasaState on BalanceCasaStateBase, Store {
  late final _$balanceListAtom =
      Atom(name: 'BalanceCasaStateBase.balanceList', context: context);

  @override
  BalanseCasaModel? get balanceList {
    _$balanceListAtom.reportRead();
    return super.balanceList;
  }

  @override
  set balanceList(BalanseCasaModel? value) {
    _$balanceListAtom.reportWrite(value, super.balanceList, () {
      super.balanceList = value;
    });
  }

  late final _$saleAtom =
      Atom(name: 'BalanceCasaStateBase.sale', context: context);

  @override
  int get sale {
    _$saleAtom.reportRead();
    return super.sale;
  }

  @override
  set sale(int value) {
    _$saleAtom.reportWrite(value, super.sale, () {
      super.sale = value;
    });
  }

  late final _$amountAtom =
      Atom(name: 'BalanceCasaStateBase.amount', context: context);

  @override
  int get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(int value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$inkassAmountAtom =
      Atom(name: 'BalanceCasaStateBase.inkassAmount', context: context);

  @override
  int get inkassAmount {
    _$inkassAmountAtom.reportRead();
    return super.inkassAmount;
  }

  @override
  set inkassAmount(int value) {
    _$inkassAmountAtom.reportWrite(value, super.inkassAmount, () {
      super.inkassAmount = value;
    });
  }

  late final _$vnesAmountAtom =
      Atom(name: 'BalanceCasaStateBase.vnesAmount', context: context);

  @override
  int get vnesAmount {
    _$vnesAmountAtom.reportRead();
    return super.vnesAmount;
  }

  @override
  set vnesAmount(int value) {
    _$vnesAmountAtom.reportWrite(value, super.vnesAmount, () {
      super.vnesAmount = value;
    });
  }

  late final _$inkasListAtom =
      Atom(name: 'BalanceCasaStateBase.inkasList', context: context);

  @override
  List<Item_inkas> get inkasList {
    _$inkasListAtom.reportRead();
    return super.inkasList;
  }

  @override
  set inkasList(List<Item_inkas> value) {
    _$inkasListAtom.reportWrite(value, super.inkasList, () {
      super.inkasList = value;
    });
  }

  late final _$vnesListAtom =
      Atom(name: 'BalanceCasaStateBase.vnesList', context: context);

  @override
  List<Item_inkas> get vnesList {
    _$vnesListAtom.reportRead();
    return super.vnesList;
  }

  @override
  set vnesList(List<Item_inkas> value) {
    _$vnesListAtom.reportWrite(value, super.vnesList, () {
      super.vnesList = value;
    });
  }

  late final _$getDataAllAsyncAction =
      AsyncAction('BalanceCasaStateBase.getDataAll', context: context);

  @override
  Future<void> getDataAll() {
    return _$getDataAllAsyncAction.run(() => super.getDataAll());
  }

  @override
  String toString() {
    return '''
balanceList: ${balanceList},
sale: ${sale},
amount: ${amount},
inkassAmount: ${inkassAmount},
vnesAmount: ${vnesAmount},
inkasList: ${inkasList},
vnesList: ${vnesList}
    ''';
  }
}
