import 'package:flutter/material.dart';
import 'package:meals_app/widgets/app_text.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  final Function saveFilter;
  final Map<String, bool> currFilters;
  const FiltersScreen(
      {Key? key, required this.currFilters, required this.saveFilter})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenfree = widget.currFilters['gluten'] as bool;
    _lactosefree = widget.currFilters['lactose'] as bool;
    _vegan = widget.currFilters['vegan'] as bool;
    _vegetarian = widget.currFilters['vegetarian'] as bool;

    super.initState();
  }

  Widget switchBuilder(String title, String description, bool currValue,
      Function(bool)? updatevalue) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      title: Text(title),
      subtitle: Text(description),
      value: currValue,
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filters',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> newfilters = {
                'gluten': _glutenfree,
                'lactose': _lactosefree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilter(newfilters);
              Navigator.of(context).pushReplacementNamed( '/' ) ;
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const AppText(
              text: 'Choose your filters',
              font: 'Raleway',
              size: 20,
              isbold: true,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                switchBuilder(
                  'Gluten-free',
                  'Include only gluten-free meals.',
                  _glutenfree,
                  (newValue) {
                    setState(() {
                      _glutenfree = newValue;
                    });
                  },
                ),
                switchBuilder(
                  'Lactose-free',
                  'Include only lactose-free meals.',
                  _lactosefree,
                  (newValue) {
                    setState(() {
                      _lactosefree = newValue;
                    });
                  },
                ),
                switchBuilder(
                  'Vegan',
                  'Include only vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                switchBuilder(
                  'Vegetarian',
                  'Include only vegetarian meals.',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
