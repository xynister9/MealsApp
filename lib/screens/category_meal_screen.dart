import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../Models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> availableMeals ;
  const CategoryMealsScreen({Key? key , required this.availableMeals }) : super(key: key);

  static const routeName = '/category-meals';

  
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? categoryId = routeArgs['id'];
    final String? categoryTitle = routeArgs['title'];
    final List<Meal> categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title:
            Text(categoryTitle!, style: const TextStyle(fontFamily: 'Raleway')),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (_, index) {
            return MealItem(meal: categoryMeals[index]);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
