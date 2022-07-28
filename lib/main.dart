import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/dummy.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meal_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> filterValues = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = dummyMeals;
  List<String> favouriteMeals = [];

  void setFilter(Map<String, bool> newFilters) {
    setState(() {
      filterValues = newFilters;

      availableMeals = dummyMeals.where((meal) {
        if (filterValues['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filterValues['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filterValues['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filterValues['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final existingIndex = favouriteMeals.indexWhere((meal) {
      return meal == mealId;
    });
    if(existingIndex>=0){
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favouriteMeals.add(mealId);
      });
    }
  }

  bool isfav(String mealId){
    return favouriteMeals.any((meal) => meal == mealId) ;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),

        fontFamily: 'Raleway',

        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                // fontStyle: FontStyle.italic,
              ),
            ),
      ),
      // home: const TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(
              favoriteMeals: favouriteMeals,
            ),
        CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              availableMeals: availableMeals,
            ),
        MealDetailScreen.routName: (ctx) => MealDetailScreen( isfav : isfav, toggleFavourite: toggleFavourite,),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              currFilters: filterValues,
              saveFilter: setFilter,
            ),
      },
    );
  }
}

