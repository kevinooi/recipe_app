import 'package:astro_flutter/config/extensions.dart';
import 'package:astro_flutter/model/drink_model.dart';
import 'package:astro_flutter/model/meal_model.dart';
import 'package:astro_flutter/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    logD('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return MenuScreen.route();
      case MenuScreen.routeName:
        return MenuScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case MealDetailScreen.routeName:
        return MealDetailScreen.route(settings.arguments as Meal);
      case DrinkDetailScreen.routeName:
        return DrinkDetailScreen.route(settings.arguments as Drink);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
