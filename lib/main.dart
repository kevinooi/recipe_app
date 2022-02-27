import 'package:astro_flutter/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/category/category_bloc.dart';
import 'blocs/meal/meal_bloc.dart';
import 'config/app_router.dart';
import 'repositories/categories/category_repository.dart';
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
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc(
              categoryRepository: context.read<CategoryRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => MealBloc(
              mealRepository: context.read<MealRepository>(),
            )..add(
                const LoadMeals(),
              ),
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
