import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_main_info_widget.dart';

import '../../resources/resources.dart';
import 'movie_details_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Avatar: The Way Of Water'),
      ),
      body: ListView(
        children: const [
          MovieDetailsMainInfoWidget(),
          MovieDetailsCastWidget(),
        ],
      ),
    );
  }
}
