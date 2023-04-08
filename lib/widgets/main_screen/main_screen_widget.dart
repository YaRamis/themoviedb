import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/widgets/movies_tab/movies_list_widget.dart';

import '../theme/app_colors.dart';
import '../theme/gradient_widgets.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  static final List<Widget> _widgetOptions = <Widget>[
    const Text('Home'),
    const MoviesListWidget(),
    const Text('TV shows'),
  ];

  bool _isFirstSelected = true,
      _isSecondSelected = false,
      _isThirdSelected = false;

  var _selectedItemIndex = 0;

  void _onSelectedBarItem(int index) {
    if (_selectedItemIndex != index) {
      setState(() {
        _selectedItemIndex = index;

        _selectedItemIndex == 0
            ? _isFirstSelected = true
            : _isFirstSelected = false;
        _selectedItemIndex == 1
            ? _isSecondSelected = true
            : _isSecondSelected = false;
        _selectedItemIndex == 2
            ? _isThirdSelected = true
            : _isThirdSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Image(
            image: AssetImage(AppImages.tmdb312x276Logo),
            height: 37,
          ),
        ),
        body: IndexedStack(
          index: _selectedItemIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.activeColor,
          unselectedItemColor: AppColors.postActiveColor,
          currentIndex: _selectedItemIndex,
          items: [
            BottomNavigationBarItem(
              icon: DefaultGradientIcon(
                Icons.home,
                24,
                isActive: _isFirstSelected,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: DefaultGradientIcon(Icons.local_movies, 24,
                  isActive: _isSecondSelected),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: DefaultGradientIcon(
                Icons.slideshow,
                24,
                isActive: _isThirdSelected,
              ),
              label: 'TV shows',
            ),
          ],
          onTap: _onSelectedBarItem,
        ),
      ),
    );
  }
}
