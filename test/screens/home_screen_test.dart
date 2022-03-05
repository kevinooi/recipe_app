import 'package:astro_flutter/blocs/blocs.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:astro_flutter/screens/screens.dart';
import 'package:astro_flutter/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../navigation_observer.dart';
import '../widget_test_set_up.dart';

void main() {
  group('Home screen', () {
    late CategoryRepository categoryRepository;
    late MealRepository mealRepository;
    late DrinkRepository drinkRepository;
    late MenuCubit menuCubit;
    late TestNavigatorObserver navObserver;

    setUp(() {
      categoryRepository = CategoryRepository();
      mealRepository = MealRepository();
      drinkRepository = DrinkRepository();
      menuCubit = MenuCubit();
      navObserver = TestNavigatorObserver();

      initializeMockRepo(
        categoryRepository: categoryRepository,
        mealRepository: mealRepository,
        drinkRepository: drinkRepository,
        menuCubit: menuCubit,
        navObserver: navObserver,
      );
    });

    testWidgets('Food category and meal list test',
        (WidgetTester tester) async {
      await createWidget(
        tester: tester,
        home: const HomeScreen(),
        categoryRepository: categoryRepository,
        mealRepository: mealRepository,
        drinkRepository: drinkRepository,
        menuCubit: menuCubit,
        navObserver: navObserver,
      );
      // select food menu
      menuCubit.selectFood();
      await tester.pump();

      // Verify that home screen is showing food category list but not drink category list
      expect(find.byType(FoodCategories), findsOneWidget);
      expect(find.byType(DrinkCategories), findsNothing);
    });

    testWidgets('Drink category test', (WidgetTester tester) async {
      await createWidget(
        tester: tester,
        home: const HomeScreen(),
        categoryRepository: categoryRepository,
        mealRepository: mealRepository,
        drinkRepository: drinkRepository,
        menuCubit: menuCubit,
        navObserver: navObserver,
      );

      final drinkCategories = find.byType(DrinkCategories);
      final foodCategories = find.byType(FoodCategories);
      // select drink menu
      menuCubit.selectDrink();
      await tester.pump();

      // Verify that home screen is showing drink category list but not food category list
      expect(foodCategories, findsNothing);
      expect(drinkCategories, findsOneWidget);
    });

    tearDown(() {
      menuCubit.close();
    });
  });
}
