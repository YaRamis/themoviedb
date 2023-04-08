import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_widget.dart';

import 'auth/auth_widget.dart';
import 'main_screen/main_screen_widget.dart';

abstract class AppRoutes {
  static String auth = '/auth';
  static String mainScreen = '/main_screen';
  static String movieDetails = '/main_screen/movie_details';

  static Map<String, WidgetBuilder> routes = {
    auth: (context) => const AuthWidget(),
    mainScreen: (context) => const MainScreenWidget(),
    movieDetails: (context) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments is int) {
        return MovieDetailsWidget(movieId: arguments);
      } else {
        return const MovieDetailsWidget(movieId: 0);
      }
    },
  };
}
