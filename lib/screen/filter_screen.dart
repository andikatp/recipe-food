import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/drawer_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(
      {super.key, required this.saveFilter, required this.currentFilters});
  static const String routeName = '/filter-screen';
  final Function saveFilter;
  final Map<String, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget buildSwitchListTile(
      {required String title,
      required String subtitle,
      required bool currentValue,
      required Function(bool) updateValue}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
        title: const Text('Your Filters '),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    title: 'Gluten Free',
                    subtitle: 'Only Include Gluten Free Meals',
                    currentValue: _glutenFree,
                    updateValue: (bool newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                buildSwitchListTile(
                    title: 'Vegetarian',
                    subtitle: 'Only Include vegetarian Meals',
                    currentValue: _vegetarian,
                    updateValue: (bool newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                buildSwitchListTile(
                    title: 'Vegan',
                    subtitle: 'Only Include vegan Meals',
                    currentValue: _vegan,
                    updateValue: (bool newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                buildSwitchListTile(
                    title: 'Lactose Free',
                    subtitle: 'Only Include Lactose Free Meals',
                    currentValue: _lactoseFree,
                    updateValue: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
