// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_operation_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Finance_operation_state on Finance_operation_stateBase, Store {
  late final _$sprListAtom =
      Atom(name: 'Finance_operation_stateBase.sprList', context: context);

  @override
  ObservableList<SprModel> get sprList {
    _$sprListAtom.reportRead();
    return super.sprList;
  }

  @override
  set sprList(ObservableList<SprModel> value) {
    _$sprListAtom.reportWrite(value, super.sprList, () {
      super.sprList = value;
    });
  }

  late final _$getSPRDataAsyncAction =
      AsyncAction('Finance_operation_stateBase.getSPRData', context: context);

  @override
  Future<void> getSPRData() {
    return _$getSPRDataAsyncAction.run(() => super.getSPRData());
  }

  late final _$sendFinanceOperationAsyncAction = AsyncAction(
      'Finance_operation_stateBase.sendFinanceOperation',
      context: context);

  @override
  Future<dynamic> sendFinanceOperation(int n_smena, double amount,
      String description, int tip, BuildContext context,
      [String? name, String? dateNow, int? suma, int? kod]) {
    return _$sendFinanceOperationAsyncAction.run(() => super
        .sendFinanceOperation(n_smena, amount, description, tip, context, name,
            dateNow, suma, kod));
  }

  late final _$sentSPRDataAsyncAction =
      AsyncAction('Finance_operation_stateBase.sentSPRData', context: context);

  @override
  Future<bool> sentSPRData(
      {required int kod,
      required String name,
      required String dateNow,
      required int suma,
      required BuildContext context}) {
    return _$sentSPRDataAsyncAction.run(() => super.sentSPRData(
        kod: kod, name: name, dateNow: dateNow, suma: suma, context: context));
  }

  @override
  String toString() {
    return '''
sprList: ${sprList}
    ''';
  }
}
