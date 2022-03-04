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
      // Verify that home screen is showing meal list but not drink list
      expect(find.byType(MealList), findsOneWidget);
      expect(find.byType(DrinksList), findsNothing);
    });

    testWidgets('Drink category and drink list test',
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
      // select drink menu
      menuCubit.selectDrink();
      await tester.pump();

      // Verify that home screen is showing drink category list but not food category list
      expect(find.byType(FoodCategories), findsNothing);
      expect(find.byType(DrinkCategories), findsOneWidget);
      // Verify that home screen is showing drink list but not meal list
      expect(find.byType(MealList), findsNothing);
      expect(find.byType(DrinksList), findsOneWidget);
    });

    tearDown(() {
      menuCubit.close();
    });
  });
}
