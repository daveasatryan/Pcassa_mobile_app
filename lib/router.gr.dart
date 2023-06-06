// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import 'constants/order_page_types.dart' as _i11;
import 'models/basket_item_model/basket_item_model.dart' as _i14;
import 'models/order_model/order_model.dart' as _i13;
import 'models/savedorder_model/savedorder_model.dart' as _i12;
import 'screens/admin_screen/admin_screen.dart' as _i4;
import 'screens/dashboard_screen/dashboard_screen.dart' as _i3;
import 'screens/license_add_screen/license_add_screen.dart' as _i7;
import 'screens/license_add_screen/need_to_pay.dart' as _i8;
import 'screens/order_screen/order_screen.dart' as _i6;
import 'screens/sign_in_screen/sign_in_screen.dart' as _i2;
import 'screens/splash_screen.dart' as _i1;
import 'screens/tables_screen/tables_screen.dart' as _i5;

class Router extends _i9.RootStackRouter {
  Router([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.CustomPage<void>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignInRoute.name: (routeData) {
      return _i9.CustomPage<void>(
        routeData: routeData,
        child: const _i2.SignInScreen(),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardRoute.name: (routeData) {
      return _i9.CustomPage<void>(
        routeData: routeData,
        child: const _i3.DashboardScreen(),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminRoute.name: (routeData) {
      final args = routeData.argsAs<AdminRouteArgs>(
          orElse: () => const AdminRouteArgs());
      return _i9.CustomPage<void>(
        routeData: routeData,
        child: _i4.AdminScreen(key: args.key),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TablesRoute.name: (routeData) {
      final args = routeData.argsAs<TablesRouteArgs>();
      return _i9.CustomPage<void>(
        routeData: routeData,
        child: _i5.TablesScreen(
          key: args.key,
          orderPageType: args.orderPageType,
          editedOrders: args.editedOrders,
        ),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrderRoute.name: (routeData) {
      final args = routeData.argsAs<OrderRouteArgs>();
      return _i9.CustomPage<void>(
        routeData: routeData,
        child: _i6.OrderScreen(
          key: args.key,
          order: args.order,
          orderPageType: args.orderPageType,
          basket: args.basket,
          onShowPayment: args.onShowPayment,
          page: args.page,
        ),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LicenseRoute.name: (routeData) {
      final args = routeData.argsAs<LicenseRouteArgs>(
          orElse: () => const LicenseRouteArgs());
      return _i9.CustomPage<void>(
        routeData: routeData,
        child: _i7.LicenseScreen(key: args.key),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NeedToPay.name: (routeData) {
      return _i9.CustomPage<void>(
        routeData: routeData,
        child: const _i8.NeedToPay(),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          SignInRoute.name,
          path: '/sign-in-screen',
        ),
        _i9.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-screen',
        ),
        _i9.RouteConfig(
          AdminRoute.name,
          path: '/admin-screen',
        ),
        _i9.RouteConfig(
          TablesRoute.name,
          path: '/tables-screen',
        ),
        _i9.RouteConfig(
          OrderRoute.name,
          path: '/order-screen',
        ),
        _i9.RouteConfig(
          LicenseRoute.name,
          path: '/license-screen',
        ),
        _i9.RouteConfig(
          NeedToPay.name,
          path: '/need-to-pay',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in-screen',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard-screen',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.AdminScreen]
class AdminRoute extends _i9.PageRouteInfo<AdminRouteArgs> {
  AdminRoute({_i10.Key? key})
      : super(
          AdminRoute.name,
          path: '/admin-screen',
          args: AdminRouteArgs(key: key),
        );

  static const String name = 'AdminRoute';
}

class AdminRouteArgs {
  const AdminRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'AdminRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.TablesScreen]
class TablesRoute extends _i9.PageRouteInfo<TablesRouteArgs> {
  TablesRoute({
    _i10.Key? key,
    required _i11.OrderPageType orderPageType,
    required List<_i12.SavedOrderModel> editedOrders,
  }) : super(
          TablesRoute.name,
          path: '/tables-screen',
          args: TablesRouteArgs(
            key: key,
            orderPageType: orderPageType,
            editedOrders: editedOrders,
          ),
        );

  static const String name = 'TablesRoute';
}

class TablesRouteArgs {
  const TablesRouteArgs({
    this.key,
    required this.orderPageType,
    required this.editedOrders,
  });

  final _i10.Key? key;

  final _i11.OrderPageType orderPageType;

  final List<_i12.SavedOrderModel> editedOrders;

  @override
  String toString() {
    return 'TablesRouteArgs{key: $key, orderPageType: $orderPageType, editedOrders: $editedOrders}';
  }
}

/// generated route for
/// [_i6.OrderScreen]
class OrderRoute extends _i9.PageRouteInfo<OrderRouteArgs> {
  OrderRoute({
    _i10.Key? key,
    required _i13.OrderModel order,
    required _i11.OrderPageType orderPageType,
    required List<_i14.BasketItemModel> basket,
    required void Function()? onShowPayment,
    int? page,
  }) : super(
          OrderRoute.name,
          path: '/order-screen',
          args: OrderRouteArgs(
            key: key,
            order: order,
            orderPageType: orderPageType,
            basket: basket,
            onShowPayment: onShowPayment,
            page: page,
          ),
        );

  static const String name = 'OrderRoute';
}

class OrderRouteArgs {
  const OrderRouteArgs({
    this.key,
    required this.order,
    required this.orderPageType,
    required this.basket,
    required this.onShowPayment,
    this.page,
  });

  final _i10.Key? key;

  final _i13.OrderModel order;

  final _i11.OrderPageType orderPageType;

  final List<_i14.BasketItemModel> basket;

  final void Function()? onShowPayment;

  final int? page;

  @override
  String toString() {
    return 'OrderRouteArgs{key: $key, order: $order, orderPageType: $orderPageType, basket: $basket, onShowPayment: $onShowPayment, page: $page}';
  }
}

/// generated route for
/// [_i7.LicenseScreen]
class LicenseRoute extends _i9.PageRouteInfo<LicenseRouteArgs> {
  LicenseRoute({_i10.Key? key})
      : super(
          LicenseRoute.name,
          path: '/license-screen',
          args: LicenseRouteArgs(key: key),
        );

  static const String name = 'LicenseRoute';
}

class LicenseRouteArgs {
  const LicenseRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'LicenseRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.NeedToPay]
class NeedToPay extends _i9.PageRouteInfo<void> {
  const NeedToPay()
      : super(
          NeedToPay.name,
          path: '/need-to-pay',
        );

  static const String name = 'NeedToPay';
}
