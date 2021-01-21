import 'package:app/screens/initial_screen/initial_binding.dart';
import 'package:app/screens/initial_screen/initial_screen.dart';
import 'package:app/screens/login/login_bindings.dart';
import 'package:app/screens/login/login_screen.dart';
import 'package:app/screens/main_layout/main_layout.dart';
import 'package:app/screens/main_layout/main_layout_binding.dart';
import 'package:app/screens/news_screen/news_binding.dart';
import 'package:app/screens/news_screen/news_screen.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppScreens {

  static const INITIAL = AppRoutes.LAYOUT;

  static final routes = [

    GetPage(
      name: AppRoutes.LAYOUT,
      page:() => MainLayout(),
      binding: MainLayoutBinding(),
    ),

    GetPage(
      name: AppRoutes.INITIAL,
      page:() => InitialScreen(),
      binding: InitialBinding(),
    ),

    GetPage(
      name: AppRoutes.NEWS,
      page:() => NewsScreen(),
      binding: NewsBinding(),
    ),

    GetPage(
      name: AppRoutes.LOGIN,
      page:() => LoginScreen(),
      binding: LoginBindings(),
    ),

  ];
}