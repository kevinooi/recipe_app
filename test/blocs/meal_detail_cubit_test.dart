import 'package:astro_flutter/blocs/cache/cache_meal_cubit.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('Meal Detail Cubit test', () {
    late MealDetailCubit mealDetailCubit;
    MockMealRepository mockMealRepository;
    late CacheMealCubit cacheMealCubit;

    setUp(() {
      EquatableConfig.stringify = true;
      mockMealRepository = MockMealRepository();
      cacheMealCubit = CacheMealCubit();
      mealDetailCubit = MealDetailCubit(mockMealRepository, cacheMealCubit);
    });

    test("expect [MealDetailLoading] for meal detail cubit initial state", () {
      expect(mealDetailCubit.state.runtimeType, MealDetailLoading);
    });

    blocTest<MealDetailCubit, MealDetailState>(
      'emits [MealDetailLoading, MealDetailLoaded] states for'
      'successful meal detail load',
      build: () => mealDetailCubit,
      act: (cubit) => cubit.getMealById('1'),
      expect: () => [
        MealDetailLoading(),
        MealDetailLoaded(meal: mockMeals.first),
      ],
    );

    blocTest<MealDetailCubit, MealDetailState>(
      'emits [MealDetailLoaded] state with correct meal detail if '
      'user choose the same meal detail',
      build: () {
        cacheMealCubit.saveMealAsCache(mockMeals.first);
        return mealDetailCubit;
      },
      act: (cubit) => cubit.getMealById('1'),
      expect: () => [MealDetailLoaded(meal: mockMeals.first)],
    );

    blocTest<MealDetailCubit, MealDetailState>(
      'emits [MealDetailError] state if contract is null',
      build: () => MealDetailCubit(null, cacheMealCubit),
      act: (cubit) => cubit.getMealById('1'),
      expect: () => [
        MealDetailError(),
      ],
    );

    tearDown(() {
      mealDetailCubit.close();
      cacheMealCubit.close();
    });
  });
}
