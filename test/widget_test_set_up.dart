import 'package:recipe_app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mocks.dart';
import 'test_material_app_widget.dart';

Future<void> createWidget({
  required WidgetTester tester,
  required Widget home,
  required MockCategoryRepository categoryRepository,
  required MockMealRepository mealRepository,
  required MockDrinkRepository drinkRepository,
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
