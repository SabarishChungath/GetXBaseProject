import 'package:auto_route/annotations.dart';
import 'package:getx_base_project/screens/about/about_screen.dart';
import 'package:getx_base_project/screens/cart/cart_screen.dart';
import 'package:getx_base_project/screens/category/category_screen.dart';
import 'package:getx_base_project/screens/home/home_screen.dart';
import 'package:getx_base_project/screens/splash/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(
      page: HomeScreen,
      children: [
        AutoRoute(
          page: CategoryScreen,
          initial: true,
        ),
        AutoRoute(
          page: CartScreen,
          initial: true,
        ),
        AutoRoute(
          page: AboutScreen,
          initial: true,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
