import 'package:astro_flutter/blocs/blocs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MenuCubit test', () {
    late MenuCubit menuCubit;

    setUp(() {
      menuCubit = MenuCubit();
    });

    test("expect 'Food' for menu cubit initial state", () {
      expect(
        menuCubit.state,
        'Food',
      );
    });

    test('expect true for foodMenu flag if selectFood', () {
      menuCubit.selectFood();
      expect(
        menuCubit.foodMenu,
        true,
      );
    });

    test('expect false for foodMenu flag if selectDrink', () {
      menuCubit.selectDrink();
      expect(
        menuCubit.foodMenu,
        false,
      );
    });

    blocTest<MenuCubit, String>(
      "expect ['Food'] for selectFood",
      build: () => menuCubit,
      act: (cubit) => cubit.selectFood(),
      expect: () => ['Food'],
    );

    blocTest<MenuCubit, String>(
      "expect ['Drink'] for selectDrink",
      build: () => menuCubit,
      act: (cubit) => cubit.selectDrink(),
      expect: () => ['Drink'],
    );

    tearDown(() {
      menuCubit.close();
    });
  });
}
