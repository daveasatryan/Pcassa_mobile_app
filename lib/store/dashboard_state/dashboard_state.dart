import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';

part 'dashboard_state.g.dart';

class DashboardState = DashboardStateBase with _$DashboardState;

abstract class DashboardStateBase with Store {
  final authState = GetIt.I<AuthState>();
  @observable
  int selectedTab = 1;

  @action
  Future<void> changeLanguage(int id, String language, String tip) async {
    final res = await ServicesRepository.changeLanguage(
        id: id, //
        language: language, // ,
        tip: tip); //casa

    if (res != null) {
      authState.language = res.language;
      // authState.currentUser!.copyWith(
      //   id: res.id,
      //   language: res.language,
      //   fio: res.fio,
      //   dostup: res.dostup,
      //   login: res.login,
      // );
    } else {
      null;
    }
  }
}
