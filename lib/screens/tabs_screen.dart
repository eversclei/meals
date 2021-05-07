import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreen = 0;
  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoriteScreen(),
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar'),
        ),
        body: _screens[_selectedScreen],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          unselectedItemColor: Colors.white,
          selectedItemColor: _theme.accentColor,
          currentIndex: _selectedScreen,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: _theme.primaryColor,
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              backgroundColor: _theme.primaryColor,
              icon: Icon(Icons.star),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}
