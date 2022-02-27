import 'package:astro_flutter/config/extensions.dart';
import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/main_menu/menu_screen.dart';

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
