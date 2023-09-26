import 'package:recipe_app/blocs/blocs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('CategoryBloc test', () {
    late CategoryBloc categoryBloc;
    MockCategoryRepository categoryRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      categoryRepository = MockCategoryRepository();
      categoryBloc = CategoryBloc(categoryRepository: categoryRepository);
    });

    test(
      "expect [CategoryLoading] for category bloc initial state",
      () {
        expect(categoryBloc.state.runtimeType, CategoryLoading);
      },
    );

    blocTest<CategoryBloc, CategoryState>(
      'emits [CategoryLoading, CategoryLoaded] states for '
      'successful categories load',
      build: () {
        return categoryBloc;
      },
      act: (bloc) => bloc.add(LoadFoodCategories()),
      expect: () => [
        CategoryLoading(),
        const CategoryLoaded(categories: mockFoodCategories),
      ],
    );

    // blocTest<CategoryBloc, CategoryState>(
    //   'emits [CategoryError] state if contract is null',
    //   build: () => CategoryBloc(null),
    //   act: (cubit) => cubit.getCategories(),
    //   expect: () => [
    //     CategoryError(),
    //   ],
    // );

    tearDown(() {
      categoryBloc.close();
    });
  });
}
