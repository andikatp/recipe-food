import 'package:flutter/material.dart';
import 'package:restaurant_app/models/meal_model.dart';
import 'package:restaurant_app/widget/meal_item_widget.dart';
import '../models/category_model.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({super.key, required this.availableMeal});
  static const String routeName = '/category-meals-screen';
  final List<Meal> availableMeal;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? title;
  String? id;
  List<Meal>? categoryMeals;
  bool isLoaded = false;

  void removeMeal(String mealId) {
    setState(() {
      categoryMeals?.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!isLoaded) {
      final Category routeArgs =
          ModalRoute.of(context)?.settings.arguments as Category;
      title = routeArgs.title;
      id = routeArgs.id;
      categoryMeals = widget.availableMeal
          .where((element) => element.categories.contains(id))
          .toList();
      isLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'No Title'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItemWidget(
            categoryMeals: categoryMeals![index],
          );
        },
        itemCount: categoryMeals?.length,
      ),
    );
  }
}
