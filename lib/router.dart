import 'package:auto_route/auto_route.dart';
import 'screens/admin_screen/admin_screen.dart';
import 'screens/dashboard_screen/dashboard_screen.dart';
import 'screens/license_add_screen/license_add_screen.dart';
import 'screens/license_add_screen/need_to_pay.dart';
import 'screens/order_screen/order_screen.dart';
import 'screens/sign_in_screen/sign_in_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tables_screen/tables_screen.dart';

@CustomAutoRouter(
  preferRelativeImports: true,
  replaceInRouteName: 'Screen,Route',
  routes: [
    CustomRoute<void>(
      page: SplashScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),
    CustomRoute<void>(
      page: SignInScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute<void>(
      page: DashboardScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute<void>(
      page: AdminScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute<void>(
      page: TablesScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute<void>(
      page: OrderScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
      CustomRoute<void>(
      page: LicenseScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
     CustomRoute<void>(
      page: NeedToPay,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    )
  ],
)
class $Router {}