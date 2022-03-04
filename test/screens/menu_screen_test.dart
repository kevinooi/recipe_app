import 'package:astro_flutter/blocs/blocs.dart';
import 'package:flutter/widgets.dart';
import '../navigation_observer.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:astro_flutter/screens/screens.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_test_set_up.dart';

void main() {
  group('Menu screen', () {
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

    testWidgets('Food menu test', (WidgetTester tester) async {
      bool isPushedHome = false;
      await createWidget(
        tester: tester,
        home: const MenuScreen(),
        categoryRepository: categoryRepository,
        mealRepository: mealRepository,
        drinkRepository: drinkRepository,
        menuCubit: menuCubit,
        navObserver: navObserver,
      );
      navObserver.attachPushRouteObserver('/home', () {
        isPushedHome = true;
      });

      // Tap the food menu and trigger a frame.
      await tester.tap(find.byKey(const Key('food-menu')));
      await tester.pump();

      // Verify that menu cubit state is 'Food'
      expect(menuCubit.foodMenu, true);
      // Verify that page navigate to home
      expect(isPushedHome, true);
    });

    testWidgets('Drink menu test', (WidgetTester tester) async {
      bool isPushedHome = false;
      await createWidget(
        tester: tester,
        home: const MenuScreen(),
        categoryRepository: categoryRepository,
        mealRepository: mealRepository,
        drinkRepository: drinkRepository,
        menuCubit: menuCubit,
        navObserver: navObserver,
      );
      navObserver.attachPushRouteObserver('/home', () {
        isPushedHome = true;
      });

      // Tap the drink menu and trigger a frame.
      await tester.tap(find.byKey(const Key('drink-menu')));
      await tester.pump();

      // Verify that menu cubit state is 'Drink'
      expect(menuCubit.foodMenu, false);
      // Verify that page navigate to home
      expect(isPushedHome, true);
    });

    tearDown(() {
      menuCubit.close();
    });
  });
}
