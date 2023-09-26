import 'package:recipe_app/screens/screens.dart';
import 'navigation_observer.dart';
import 'package:flutter/material.dart';

class TestMaterialAppWidget extends StatelessWidget {
  final Widget? home;
  final NavigatorObserver? navigatorObserver;

  const TestMaterialAppWidget({Key? key, this.home, this.navigatorObserver})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Test',
      home: home,
      navigatorObservers: [navigatorObserver ?? TestNavigatorObserver()],
      routes: _testRoutes(),
    );
  }

  Map<String, WidgetBuilder> _testRoutes() {
    return <String, WidgetBuilder>{
      MenuScreen.routeName: (context) => _testRoute(MenuScreen.routeName),
      HomeScreen.routeName: (context) => _testRoute(HomeScreen.routeName),
      MealDetailScreen.routeName: (context) =>
          _testRoute(MealDetailScreen.routeName),
      DrinkDetailScreen.routeName: (context) =>
          _testRoute(DrinkDetailScreen.routeName),
    };
  }

  _testRoute(String routeName) => DummyTestRoute(routeName: routeName);
}

class DummyTestRoute extends StatelessWidget {
  final String routeName;

  DummyTestRoute({Key? key, required this.routeName})
      : super(key: key ?? Key(routeName));

  @override
  Widget build(BuildContext context) => Text(routeName);
}
