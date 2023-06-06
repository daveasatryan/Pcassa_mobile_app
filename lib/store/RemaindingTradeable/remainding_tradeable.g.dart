// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remainding_tradeable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RemaindingTradeable on RemaindingTradeableBase, Store {
  late final _$searchProductsAtom =
      Atom(name: 'RemaindingTradeableBase.searchProducts', context: context);

  @override
  ObservableList<RemaindingProductsModel> get searchProducts {
    _$searchProductsAtom.reportRead();
    return super.searchProducts;
  }

  @override
  set searchProducts(ObservableList<RemaindingProductsModel> value) {
    _$searchProductsAtom.reportWrite(value, super.searchProducts, () {
      super.searchProducts = value;
    });
  }

  late final _$onSearchProductsAsyncAction =
      AsyncAction('RemaindingTradeableBase.onSearchProducts', context: context);

  @override
  Future<void> onSearchProducts({required String barCode}) {
    return _$onSearchProductsAsyncAction
        .run(() => super.onSearchProducts(barCode: barCode));
  }

  @override
  String toString() {
    return '''
searchProducts: ${searchProducts}
    ''';
  }
}
