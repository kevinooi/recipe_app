import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../blocs/blocs.dart';
import '../../model/drink_model.dart';
import '../../model/meal_model.dart';
import '../../repositories/repositories.dart';
import '../../widgets/widgets.dart';

class MealDetailScreen extends HookWidget {
  final Meal meal;
  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);

  static const String routeName = '/meal-detail';

  static Route route(Meal meal) {
    return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => MealDetailBloc(
                    mealRepository: context.read<MealRepository>(),
                    cacheMealCubit: context.read<CacheMealCubit>(),
                  )..add(
                      LoadMealDetail(id: meal.idMeal ?? ''),
                    )),
          BlocProvider(create: (context) => ServingCubit()),
        ],
        child: MealDetailScreen(meal: meal),
      ),
      settings: RouteSettings(name: routeName, arguments: meal),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = useTabController(
      initialLength: 3,
      initialIndex: 0,
    );

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MealDetailBloc, MealDetailState>(
          builder: (context, state) {
            if (state is MealDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MealDetailLoaded) {
              return DetailBody(
                tabController: tabController,
                meal: state.meal,
              );
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }
}

class DrinkDetailScreen extends HookWidget {
  final Drink drink;
  const DrinkDetailScreen({Key? key, required this.drink}) : super(key: key);

  static const String routeName = '/drink-detail';

  static Route route(Drink drink) {
    return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => DrinkDetailBloc(
                    drinkRepository: context.read<DrinkRepository>(),
                    cacheDrinkCubit: context.read<CacheDrinkCubit>(),
                  )..add(
                      LoadDrinkDetail(id: drink.idDrink ?? ''),
                    )),
          BlocProvider(create: (context) => ServingCubit()),
        ],
        child: DrinkDetailScreen(drink: drink),
      ),
      settings: RouteSettings(name: routeName, arguments: drink),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = useTabController(
      initialLength: 3,
      initialIndex: 0,
    );

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DrinkDetailBloc, DrinkDetailState>(
          builder: (context, state) {
            if (state is DrinkDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DrinkDetailLoaded) {
              return DetailBody(
                tabController: tabController,
                drink: state.drink,
              );
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }
}
