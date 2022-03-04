import 'dart:convert';

import 'package:astro_flutter/blocs/blocs.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'test_material_app_widget.dart';

initializeMockRepo({
  required CategoryRepository categoryRepository,
  required MealRepository mealRepository,
  required DrinkRepository drinkRepository,
  required MenuCubit menuCubit,
  required NavigatorObserver navObserver,
}) {
  categoryRepository.client = MockClient((request) async {
    final mapJson = {
      'categories': [
        {
          'idCategory': '1',
          'strCategory': 'Food Category 1',
          'strCategoryThumb': 'https://picsum.photos/id/488/80/80',
          'strCategoryDescription': 'Food Category 1 description',
        }
      ]
    };
    return Response(jsonEncode(mapJson), 200);
  });

  categoryRepository.client = MockClient((request) async {
    final mapJson = {
      'drinks': [
        {
          'idDrink': '1',
          'strDrink': 'Drink Category 1',
          'strDrinkThumb': 'https://picsum.photos/id/431/80/80',
        }
      ]
    };
    return Response(jsonEncode(mapJson), 200);
  });

  mealRepository.client = MockClient((request) async {
    final mapJson = {
      'meals': [
        {
          'idMeal': '1',
          'strMealThumb': 'https://picsum.photos/id/488/80/80',
          'strMeal': 'Meal 1',
          'strCategory': 'Meal 1 Category',
          'strArea': 'Meal 1 Area',
        }
      ]
    };
    return Response(jsonEncode(mapJson), 200);
  });

  drinkRepository.client = MockClient((request) async {
    final mapJson = {
      'drinks': [
        {
          'idDrink': '1',
          'strDrinkThumb': 'https://picsum.photos/id/488/80/80',
          'strDrink': 'Drink 1',
          'strCategory': 'Drink 1 Category',
          'strAlcoholic': 'Alcoholic',
        }
      ]
    };
    return Response(jsonEncode(mapJson), 200);
  });
}

Future<void> createWidget({
  required WidgetTester tester,
  required Widget home,
  required CategoryRepository categoryRepository,
  required MealRepository mealRepository,
  required DrinkRepository drinkRepository,
  required MenuCubit menuCubit,
  required NavigatorObserver navObserver,
}) async {
  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
            create: (context) =>
                CategoryBloc(categoryRepository: categoryRepository)),
        BlocProvider<DrinkCategoryBloc>(
            create: (context) =>
                DrinkCategoryBloc(categoryRepository: categoryRepository)),
        BlocProvider<MealBloc>(
            create: (context) => MealBloc(mealRepository: mealRepository)),
        BlocProvider<DrinkBloc>(
            create: (context) => DrinkBloc(drinkRepository: drinkRepository)),
        BlocProvider<MenuCubit>(create: (context) => menuCubit),
      ],
      child: TestMaterialAppWidget(
        home: home,
        navigatorObserver: navObserver,
      ),
    ),
  );
}
