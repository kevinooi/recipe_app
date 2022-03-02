import 'package:astro_flutter/config/custom_color.dart';
import 'package:astro_flutter/model/local/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../blocs/blocs.dart';
import '../../widgets/category_card.dart';
import '../../widgets/drink_card.dart';
import '../../widgets/drink_category_card.dart';
import '../../widgets/search_box.dart';
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
    bool isFoodSelected = context.watch<MenuCubit>().isFoodSelected;

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
          if (isFoodSelected) {
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
                  SearchBox(suffixText: isFoodSelected ? 'Food' : 'Drink'),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            SizedBox(
              height: 140,
              child: isFoodSelected
                  ? const _FoodCategories()
                  : const _DrinkCategories(),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Popular ' + (isFoodSelected ? 'Food' : 'Drinks'),
                style: const TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(height: 20),
            isFoodSelected ? const _MealList() : const _DrinksList(),
          ],
        ),
      ),
    );
  }
}

class _FoodCategories extends StatelessWidget {
  const _FoodCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
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
                          strCategory: category.strCategory ?? '',
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
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}

class _DrinkCategories extends StatelessWidget {
  const _DrinkCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinkCategoryBloc, DrinkCategoryState>(
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
                          strDrink: drinkCategory.strDrink ?? '',
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
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}

class _MealList extends StatelessWidget {
  const _MealList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealBloc, MealState>(
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
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: Detail(meal: meal),
                  );
                },
              );
            },
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}

class _DrinksList extends StatelessWidget {
  const _DrinksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinkBloc, DrinkState>(
      builder: (context, state) {
        if (state is DrinkLoading) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, i) {
              return Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: CustomColors.tertiaryText,
                period: const Duration(milliseconds: 800),
                child: const DrinkCard(
                  drink: null,
                  onTap: null,
                ),
              );
            },
          );
        } else if (state is DrinkLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.drinks.length,
            itemBuilder: (context, i) {
              final drink = state.drinks[i];
              return DrinkCard(
                drink: drink,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: Detail(drink: drink),
                  );
                },
              );
            },
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
