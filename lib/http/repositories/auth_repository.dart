import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/models/add_license_model/add_license_model.dart';
import 'package:pcassa_retail_mobile/router.gr.dart';
import 'package:pcassa_retail_mobile/screens/license_add_screen/license_add_screen.dart';
import 'package:pcassa_retail_mobile/services.dart';

import '../../constants/requests.dart';
import '../../models/get_sid/get_sid_model.dart';
import '../../models/set_sid/set_sid_model.dart';
import '../../models/user/user_model.dart';
import '../dio_options.dart';

class AuthRepository {
  static Future<GetSidModel> getSid({
    required String deviceId,
  }) async {
    final res = await dio.post(
      Requests.getSid,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      data: {
        'device_id': deviceId,
      },
    );
    return GetSidModel.fromJson(res.data);
  }

  static Future<GetSidModel> setSid({
    required SetSidModel setSidModel,
  }) async {
    final res = await dio.post(
      Requests.setSid,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      data: setSidModel.toJson(),
    );
    return GetSidModel.fromJson(res.data);
  }

  static Future<UserModel> signIn({required String code}) async {
    final res = await dio.post(
      Requests.signIn,
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      ),
      data: {'password': code},
    );
    print(res.data["dostup"]);
    return UserModel.fromJson(res.data);
  }

  static Future<AddLicenseModel> addLicense(
      {required int unique_code,
      required String device_code,
      required int product_id}) async {
    final response = await dioLicense.post(
      Requests.addLicense,
      data: {
        "unique_code": unique_code,
        "device_code": device_code,
        "product_id": product_id
      },
    );
    return AddLicenseModel.fromJson(response.data);
  }

  static Future checkLicense(
      {required BuildContext context,
      required int product_id,
      required String device_code,
      required String license_key}) async {
    print(AppSettings.licenseKey);
    final response = await dioLicense.post(
      Requests.checklicense,
      data: {
        "product_id": product_id,
        "device_code": device_code,
        "license_key": license_key
      },
    );
    if (response.data["state"] == 0) {
      router.replace(LicenseRoute());
    } else if (response.data["state"] == true) {
      loadingState.startLoading();

      //After Run app
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => loadingState.afterFirstLayout(context),
      );
    } else if (response.data["state"] == false) {
      router.replace(NeedToPay());
      print("delfinFalse");
    }
  }
}
