import 'package:flutter/material.dart';

import 'auth/auth_widget.dart';
import 'main_screen/main_screen_widget.dart';

abstract class AppRoutes {
  static String auth = '/auth';
  static String mainScreen = '/main_screen';

  static Map<String, WidgetBuilder> routes = {
    auth: (context) => const AuthWidget(),
    mainScreen: (context) => const MainScreenWidget(),
  };
}
