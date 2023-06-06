import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/http/repositories/auth_repository.dart';
import 'package:pcassa_retail_mobile/store/license_state/license_state.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

import '../http/repositories/services_repository.dart';
import '../router.gr.dart';
import '../services.dart';
import '../store/auth/auth_state.dart';
import '../store/language/language_state.dart';
import '../store/loading/loading_state.dart';
import '../utils/error_handler.dart';
import '../widgets/loading_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final loadingState = LoadingState();
  final languageState = LanguageState();
  final authState = GetIt.I<AuthState>();
  var licenseInfo = GetIt.I<LicenseState>();
  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // Unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // Unique ID on Android
    }
  }

  @override
  void initState() {
    super.initState();
    _getId().then((id) {
      String? deviceId = id;
      print(deviceId);
      setState(() {
        AppSettings.deviceId = deviceId.toString();
      });
    });

    SecureSharedPref.getInstance().then((value) {
      value.getString("licenseKey", isEncrypted: false).then((value) {
        setState(() {
          AppSettings.licenseKey = value.toString();
        });
      });
    });

    Future.delayed(Duration(seconds: 3), () async {
      print(AppSettings.licenseKey);
      try {
        await AuthRepository.checkLicense(
            context: context,
            device_code: AppSettings.deviceIdFl,
            license_key: AppSettings.licenseKey,
            product_id: 4);
      } on DioError catch (e) {
        UiUtils.errorModal(
          context: context,
          errorCode: e.message,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: LoadingWidget(),
    );
  }
}
