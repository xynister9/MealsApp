import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/widgets/app_text.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget listTileBuilder(Icon icon, String title, GestureTapCallback? tapHandler , BuildContext context ) {
    return InkWell(
      onTap: tapHandler,

      child: ListTile(
        leading: icon,
        title: AppText(
          text: title,
          size: 20,
          isbold: true,
          font: 'RobotoCondensed',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: AppText(
              text: 'Cooking Up!',
              isbold: true,
              size: 30,
              // font: 'RobotoCondensed',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          
          listTileBuilder(
            const Icon(Icons.restaurant),
            'Meals',
            () {
              Navigator.of(context).pushReplacementNamed( '/');
            },
            context,
          ),

          listTileBuilder(
            const Icon(Icons.settings),
            'Filters',
            ()  {
              Navigator.of(context).pushReplacementNamed( FiltersScreen.routeName, arguments: {} );
            },
            context,
          ),
        ],
      ),
    );
  }
}
