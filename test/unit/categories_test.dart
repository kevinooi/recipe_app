import 'package:astro_flutter/blocs/category_cubit/category_cubit.dart';
import 'package:astro_flutter/blocs/drink_category_cubit/drink_category_cubit.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoryCubit and DrinkCategoryCubit test', () {
    late CategoryCubit categoryCubit;
    late DrinkCategoryCubit drinkCategoryCubit;
    MockCategoryRepository mockCategoryRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mockCategoryRepository = MockCategoryRepository();
      categoryCubit = CategoryCubit(mockCategoryRepository);
      drinkCategoryCubit = DrinkCategoryCubit(mockCategoryRepository);
    });

    blocTest<CategoryCubit, CategoryState>(
      'emits [CategoryLoading, CategoryLoaded] states for'
      'successful categories load',
      build: () => categoryCubit,
      act: (cubit) => cubit.getCategories(),
      expect: () => [
        CategoryLoading(),
        const CategoryLoaded(categories: mockFoodCategories),
      ],
    );

    blocTest<DrinkCategoryCubit, DrinkCategoryState>(
      'emits [DrinkCategoryLoading, DrinkCategoryLoaded] states for'
      'successful drink categories load',
      build: () => drinkCategoryCubit,
      act: (cubit) => cubit.getDrinkCategories(),
      expect: () => [
        DrinkCategoryLoading(),
        const DrinkCategoryLoaded(drinkCategories: mockDrinkCategories),
      ],
    );

    tearDown(() {
      categoryCubit.close();
      drinkCategoryCubit.close();
    });
  });
}
