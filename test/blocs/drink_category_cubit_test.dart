import 'package:astro_flutter/blocs/cache_drink_category/drink_category_cubit.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DrinkCategoryCubit test', () {
    late DrinkCategoryCubit drinkCategoryCubit;
    MockCategoryRepository mockCategoryRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mockCategoryRepository = MockCategoryRepository();
      drinkCategoryCubit = DrinkCategoryCubit(mockCategoryRepository);
    });

    blocTest<DrinkCategoryCubit, CacheDrinkCategoryState>(
      'emits [DrinkCategoryLoading, DrinkCategoryLoaded] states for'
      'successful drink categories load',
      build: () => drinkCategoryCubit,
      act: (cubit) => cubit.getDrinkCategories(),
      expect: () => [
        DrinkCategoryLoading(),
        const DrinkCategoryLoaded(drinkCategories: mockDrinkCategories),
      ],
    );

    blocTest<DrinkCategoryCubit, CacheDrinkCategoryState>(
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
