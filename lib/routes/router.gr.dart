// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../screens/about/about_screen.dart' as _i5;
import '../screens/cart/cart_screen.dart' as _i4;
import '../screens/category/category_screen.dart' as _i3;
import '../screens/home/home_screen.dart' as _i2;
import '../screens/splash/splash_screen.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    CategoryScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.CategoryScreen());
    },
    CartScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CartScreen());
    },
    AboutScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AboutScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashScreen.name, path: '/'),
        _i6.RouteConfig(HomeScreen.name, path: '/home-screen', children: [
          _i6.RouteConfig(CategoryScreen.name,
              path: '', parent: HomeScreen.name),
          _i6.RouteConfig(CartScreen.name, path: '', parent: HomeScreen.name),
          _i6.RouteConfig(AboutScreen.name, path: '', parent: HomeScreen.name)
        ])
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreen extends _i6.PageRouteInfo<void> {
  const SplashScreen() : super(name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for [_i2.HomeScreen]
class HomeScreen extends _i6.PageRouteInfo<void> {
  const HomeScreen({List<_i6.PageRouteInfo>? children})
      : super(name, path: '/home-screen', initialChildren: children);

  static const String name = 'HomeScreen';
}

/// generated route for [_i3.CategoryScreen]
class CategoryScreen extends _i6.PageRouteInfo<void> {
  const CategoryScreen() : super(name, path: '');

  static const String name = 'CategoryScreen';
}

/// generated route for [_i4.CartScreen]
class CartScreen extends _i6.PageRouteInfo<void> {
  const CartScreen() : super(name, path: '');

  static const String name = 'CartScreen';
}

/// generated route for [_i5.AboutScreen]
class AboutScreen extends _i6.PageRouteInfo<void> {
  const AboutScreen() : super(name, path: '');

  static const String name = 'AboutScreen';
}
