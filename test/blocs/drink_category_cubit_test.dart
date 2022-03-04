import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('DrinkCategoryCubit test', () {
    late DrinkCategoryCubit drinkCategoryCubit;
    MockCategoryRepository mockCategoryRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mockCategoryRepository = MockCategoryRepository();
      drinkCategoryCubit = DrinkCategoryCubit(mockCategoryRepository);
    });

    test("expect [DrinkCategoryLoading] for drink category cubit initial state",
        () {
      expect(drinkCategoryCubit.state.runtimeType, DrinkCategoryLoading);
    });

    blocTest<DrinkCategoryCubit, MockDrinkCategoryState>(
      'emits [DrinkCategoryLoading, DrinkCategoryLoaded] states for'
      'successful drink categories load',
      build: () => drinkCategoryCubit,
      act: (cubit) => cubit.getDrinkCategories(),
      expect: () => [
        DrinkCategoryLoading(),
        const DrinkCategoryLoaded(drinkCategories: mockDrinkCategories),
      ],
    );

    blocTest<DrinkCategoryCubit, MockDrinkCategoryState>(
      'emits [DrinkCategoryError] state if contract is null',
      build: () => DrinkCategoryCubit(null),
      act: (cubit) => cubit.getDrinkCategories(),
      expect: () => [
        DrinkCategoryError(),
      ],
    );

    tearDown(() {
      drinkCategoryCubit.close();
    });
  });
}
