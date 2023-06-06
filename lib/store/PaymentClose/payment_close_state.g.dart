// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_close_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Payment_close_state on Payment_close_stateBase, Store {
  late final _$closeOrderListAtom =
      Atom(name: 'Payment_close_stateBase.closeOrderList', context: context);

  @override
  List<ClosePaymentModel> get closeOrderList {
    _$closeOrderListAtom.reportRead();
    return super.closeOrderList;
  }

  @override
  set closeOrderList(List<ClosePaymentModel> value) {
    _$closeOrderListAtom.reportWrite(value, super.closeOrderList, () {
      super.closeOrderList = value;
    });
  }

  late final _$paymentCloseAsyncAction =
      AsyncAction('Payment_close_stateBase.paymentClose', context: context);

  @override
  Future<dynamic> paymentClose(
      {required String waiter_name, required String order_by}) {
    return _$paymentCloseAsyncAction.run(
        () => super.paymentClose(waiter_name: waiter_name, order_by: order_by));
  }

  @override
  String toString() {
    return '''
closeOrderList: ${closeOrderList}
    ''';
  }
}
