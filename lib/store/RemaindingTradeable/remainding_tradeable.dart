import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/models/RemaindingProductsModel/remainding_products_model.dart';

import '../../models/product_model/product_model.dart';

part 'remainding_tradeable.g.dart';

class RemaindingTradeable = RemaindingTradeableBase with _$RemaindingTradeable;

abstract class RemaindingTradeableBase with Store {
  @observable
  ObservableList<RemaindingProductsModel> searchProducts =
      ObservableList<RemaindingProductsModel>();

  @action
  Future<void> onSearchProducts({required String barCode}) async {
    final res =
        await ServicesRepository.getRemaindingProducts(barCode: barCode);
    searchProducts = res.asObservable();
    print(searchProducts);
  }
}
