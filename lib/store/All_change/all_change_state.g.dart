// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_change_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AllChangeState on AllChangeStateBase, Store {
  late final _$quick_checkAtom =
      Atom(name: 'AllChangeStateBase.quick_check', context: context);

  @override
  List<ItemsModel> get quick_check {
    _$quick_checkAtom.reportRead();
    return super.quick_check;
  }

  @override
  set quick_check(List<ItemsModel> value) {
    _$quick_checkAtom.reportWrite(value, super.quick_check, () {
      super.quick_check = value;
    });
  }

  late final _$summaAtom =
      Atom(name: 'AllChangeStateBase.summa', context: context);

  @override
  int get summa {
    _$summaAtom.reportRead();
    return super.summa;
  }

  @override
  set summa(int value) {
    _$summaAtom.reportWrite(value, super.summa, () {
      super.summa = value;
    });
  }

  late final _$getDataAllAsyncAction =
      AsyncAction('AllChangeStateBase.getDataAll', context: context);

  @override
  Future<void> getDataAll() {
    return _$getDataAllAsyncAction.run(() => super.getDataAll());
  }

  @override
  String toString() {
    return '''
quick_check: ${quick_check},
summa: ${summa}
    ''';
  }
}
