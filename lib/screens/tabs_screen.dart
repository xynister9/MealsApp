import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<String> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages = [];

  @override
  void initState() {
    pages = [
      {'title': 'DeliMeal', 'widget': const CategoriesScreen()},
      {
        'title': 'Favorites',
        'widget': FavScreen(
          favoriteMeals: widget.favoriteMeals,
        )
      },
    ];

    super.initState();
  }

  int _selectedPage = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text('FavScreen')),

      // drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          // 'ww',
          pages[_selectedPage]['title'] as String,
          style: const TextStyle(fontFamily: 'Raleway'),
        ),
      ),

      drawer: const MainDrawer(),

      body: pages[_selectedPage]['widget'] as Widget,

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        // backgroundColor: Theme.of(context).canvasColor,
        onTap: _selectPage,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
