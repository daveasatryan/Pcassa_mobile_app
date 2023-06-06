import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/all_change_model.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/items_model.dart';
import 'package:pcassa_retail_mobile/models/order_info_model/order_info_model.dart';

import '../../models/info_model/info_model.dart';
import '../../models/user/user_model.dart';
import '../../storage/storage.dart';

part 'all_change_state.g.dart';

class AllChangeState = AllChangeStateBase with _$AllChangeState;

abstract class AllChangeStateBase with Store {
  @observable
  List<ItemsModel> quick_check = [];

  @observable
  int summa = 0;
  // @observable
  // OrderInfoModel? orderInfoModel;

  // @observable
  // List? my_orders = [];

  // @observable
  // String language = '';

  @action
  Future<void> getDataAll() async {
    final res = await ServicesRepository.getAllChange();
    summa = res.summa;
    quick_check = res.items;
    print(summa);
    print(quick_check);
  }
}
