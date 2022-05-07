import '../../blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/custom_color.dart';
import '../../core/responsive.dart';
import '../../widgets/widgets.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Search food text form field
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SearchBox(suffixText: 'Food/Drinks'),
          ),
          const SizedBox(height: 40),
          Stack(
            children: [
              // Side background
              Container(
                width: screenWidth * 0.25,
                height: screenHeight * 0.6,
                decoration: const BoxDecoration(
                  color: CustomColors.primaryRed,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(35),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context) ||
                          Responsive.isTablet(context)
                      ? 0
                      : Responsive.isDesktop(context)
                          ? 40
                          : 80,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    MenuCard(
                      key: const Key('food-menu'),
                      onTap: () {
                        context.read<MenuCubit>().selectFood();
                        Navigator.pushNamed(context, '/home');
                      },
                      imageUrl: 'https://picsum.photos/id/488/65/65',
                      title: 'Food',
                    ),
                    const SizedBox(height: 20),
                    MenuCard(
                      key: const Key('drink-menu'),
                      onTap: () {
                        context.read<MenuCubit>().selectDrink();
                        Navigator.pushNamed(context, '/home');
                      },
                      imageUrl: 'https://picsum.photos/id/431/65/65',
                      title: 'Beverages',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
