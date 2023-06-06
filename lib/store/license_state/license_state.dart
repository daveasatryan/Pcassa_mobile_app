import 'package:mobx/mobx.dart';
import 'package:pcassa_retail_mobile/http/repositories/auth_repository.dart';
import 'package:pcassa_retail_mobile/models/add_license_model/add_license_model.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

part 'license_state.g.dart';

//State for Autorisation
class LicenseState = LicenseStateBase with _$LicenseState;

abstract class LicenseStateBase with Store {
  @observable
  AddLicenseModel? licenseInfo;

  @action
  addLicense({
    required String device_code,
    required int product_id,
    required int unique_code,
  }) async {
    final result = await AuthRepository.addLicense(
      device_code: device_code,
      product_id: product_id,
      unique_code: unique_code,
    );
    licenseInfo = result;
  }

  @action
  setLicense() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("licenseKey", licenseInfo!.license_key.toString(),
        isEncrypted: false);
    pref.putString("baseUrl", "http://${licenseInfo!.ip}:3456".toString(),
        isEncrypted: false);
  }
}
