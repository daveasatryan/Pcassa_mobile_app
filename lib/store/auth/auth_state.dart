import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/models/order_info_model/order_info_model.dart';

import '../../models/info_model/info_model.dart';
import '../../models/user/user_model.dart';
import '../../storage/storage.dart';

part 'auth_state.g.dart';

class AuthState = AuthStateBase with _$AuthState;

abstract class AuthStateBase with Store {
  @observable
  InfoModel? info;

  @observable
  UserModel? currentUser;

  @observable
  List? quick_check = [];

  @observable
  OrderInfoModel? orderInfoModel;

  @observable
  List? my_orders = [];

  @observable
  String language = '';

  // @action
  // void logOut() async{
   
  //   currentUser = null;
  // }
}
