import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/constants/assets.dart';
import 'package:pcassa_retail_mobile/constants/constants.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/store/license_state/license_state.dart';
import 'package:pcassa_retail_mobile/store/loading/loading_state.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/widgets/custom_button.dart';

import 'package:restart_app/restart_app.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class LicenseScreen extends StatefulWidget {
  LicenseScreen({Key? key}) : super(key: key);
  static var uniqueCodeContraller = TextEditingController();
  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

var licenseState = GetIt.I<LicenseState>();
final loadingState = LoadingState();
bool isLoading = false;

class _LicenseScreenState extends State<LicenseScreen> {
  @override
  Widget build(BuildContext context) {
     bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 28.1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(Assets.logo,
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.height / 5),
                    
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height / 84.4),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: MediaQuery.of(context).size.height / 84.4,
                          offset: Offset(0, 10))
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(paddingAll),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppColors.white))),
                      child:  TextField(
                        controller: LicenseScreen.uniqueCodeContraller,
    autofocus: false,
    style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
    decoration: InputDecoration(
      
      filled: true,
      fillColor: Colors.white,
      hintText: 'inputUniqueCode'.tr(),
      contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.7),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.7),
      ),
    ),
  ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 28.1),
            CustomButton(
              minimumSize: Size(double.infinity,60),
                  onTap: () async {
                    await licenseState.addLicense(
                        device_code: AppSettings.deviceIdFl,
                        unique_code:
                            int.parse(LicenseScreen.uniqueCodeContraller.text),
                        product_id: 4);
                    await licenseState.setLicense();
                    await Restart.restartApp();
                  },
                 
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: AppColors.white,
                        )
                      : Text("checkLicense".tr(),style: TextStyle(color: AppColors.white, fontSize: 16),),
                ),
              
            ]),
      ),
    );
  }
}
