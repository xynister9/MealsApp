import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy.dart';

class CategoriesScreen extends StatefulWidget {
  
  static const String routeName = '/categories' ;
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override

  
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      // appBar: AppBar(
      //   title: const Text(
      //     'DeliMeal',
      //     style: TextStyle(fontFamily: 'Raleway'),
      //   ),
      // ),

      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          ...dummyCategories
              .map((catData) =>
                  CategoryItem(catData.title, catData.color, catData.id))
              .toList(),
        ],
      ),
      
    );
  }
}
