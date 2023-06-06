import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/store/license_state/license_state.dart';
import 'package:pcassa_retail_mobile/store/sign_in_state/sign_in_state.dart';
import 'package:pcassa_retail_mobile/store/stop_list_state/stop_list_state.dart';
import 'package:pcassa_retail_mobile/themes/dark_theme.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';
import 'constants/app_settings.dart';
import 'constants/assets.dart';
import 'constants/constants.dart';
import 'http/dio_options.dart';
import 'http/interceptors/api_interceptor.dart';
import 'services.dart';
import 'store/auth/auth_state.dart';
import 'store/basket_state/basket_state.dart';
import 'store/payment_state/payment_state.dart';
import 'store/services_state/services_state.dart';
import 'store/tables_state/tables_state.dart';
import 'themes/light_theme.dart';

Future<void> main() async {
  ErrorWidget.builder = (details) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "errorr",
        textAlign: TextAlign.center,
      ),
    );
  };
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  const defaultLanguage = Locale('ru');
  final supportedLanguages = [
    const Locale('ru'),
    const Locale('en'),
    const Locale('hy'),
  ];

  AppSettings.languageCode = 'ru';
  AppSettings.licenseServer = 'http://192.168.0.107:8000';

  SecureSharedPref.getInstance().then((value) {
    value.getString("baseUrl", isEncrypted: false).then((value) {
      dio = Dio(
        BaseOptions(
          baseUrl: value.toString(),
          connectTimeout: 10000,
          receiveTimeout: 100000,
          contentType: Headers.jsonContentType,
        ),
      )..interceptors.addAll(
          <Interceptor>[
            ApiInterceptor(),
          ],
        );
    });
  });
  dioLicense = Dio(
    BaseOptions(
      baseUrl: AppSettings.licenseServer,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      contentType: Headers.jsonContentType,
    ),
  );

  GetIt.I.registerSingleton(AuthState());
  GetIt.I.registerSingleton(ServicesState());
  GetIt.I.registerSingleton(BasketState());
  GetIt.I.registerSingleton(TablesState());
  GetIt.I.registerSingleton(PaymentState());
  GetIt.I.registerSingleton(StopLisProducttState());
  GetIt.I.registerSingleton(SignInState());
  GetIt.I.registerSingleton(LicenseState());

  runApp(
    EasyLocalization(
      supportedLocales: supportedLanguages,
      useOnlyLangCode: true,
      startLocale: defaultLanguage,
      useFallbackTranslations: true,
      path: Assets.languages,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
