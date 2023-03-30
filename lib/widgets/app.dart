import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/theme/app_colors.dart';

import 'auth/auth_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.themeColor),
      ),
      home: const AuthWidget(),
    );
  }
}
