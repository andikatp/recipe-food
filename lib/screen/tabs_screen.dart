import 'package:flutter/material.dart';
import 'package:restaurant_app/models/meal_model.dart';
import 'package:restaurant_app/screen/categories_screen.dart';
import 'package:restaurant_app/screen/favorite_screen.dart';

import '../widget/drawer_widget.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals, {super.key});
  final List<Meal> favoriteMeals;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _page = 0;
  void _selectPage(int i) {
    setState(() {
      _page = i;
    });
  }

  late List<Map<String, dynamic>> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Category',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Favorite',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '',
          ),
        ],
        onTap: _selectPage,
      ),
      appBar: AppBar(
        title: Text(
          _pages[_page]['title'],
        ),
      ),
      body: _pages[_page]['page'],
    );
  }
}
