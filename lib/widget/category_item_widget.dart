import 'package:flutter/material.dart';
import 'package:restaurant_app/models/category_model.dart';
import 'package:restaurant_app/screen/category_meals_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;

  const CategoryItemWidget({super.key, required this.category});

  void selectCategory(BuildContext context) {
    Navigator.pushNamed(context, CategoryMealsScreen.routeName,
        arguments: Category(
          id: category.id,
          title: category.title,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
