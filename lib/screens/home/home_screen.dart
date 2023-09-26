import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool foodMenu = context.watch<MenuCubit>().foodMenu;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Good morning Akila!'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          if (foodMenu) {
            context.read<CategoryBloc>().add(LoadFoodCategories());
            context.read<MealBloc>().add(const LoadMeals());
          } else {
            context.read<DrinkCategoryBloc>().add(const LoadDrinkCategories());
            context.read<DrinkBloc>().add(const LoadDrinks());
          }
        },
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Delivering to',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: <Widget>[
                      Text(
                        'Current Location',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xff9A2828),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SearchBox(suffixText: foodMenu ? 'Food' : 'Drink'),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            // Category
            foodMenu ? const FoodCategories() : const DrinkCategories(),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Popular ' + (foodMenu ? 'Food' : 'Drinks'),
                style: const TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(height: 20),
            foodMenu ? const MealList() : const DrinkList(),
          ],
        ),
      ),
    );
  }
}
