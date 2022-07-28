import 'package:flutter/material.dart';
import 'package:meals_app/dummy.dart';
import 'package:meals_app/widgets/app_text.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../Models/meal.dart';

class FavScreen extends StatefulWidget {
  final List<String> favoriteMeals;
  const FavScreen({Key? key, required this.favoriteMeals}) : super(key: key);
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<Meal> meals = [];

  @override
  void initState() {
    for (var meal in dummyMeals) { 
      if(widget.favoriteMeals.any((m1)=> m1==meal.id ) ){
        meals.add(meal) ;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (widget.favoriteMeals.isEmpty == true
          ? const Center(child:  AppText(text: 'No favorite dishes start adding now', size: 20 ,))
          : ListView.builder(
              itemBuilder: (_, index) {
                return MealItem(meal: meals[index]);
              },
              itemCount: meals.length,
            )),
    );
  }
}
