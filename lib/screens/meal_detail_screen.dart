// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/widgets/app_text.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/meal-detail';
  final Function(String)? toggleFavourite ;
  final Function(String)? isfav ;
  const MealDetailScreen({Key? key , required this.isfav,  required this.toggleFavourite }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    MediaQueryData deviceMediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(fontFamily: 'Raleway'),
        ),
      ),
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(meal.imageUrl),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 40,
                    width: deviceMediaQuery.size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ),
              ],
            ),
            
            Container(
                margin: const EdgeInsets.only(left: 30),
                child: const AppText(
                  text: 'Ingredients',
                  font: 'Raleway',
                  size: 25,
                  isbold: true,
                )),
            
            const SizedBox(
              height: 10,
            ),
            
            ...meal.ingredients
                .map(
                  (item) => Container(
                    margin: const EdgeInsets.only(left: 30, top: 10),
                    child: AppText(
                      text: item,
                      size: 15,
                      isbold: true,
                      color: Colors.black54,
                    ),
                  ),
                )
                .toList(),
                      
            const SizedBox(
              height: 40,
            ),

            Container(
                margin: const EdgeInsets.only(left: 30),
                child: const AppText(
                  text: 'Steps',
                  font: 'Raleway',
                  size: 25,
                  isbold: true,
                )),
            
            const SizedBox(
              height: 10,
            ),
            
            ...meal.steps
                .map(
                  (item) => Container(
                      margin: const EdgeInsets.only(left: 30, top: 10),
                      child: AppText(
                        text: item,
                        size: 15,
                        isbold: true,
                        color: Colors.black54,
                      )),
                )
                .toList(),
            
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        toggleFavourite!(meal.id) ;
      },
      
      child:  (isfav!(meal.id)==true ? const Icon(Icons.star) : const Icon(Icons.star_border ) ),
      ),

    );
  }
}
