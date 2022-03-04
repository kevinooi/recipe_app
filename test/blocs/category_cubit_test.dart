import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('CategoryCubit test', () {
    late CategoryCubit categoryCubit;
    MockCategoryRepository mockCategoryRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mockCategoryRepository = MockCategoryRepository();
      categoryCubit = CategoryCubit(mockCategoryRepository);
    });

    test("expect [CategoryLoading] for category cubit initial state", () {
      expect(categoryCubit.state.runtimeType, CategoryLoading);
    });

    blocTest<CategoryCubit, MockCategoryState>(
      'emits [CategoryLoading, CategoryLoaded] states for'
      'successful categories load',
      build: () => categoryCubit,
      act: (cubit) => cubit.getCategories(),
      expect: () => [
        CategoryLoading(),
        const CategoryLoaded(categories: mockFoodCategories),
      ],
    );

    blocTest<CategoryCubit, MockCategoryState>(
      'emits [CategoryError] state if contract is null',
      build: () => CategoryCubit(null),
      act: (cubit) => cubit.getCategories(),
      expect: () => [
        CategoryError(),
      ],
    );

    tearDown(() {
      categoryCubit.close();
    });
  });
}
