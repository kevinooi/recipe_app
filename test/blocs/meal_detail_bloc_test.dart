import 'package:recipe_app/blocs/blocs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('Meal Detail Bloc test', () {
    late MealDetailBloc mealDetailBloc;
    late CacheMealCubit cacheMealCubit;
    MockMealRepository mealRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mealRepository = MockMealRepository();
      cacheMealCubit = CacheMealCubit();
      mealDetailBloc = MealDetailBloc(
        mealRepository: mealRepository,
        cacheMealCubit: cacheMealCubit,
      );
    });

    test(
      "expect [MealDetailLoading] for meal detail state initial state",
      () {
        expect(mealDetailBloc.state.runtimeType, MealDetailLoading);
      },
    );

    blocTest<MealDetailBloc, MealDetailState>(
      'emits [MealDetailLoading, MealDetailLoaded] states for '
      'successful meal detail load',
      build: () => mealDetailBloc,
      act: (bloc) => bloc.add(const LoadMealDetail(id: '1')),
      expect: () => [
        MealDetailLoading(),
        MealDetailLoaded(meal: mockMeals.first),
      ],
    );

    blocTest<MealDetailBloc, MealDetailState>(
      'emits [MealDetailLoaded] state with correct meal detail if '
      'user choose the same meal detail',
      build: () {
        cacheMealCubit.saveMealAsCache(mockMeals.first);
        return mealDetailBloc;
      },
      act: (bloc) => bloc.add(const LoadMealDetail(id: '1')),
      expect: () => [MealDetailLoaded(meal: mockMeals.first)],
    );

    // blocTest<MealDetailBloc, MealDetailState>(
    //   'emits [MealDetailError] state if contract is null',
    //   build: () => MealDetailBloc(
    //     mealRepository: null,
    //     cacheMealCubit: cacheMealCubit,
    //   ),
    //   act: (bloc) => bloc.add(const LoadMealDetail(id: '1')),
    //   expect: () => [
    //     MealDetailError(),
    //   ],
    // );

    tearDown(() {
      mealDetailBloc.close();
      cacheMealCubit.close();
    });
  });
}
