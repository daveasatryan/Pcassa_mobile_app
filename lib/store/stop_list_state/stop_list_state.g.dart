// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_list_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StopLisProducttState on StopListStateBase, Store {
  late final _$postsProductsAtom =
      Atom(name: 'StopListStateBase.postsProducts', context: context);

  @override
  ObservableList<StopListModel> get postsProducts {
    _$postsProductsAtom.reportRead();
    return super.postsProducts;
  }

  @override
  set postsProducts(ObservableList<StopListModel> value) {
    _$postsProductsAtom.reportWrite(value, super.postsProducts, () {
      super.postsProducts = value;
    });
  }

  late final _$getPostsAsyncAction =
      AsyncAction('StopListStateBase.getPosts', context: context);

  @override
  Future<void> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('StopListStateBase.deleteItem', context: context);

  @override
  Future<void> deleteItem({required String kot_tov}) {
    return _$deleteItemAsyncAction
        .run(() => super.deleteItem(kot_tov: kot_tov));
  }

  late final _$addItemAsyncAction =
      AsyncAction('StopListStateBase.addItem', context: context);

  @override
  Future<void> addItem(
      {required int kod_tov,
      required String name,
      required String dedescription,
      required int quantity}) {
    return _$addItemAsyncAction.run(() => super.addItem(
        kod_tov: kod_tov,
        name: name,
        dedescription: dedescription,
        quantity: quantity));
  }

  @override
  String toString() {
    return '''
postsProducts: ${postsProducts}
    ''';
  }
}
