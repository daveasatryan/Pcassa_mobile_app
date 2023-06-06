// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthState on AuthStateBase, Store {
  late final _$infoAtom = Atom(name: 'AuthStateBase.info', context: context);

  @override
  InfoModel? get info {
    _$infoAtom.reportRead();
    return super.info;
  }

  @override
  set info(InfoModel? value) {
    _$infoAtom.reportWrite(value, super.info, () {
      super.info = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: 'AuthStateBase.currentUser', context: context);

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$quick_checkAtom =
      Atom(name: 'AuthStateBase.quick_check', context: context);

  @override
  List<dynamic>? get quick_check {
    _$quick_checkAtom.reportRead();
    return super.quick_check;
  }

  @override
  set quick_check(List<dynamic>? value) {
    _$quick_checkAtom.reportWrite(value, super.quick_check, () {
      super.quick_check = value;
    });
  }

  late final _$orderInfoModelAtom =
      Atom(name: 'AuthStateBase.orderInfoModel', context: context);

  @override
  OrderInfoModel? get orderInfoModel {
    _$orderInfoModelAtom.reportRead();
    return super.orderInfoModel;
  }

  @override
  set orderInfoModel(OrderInfoModel? value) {
    _$orderInfoModelAtom.reportWrite(value, super.orderInfoModel, () {
      super.orderInfoModel = value;
    });
  }

  late final _$my_ordersAtom =
      Atom(name: 'AuthStateBase.my_orders', context: context);

  @override
  List<dynamic>? get my_orders {
    _$my_ordersAtom.reportRead();
    return super.my_orders;
  }

  @override
  set my_orders(List<dynamic>? value) {
    _$my_ordersAtom.reportWrite(value, super.my_orders, () {
      super.my_orders = value;
    });
  }

  late final _$languageAtom =
      Atom(name: 'AuthStateBase.language', context: context);

  @override
  String get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(String value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  @override
  String toString() {
    return '''
info: ${info},
currentUser: ${currentUser},
quick_check: ${quick_check},
orderInfoModel: ${orderInfoModel},
my_orders: ${my_orders},
language: ${language}
    ''';
  }
}
