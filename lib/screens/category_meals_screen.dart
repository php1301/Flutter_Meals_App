import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
// import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  static const routeName = '/categories-meal';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;
  @override
  // void initState() {} //initState not work properly with widgets that has context

  @override
  void didChangeDependencies() {
    // didChangeDependencies run mutiple times va override setState
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments
          as Map<String, String>; // String key and string values
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      // displayedMeals =
      //     DUMMY_MEALS.where((e) => e.categories.contains(categoryId)).toList();
      displayedMeals = widget.availableMeals
          .where((e) => e.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
      super.didChangeDependencies();
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
