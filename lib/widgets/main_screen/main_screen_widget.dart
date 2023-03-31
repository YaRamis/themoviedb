import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

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

  var _selectedItemIndex = 0;

  void _onSelectedBarItem(int index) {
    if (_selectedItemIndex != index) {
      setState(() {
        _selectedItemIndex = index;
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.slideshow),
            label: 'TV shows',
          ),
        ],
        onTap: _onSelectedBarItem,
      ),
    );
  }
}
