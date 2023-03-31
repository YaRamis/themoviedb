import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/app_routes.dart';
import 'package:themoviedb/widgets/errors/app_errors.dart';
import 'package:themoviedb/widgets/theme/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.themeColor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.themeColor),
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.auth,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return AppErrors.navigationError;
        });
      },
    );
  }
}
