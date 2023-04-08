import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/widgets/app_routes.dart';
import 'package:themoviedb/widgets/theme/app_colors.dart';
import 'package:themoviedb/widgets/theme/app_gradients.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String date;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.date,
    required this.description,
  });
}

class MoviesListWidget extends StatefulWidget {
  const MoviesListWidget({Key? key}) : super(key: key);

  @override
  State<MoviesListWidget> createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends State<MoviesListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: AppImages.avatarTheWayOfWater,
      title: 'Avatar: The Way Of Water',
      date: 'December 14, 2022',
      description:
          'Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.',
    ),
    Movie(
      id: 2,
      imageName: AppImages.winnieThePoohBloodAndHoney,
      title: 'Winnie the Pooh: Blood and Honey',
      date: 'January 27, 2023',
      description:
          'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
    ),
    Movie(
      id: 3,
      imageName: AppImages.avatarTheWayOfWater,
      title: 'Ramis Myrzabekov',
      date: 'January 27, 2023',
      description:
          'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
    ),
    Movie(
      id: 4,
      imageName: AppImages.winnieThePoohBloodAndHoney,
      title: 'Transformers',
      date: 'January 27, 2023',
      description:
          'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
    ),
    Movie(
      id: 5,
      imageName: AppImages.avatarTheWayOfWater,
      title: 'Home',
      date: 'January 27, 2023',
      description:
          'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
    ),
    Movie(
      id: 6,
      imageName: AppImages.winnieThePoohBloodAndHoney,
      title: '2 ways to die',
      date: 'January 27, 2023',
      description:
          'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
    ),
    Movie(
      id: 7,
      imageName: AppImages.avatarTheWayOfWater,
      title: 'World War Z',
      date: 'January 27, 2023',
      description:
          'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
    ),
    Movie(
      id: 8,
      imageName: AppImages.winnieThePoohBloodAndHoney,
      title: 'World War Z 2',
      date: 'January 27, 2023',
      description:
          'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
    ),
    Movie(
      id: 9,
      imageName: AppImages.avatarTheWayOfWater,
      title: 'World War',
      date: 'January 27, 2023',
      description:
          'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
    ),
    Movie(
      id: 10,
      imageName: AppImages.winnieThePoohBloodAndHoney,
      title: 'My Hero Academia',
      date: 'January 27, 2023',
      description:
          'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
    )
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;

    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      AppRoutes.movieDetails,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 70),
          itemCount: _filteredMovies.length,
          itemExtent: 160,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.black.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      )
                    ]),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 25, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  movie.date,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const Spacer(),
                                Text(
                                  movie.description,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => _onMovieTap(index),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.searchAppLinearGradient,
          ),
          padding: const EdgeInsets.only(bottom: 40),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade500,
              ),
              suffixIcon: const Icon(Icons.search),
              suffixIconColor: AppColors.themeColor,
              filled: true,
              fillColor: Colors.white.withOpacity(0),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
