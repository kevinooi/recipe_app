import 'package:recipe_app/blocs/blocs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('MealBloc test', () {
    late MealBloc mealBloc;
    MockMealRepository mealRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mealRepository = MockMealRepository();
      mealBloc = MealBloc(mealRepository: mealRepository);
    });

    test(
      "expect [MealLoading] for meal bloc initial state",
      () {
        expect(mealBloc.state.runtimeType, MealLoading);
      },
    );

    blocTest<MealBloc, MealState>(
      'emits [MealLoading, MealLoaded] states for '
      'successful meals load',
      build: () => mealBloc,
      act: (bloc) => bloc.add(const LoadMeals()),
      expect: () => [
        MealLoading(),
        const MealLoaded(meals: mockMeals),
      ],
    );

    // blocTest<MealBloc, MealState>(
    //   'emits [MealError] state if contract is null',
    //   build: () => MealBloc(mealRepository: null),
    //   act: (bloc) => bloc.add(const LoadMeals()),
    //   expect: () => [
    //     MealError(),
    //   ],
    // );

    tearDown(() {
      mealBloc.close();
    });
  });
}
