import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/models/stop_list_model/stop_list_model.dart';

part 'stop_list_state.g.dart';

class StopLisProducttState = StopListStateBase with _$StopLisProducttState;

abstract class StopListStateBase with Store {
  List<StopListModel> posts = <StopListModel>[];

  @observable
  ObservableList<StopListModel> postsProducts = ObservableList<StopListModel>();

  @action
  Future<void> getPosts() async {
    final postList = await ServicesRepository.getStopMenu();
    posts = postList;
    postsProducts = posts.asObservable();
    print("prost Stopstate $posts");
  }

  @action
  Future<void> deleteItem({required String kot_tov}) async {
    final postList =
        await ServicesRepository.deleteStopListItem(kod_tov: kot_tov);
    posts = postList;
    postsProducts = posts.asObservable();
    print("Afther delete StopList $posts");
  }

  @action
  Future<void> addItem(
      {required int kod_tov,
      required String name,
      required String dedescription,
      required int quantity}) async {
    final postList = await ServicesRepository.addListItem(
        kod_tov: kod_tov,
        name: name,
        description: dedescription,
        quantity: quantity);
    posts = postList;
    postsProducts = posts.asObservable();
    print("Afther delete StopList $posts");
  }
}
