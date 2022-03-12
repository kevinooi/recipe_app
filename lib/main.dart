import 'config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'config/app_router.dart';
import 'repositories/categories/category_repository.dart';
import 'repositories/drinks/drink_repository.dart';
import 'repositories/meals/meal_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CategoryRepository>(
          create: (_) => CategoryRepository(),
        ),
        RepositoryProvider<MealRepository>(
          create: (_) => MealRepository(),
        ),
        RepositoryProvider<DrinkRepository>(
          create: (_) => DrinkRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MenuCubit(),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
              categoryRepository: context.read<CategoryRepository>(),
            )..add(LoadFoodCategories()),
          ),
          BlocProvider(
            create: (context) => MealBloc(
              mealRepository: context.read<MealRepository>(),
            )..add(const LoadMeals()),
          ),
          BlocProvider(
            create: (context) => DrinkCategoryBloc(
              categoryRepository: context.read<CategoryRepository>(),
            )..add(const LoadDrinkCategories()),
          ),
          BlocProvider(
            create: (context) => DrinkBloc(
              drinkRepository: context.read<DrinkRepository>(),
            )..add(const LoadDrinks()),
          ),
          BlocProvider(
            create: (context) => CacheMealCubit(),
          ),
          BlocProvider(
            create: (context) => CacheDrinkCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Astro Flutter',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: '/',
        ),
      ),
    );
  }
}
