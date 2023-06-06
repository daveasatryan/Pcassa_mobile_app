import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/all_change_model.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/items_model.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/balanse_casa_model.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/inkas_model.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/item_inkas.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/vnes_model.dart';
import 'package:pcassa_retail_mobile/models/order_info_model/order_info_model.dart';

import '../../models/info_model/info_model.dart';
import '../../models/user/user_model.dart';
import '../../storage/storage.dart';

part 'balance_casa_state.g.dart';

class BalanceCasaState = BalanceCasaStateBase with _$BalanceCasaState;

abstract class BalanceCasaStateBase with Store {
  @observable
  BalanseCasaModel? balanceList;

  @observable
  int sale = 0;

  @observable
  int amount = 0;

  @observable
  int inkassAmount = 0;

  @observable
  int vnesAmount = 0;

  @observable
  List<Item_inkas> inkasList = [];

  @observable
  List<Item_inkas> vnesList = [];
  // @observable
  // OrderInfoModel? orderInfoModel;

  // @observable
  // List? my_orders = [];

  // @observable
  // String language = '';

  @action
  Future<void> getDataAll() async {
    final res = await ServicesRepository.getBalanseCasa();
    sale = res.sale;
    amount = res.amount;
    inkassAmount = res.inkass.Amount;
    vnesAmount = res.vnes.Amount;
    inkasList = res.inkass.items;
    vnesList = res.vnes.items;

    print("inkasList $inkasList");
    print("vnesList $vnesList");
    print("inkassAmount $inkassAmount");
    print("vnesAmount $vnesAmount");
  }
}
