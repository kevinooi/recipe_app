import 'package:astro_flutter/config/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../blocs/blocs.dart';
import '../../blocs/menu_cubit/menu_cubit.dart';
import '../../widgets/category_card.dart';
import '../../widgets/drink_card.dart';
import '../../widgets/food_search_box.dart';
import '../../widgets/meal_card.dart';

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
    bool foodMenuSelected =
        context.watch<MenuCubit>().state == const MenuInitial(menu: 'Food');

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
          // context.read<CategoryBloc>().add(LoadFoodCategories());
          // context.read<MealBloc>().add(const LoadMeals(strCategory: ''));
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
                  Row(
                    children: const <Widget>[
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
                  const SearchFood(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: foodMenuSelected
                  ? BlocBuilder<CategoryBloc, CategoryState>(
                      builder: (context, state) {
                        if (state is CategoryLoading) {
                          return ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, i) {
                              return Shimmer.fromColors(
                                highlightColor: Colors.white,
                                baseColor: CustomColors.tertiaryText,
                                period: const Duration(milliseconds: 800),
                                child: const CategoryCard(
                                  category: null,
                                  onTap: null,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          );
                        } else if (state is CategoryLoaded) {
                          return ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.categories.length,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, i) {
                              final category = state.categories[i];
                              return CategoryCard(
                                category: category,
                                onTap: () {
                                  context.read<MealBloc>().add(
                                        LoadMeals(
                                          strCategory:
                                              category.strCategory ?? '',
                                        ),
                                      );
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          );
                        } else {
                          return const Text('Something went wrong.');
                        }
                      },
                    )
                  : BlocBuilder<DrinkCategoryBloc, DrinkCategoryState>(
                      builder: (context, state) {
                        if (state is DrinkCategoryLoading) {
                          return ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, i) {
                              return Shimmer.fromColors(
                                highlightColor: Colors.white,
                                baseColor: CustomColors.tertiaryText,
                                period: const Duration(milliseconds: 800),
                                child: const DrinkCategoryCard(
                                  drinkCategory: null,
                                  onTap: null,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          );
                        } else if (state is DrinkCategoryLoaded) {
                          return ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.drinkCategories.length,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, i) {
                              final drinkCategory = state.drinkCategories[i];
                              return DrinkCategoryCard(
                                drinkCategory: drinkCategory,
                                onTap: () {
                                  context.read<DrinkBloc>().add(
                                        LoadDrinks(
                                          strDrink:
                                              drinkCategory.strDrink ?? '',
                                        ),
                                      );
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          );
                        } else {
                          return const Text('Something is wrong');
                        }
                      },
                    ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Popular ' + (foodMenuSelected ? 'Food' : 'Drinks'),
                style: const TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<MealBloc, MealState>(
              builder: (context, state) {
                if (state is MealLoading) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: CustomColors.tertiaryText,
                        period: const Duration(milliseconds: 800),
                        child: const MealCard(
                          meal: null,
                          onTap: null,
                        ),
                      );
                    },
                  );
                } else if (state is MealLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.meals.length,
                    itemBuilder: (context, i) {
                      final meal = state.meals[i];
                      return MealCard(
                        meal: meal,
                        onTap: () {},
                      );
                    },
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
