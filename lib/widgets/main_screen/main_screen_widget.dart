import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/gradient_widgets.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Movies'),
    Text('TV shows'),
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Image(
          image: AssetImage('assets/images/Tmdb-312x276-logo.png'),
          height: 37,
        ),
      ),
      body: Center(child: _widgetOptions[_selectedItemIndex]),
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
    );
  }
}
