import 'package:astro_flutter/main.dart';
import 'package:astro_flutter/screens/screens.dart';
import 'package:astro_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    "On tap food menu should navigate to home screen "
    "which is showing food categories and meal list "
    "on tap meal card will navigate to detail screen",
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final foodMenu = find.byKey(const Key('food-menu'));

      await tester.tap(foodMenu);
      await tester.pumpAndSettle();

      // Verify that on tap food menu will navigate to home screen
      expect(find.byType(HomeScreen), findsOneWidget);
      // Verify that home screen showing food categories and meal list
      expect(find.byType(FoodCategories), findsOneWidget);
      expect(find.byType(MealList), findsOneWidget);

      // tap on first food category
      await tester.tap(find.byKey(const Key('food-category-0')));
      await tester.pumpAndSettle();

      final mealCard = find.byKey(const Key('beef-0'));
      // Verify that meal list first meal is beef category
      expect(mealCard, findsOneWidget);

      // tap on the first meal card
      await tester.tap(mealCard);
      await tester.pumpAndSettle();

      final detail = find.byType(MealDetailScreen);
      // Verify that on tap meal card navigate to meal detail screen
      expect(detail, findsOneWidget);

      final tabBarView = find.byType(TabBarView);
      await tester.pump();

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

      expect(find.text('2 Servings'), findsOneWidget);
      expect(find.text('2'), findsWidgets);

      await tester.tap(increment);
      await tester.pumpAndSettle();

      expect(find.text('3 Servings'), findsOneWidget);
      expect(find.text('3'), findsWidgets);

      await tester.tap(decrement);
      await tester.pumpAndSettle();

      expect(find.text('2 Servings'), findsOneWidget);
      expect(find.text('2'), findsWidgets);

      await tester.tap(decrement);
      await tester.pumpAndSettle();

      expect(find.text('1 Servings'), findsOneWidget);
      expect(find.text('1'), findsWidgets);

      await tester.tap(decrement);
      await tester.pumpAndSettle();

      expect(find.text('1 Servings'), findsOneWidget);
      expect(find.text('1'), findsWidgets);

      await tester.timedDrag(tabBarView, const Offset(-400, 0),
          const Duration(milliseconds: 2000));
      // await Future<void>.delayed(const Duration(milliseconds: 5000));
      await tester.pumpAndSettle();

      // Verify that second tab showing steps article markdown
      expect(find.byType(ArticleMarkdown), findsOneWidget);

      await tester.timedDrag(tabBarView, const Offset(-400, 0),
          const Duration(milliseconds: 2000));
      await tester.pumpAndSettle();

      // Verify that third tab showing Coming Soon
      expect(find.text('Coming Soon'), findsOneWidget);
    },
  );
}
