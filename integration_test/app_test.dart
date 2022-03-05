import 'package:astro_flutter/main.dart';
import 'package:astro_flutter/screens/screens.dart';
import 'package:astro_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    "On tap food menu should navigate to home screen "
    "which is showing food categories and meal list "
    "on tap meal card will navigate to food detail screen "
    "tab bar view first tab showing ingredient tab "
    "serving count start at 1 and can increment and decrement "
    "serving count state cannot be lower than 1 "
    "tab bar view second tab showing steps "
    "tab bar view third tab showing coming soon",
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final foodMenu = find.byKey(const Key('food-menu'));
      // tap serving counter increment and decrement
      final increment = find.byKey(const Key('increment'));
      final decrement = find.byKey(const Key('decrement'));
      final tabBarView = find.byType(TabBarView);

      await tester.tap(foodMenu);
      await tester.pumpAndSettle();

      // Verify that on tap food menu will navigate to home screen
      expect(find.byType(HomeScreen), findsOneWidget);
      // Verify that home screen showing food categories and meal list
      expect(find.byType(FoodCategories), findsOneWidget);
      expect(find.byType(MealList), findsOneWidget);

      // tap on first food category
      await tester.tap(find.byKey(const Key('food-category-0')));
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      Future.delayed(const Duration(seconds: 2), () {});
      final mealCard = find.byKey(const Key('beef-0'));
      // Verify that meal list first meal is beef category

      expect(mealCard, findsOneWidget);

      // tap on the first meal card
      await tester.tap(mealCard);
      await tester.pumpAndSettle();

      final detail = find.byType(MealDetailScreen);
      // Verify that on tap meal card navigate to meal detail screen
      expect(detail, findsOneWidget);

      // Verify that tab bar is found
      expect(tabBarView, findsOneWidget);
      // Verify that is on the first tab
      expect(find.byType(IngredientTab), findsOneWidget);

      // initial counter state is 1
      expect(find.text('1 Servings'), findsOneWidget);

      await tester.tap(increment);
      await tester.pumpAndSettle();

      // make sure counter state + 1
      expect(find.text('2 Servings'), findsOneWidget);
      expect(find.text('2'), findsWidgets);

      await tester.tap(increment);
      await tester.pumpAndSettle();

      // make sure counter state + 1
      expect(find.text('3 Servings'), findsOneWidget);
      expect(find.text('3'), findsWidgets);

      await tester.tap(decrement);
      await tester.pumpAndSettle();

      // make sure counter state - 1
      expect(find.text('2 Servings'), findsOneWidget);
      expect(find.text('2'), findsWidgets);

      await tester.tap(decrement);
      await tester.pumpAndSettle();

      // make sure counter state - 1
      expect(find.text('1 Servings'), findsOneWidget);
      expect(find.text('1'), findsWidgets);

      await tester.tap(decrement);
      await tester.pumpAndSettle();

      // make sure counter cannot go lower than 1
      expect(find.text('1 Servings'), findsOneWidget);
      expect(find.text('1'), findsWidgets);

      // Swipe the tab bar view
      await tester.timedDrag(tabBarView, const Offset(-400, 0),
          const Duration(milliseconds: 4000));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify that second tab showing steps article markdown
      expect(find.byType(ArticleMarkdown), findsOneWidget);

      await tester.timedDrag(tabBarView, const Offset(-400, 0),
          const Duration(milliseconds: 4000));
      await tester.pumpAndSettle();

      // Verify that third tab showing Coming Soon
      expect(find.text('Coming Soon'), findsOneWidget);
    },
  );

  testWidgets(
    "On tap drink menu should navigate to home screen "
    "which is showing drink categories and drink list "
    "on tap drink card will navigate to drink detail screen "
    "tab bar view first tab showing ingredient tab "
    "serving count start at 1 and can increment and decrement "
    "serving count state cannot be lower than 1 "
    "tab bar view second tab showing steps "
    "tab bar view third tab showing coming soon",
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final drinkMenu = find.byKey(const Key('drink-menu'));
      final detail = find.byType(DrinkDetailScreen);
      final tabBarView = find.byType(TabBarView);

      await tester.tap(drinkMenu);
      await tester.pumpAndSettle();

      // Verify that on tap drink menu will navigate to home screen
      expect(find.byType(HomeScreen), findsOneWidget);
      // Verify that home screen showing drink categories and drink list
      expect(find.byType(DrinkCategories), findsOneWidget);
      expect(find.byType(DrinkList), findsOneWidget);

      // tap on second drink category
      await tester.tap(find.byKey(const Key('drink-category-1')));
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      Future.delayed(const Duration(seconds: 2));
      final drinkCard = find.byKey(const Key('belgian blue-0'));
      // Verify that drink list first drink is belgian blue

      expect(drinkCard, findsOneWidget);

      // tap on the first drink card
      await tester.tap(drinkCard);
      await tester.pumpAndSettle();

      // Verify that on tap drink card navigate to drink detail screen
      expect(detail, findsOneWidget);

      // Verify that tab bar is found
      expect(tabBarView, findsOneWidget);
      // Verify that is on the first tab
      expect(find.byType(IngredientTab), findsOneWidget);

      // tap serving counter increment and decrement
      final increment = find.byKey(const Key('increment'));
      final decrement = find.byKey(const Key('decrement'));

      // initial counter state is 1
      expect(find.text('1 Servings'), findsOneWidget);

      await tester.tap(increment);
      await tester.pumpAndSettle();

      // make sure counter state + 1
      expect(find.text('2 Servings'), findsOneWidget);
      expect(find.text('2'), findsWidgets);

      await tester.tap(increment);
      await tester.pumpAndSettle();

      // make sure counter state + 1
      expect(find.text('3 Servings'), findsOneWidget);
      expect(find.text('3'), findsWidgets);

      await tester.tap(decrement);
      await tester.pumpAndSettle();

      // make sure counter state - 1
      expect(find.text('2 Servings'), findsOneWidget);
      expect(find.text('2'), findsWidgets);

      await tester.tap(decrement);
      await tester.pumpAndSettle();

      // make sure counter state - 1
      expect(find.text('1 Servings'), findsOneWidget);
      expect(find.text('1'), findsWidgets);

      await tester.tap(decrement);
      await tester.pumpAndSettle();

      // make sure counter cannot go lower than 1
      expect(find.text('1 Servings'), findsOneWidget);
      expect(find.text('1'), findsWidgets);

      // Swipe the tab bar view
      await tester.timedDrag(tabBarView, const Offset(-400, 0),
          const Duration(milliseconds: 4000));
      await tester.pumpAndSettle();

      // Verify that second tab showing steps article markdown
      expect(find.byType(ArticleMarkdown), findsOneWidget);

      await tester.timedDrag(tabBarView, const Offset(-400, 0),
          const Duration(milliseconds: 4000));
      await tester.pumpAndSettle();

      // Verify that third tab showing Coming Soon
      expect(find.text('Coming Soon'), findsOneWidget);
    },
  );
}
