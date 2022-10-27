import 'package:flutter/material.dart';
import 'package:restaurant_app/models/meal_model.dart';
import 'package:restaurant_app/screen/meal_detail_screen.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({super.key, required this.categoryMeals});
  final Meal categoryMeals;
  // String get complexityText {
  //   switch (categoryMeals.complexity) {
  //     case Complexity.simple:
  //       return 'Simple';
  //       break;
  //     case Complexity.challenging:
  //       return 'Challenging';
  //       break;
  //     case Complexity.hard:
  //       return 'Hard';
  //       break;
  //     default:
  //       return 'Unknown';
  //   }
  // }

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailScreen.routeName,
      arguments: categoryMeals,
    ).then(
      (result) {
        if (result != null && result is String) {
          //removeItem(result);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4.0,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.network(
                    categoryMeals.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    child: Text(
                      categoryMeals.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DetailMealWidget(
                      icon: Icons.schedule,
                      text: '${categoryMeals.duration} min'),
                  DetailMealWidget(
                    icon: Icons.work,
                    text: categoryMeals.complexity.name,
                  ),
                  DetailMealWidget(
                    icon: Icons.attach_money,
                    text: categoryMeals.affordability.name,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailMealWidget extends StatelessWidget {
  const DetailMealWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(text),
      ],
    );
  }
}
