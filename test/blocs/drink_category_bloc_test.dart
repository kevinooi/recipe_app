import 'package:recipe_app/blocs/blocs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('DrinkCategoryBloc test', () {
    late DrinkCategoryBloc drinkCategoryBloc;
    MockCategoryRepository categoryRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      categoryRepository = MockCategoryRepository();
      drinkCategoryBloc =
          DrinkCategoryBloc(categoryRepository: categoryRepository);
    });

    test(
      "expect [DrinkCategoryLoading] for drink category bloc initial state",
      () {
        expect(drinkCategoryBloc.state.runtimeType, DrinkCategoryLoading);
      },
    );

    blocTest<DrinkCategoryBloc, DrinkCategoryState>(
      'emits [DrinkCategoryLoading, DrinkCategoryLoaded] states for '
      'successful drink categories load',
      build: () => drinkCategoryBloc,
      act: (bloc) => bloc.add(const LoadDrinkCategories()),
      expect: () => [
        DrinkCategoryLoading(),
        const DrinkCategoryLoaded(drinkCategories: mockDrinkCategories),
      ],
    );

    // blocTest<DrinkCategoryBloc, DrinkCategoryState>(
    //   'emits [DrinkCategoryError] state if contract is null',
    //   build: () => DrinkCategoryBloc(categoryRepository: null),
    //   act: (bloc) => bloc.add(const LoadDrinkCategories()),
    //   expect: () => [
    //     DrinkCategoryError(),
    //   ],
    // );

    tearDown(() {
      drinkCategoryBloc.close();
    });
  });
}
