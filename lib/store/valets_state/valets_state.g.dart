// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valets_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ValetsState on ValetsStateBase, Store {
  late final _$valetsListAtom =
      Atom(name: 'ValetsStateBase.valetsList', context: context);

  @override
  List<String> get valetsList {
    _$valetsListAtom.reportRead();
    return super.valetsList;
  }

  @override
  set valetsList(List<String> value) {
    _$valetsListAtom.reportWrite(value, super.valetsList, () {
      super.valetsList = value;
    });
  }

  late final _$sumListAtom =
      Atom(name: 'ValetsStateBase.sumList', context: context);

  @override
  List<int> get sumList {
    _$sumListAtom.reportRead();
    return super.sumList;
  }

  @override
  set sumList(List<int> value) {
    _$sumListAtom.reportWrite(value, super.sumList, () {
      super.sumList = value;
    });
  }

  late final _$getValetsAsyncAction =
      AsyncAction('ValetsStateBase.getValets', context: context);

  @override
  Future<void> getValets() {
    return _$getValetsAsyncAction.run(() => super.getValets());
  }

  @override
  String toString() {
    return '''
valetsList: ${valetsList},
sumList: ${sumList}
    ''';
  }
}
