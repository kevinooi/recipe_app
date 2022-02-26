import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const String routeName = '/main-menu';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const MenuScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: const Text('Home screen'),
        ),
      ),
    );
  }
}
