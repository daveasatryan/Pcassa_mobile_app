import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/models/user/dostup_object.dart';

import '../../http/repositories/auth_repository.dart';
import '../auth/auth_state.dart';

part 'sign_in_state.g.dart';

class SignInState = SignInStateBase with _$SignInState;

abstract class SignInStateBase with Store {
  final authState = GetIt.I<AuthState>();

  @observable
  String code = '';

  Future<void> signIn() async {
    final res = await AuthRepository.signIn(code: code);
    authState.currentUser = res;
    if (res.dostup.quick_check != null) {
      authState.quick_check = res.dostup.quick_check!;
    }
    if (res.dostup.my_orders != null) {
      authState.my_orders = res.dostup.my_orders!;
    }
    authState.language = res.language;

    print(" authState.my_orders ${authState.my_orders}");
    print(" authState.quick_check ${authState.quick_check}");
    // await StorageUtil.saveApiKeyUser();
  }
}
