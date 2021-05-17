import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import './data/dummy_data.dart';
import './screens/settings_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './utils/app_routes.dart';
import './models/meal.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatefulWidget {
  @override
  _MealsAppState createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Settings settings = Settings();

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGlutenFree = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactoseFree = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGlutenFree &&
            !filterLactoseFree &&
            !filterVegan &&
            filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _favoriteMeal(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
          AppRoutes.CATEGORIES_MEALS: (ctx) =>
              CategoriesMealsScreen(_availableMeals),
          AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _favoriteMeal),
          AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
        });
  }
}
