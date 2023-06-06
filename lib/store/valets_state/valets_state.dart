import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../http/repositories/services_repository.dart';
import '../../models/table_group/table_group_model.dart';
import '../../models/table_model/table_model.dart';
import '../auth/auth_state.dart';

part 'valets_state.g.dart';

class ValetsState = ValetsStateBase with _$ValetsState;

abstract class ValetsStateBase with Store {
  @observable
  List<String> valetsList = [];

  @observable
  List<int> sumList = [];

  @action
  Future<void> getValets() async {
    final res = await ServicesRepository.getVallets();
    final Map data = res.data;
    for (var i in data.entries) {
      if (i.key == "amount") {
        null;
      } else {
        valetsList.add(i.key);
        // valetsList.removeLast();
        sumList.add(i.value);
        //   valetsList.removeLast();
      }
    }
  }
}
