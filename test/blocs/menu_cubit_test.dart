import 'package:astro_flutter/blocs/blocs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MenuCubit test', () {
    late MenuCubit menuCubit;

    setUp(() {
      menuCubit = MenuCubit();
    });

    test("expect MenuInitial('Food') for menu cubit initial state", () {
      expect(
        menuCubit.state,
        const MenuInitial(menu: 'Food'),
      );
    });

    test('expect true for isFoodSelected flag if selectFood', () {
      menuCubit.selectFood();
      expect(
        menuCubit.isFoodSelected,
        true,
      );
    });

    test('expect false for isFoodSelected flag if selectDrink', () {
      menuCubit.selectDrink();
      expect(
        menuCubit.isFoodSelected,
        false,
      );
    });

    blocTest<MenuCubit, MenuState>(
      "expect [MenuInitial('Food')] for selectFood",
      build: () => menuCubit,
      act: (cubit) => cubit.selectFood(),
      expect: () => [const MenuInitial(menu: 'Food')],
    );

    blocTest<MenuCubit, MenuState>(
      "expect [MenuInitial('Drink')] for selectDrink",
      build: () => menuCubit,
      act: (cubit) => cubit.selectDrink(),
      expect: () => [const MenuInitial(menu: 'Drink')],
    );

    tearDown(() {
      menuCubit.close();
    });
  });
}
