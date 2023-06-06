import 'package:mobx/mobx.dart';

import '../../models/product_model/product_model.dart';

part 'search_state.g.dart';

class SearchState = SearchStateBase with _$SearchState;

abstract class SearchStateBase with Store {
  List<ProductModel> products = <ProductModel>[];

  @observable
  ObservableList<ProductModel> searchProducts = ObservableList<ProductModel>();

  void onSearch(String value) {
    if (value.trim().isEmpty) {
      searchProducts = products.asObservable();
      return;
    }
    // final filteredProduct = products.where(
    //   (product) => product.kod_tov != null && product.kod_tov!.contains(value),
    // );
    final filteredProduct = products.where(
      (product) =>
          product.name != null &&
          product.name.toString().toLowerCase().contains(value.toLowerCase()),
    );
    //print(products);
    print(filteredProduct);
    searchProducts = filteredProduct.toList().asObservable();
  }
}
