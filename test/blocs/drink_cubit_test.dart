import 'package:astro_flutter/blocs/cache_drink/drink_cubit.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DrinkCubit test', () {
    late DrinkCubit drinkCubit;
    MockDrinkRepository mockDrinkRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mockDrinkRepository = MockDrinkRepository();
      drinkCubit = DrinkCubit(mockDrinkRepository);
    });

    test("expect [DrinkLoading] for drink cubit initial state", () {
      expect(drinkCubit.state.runtimeType, DrinkLoading);
    });

    blocTest<DrinkCubit, CacheDrinkState>(
      'emits [DrinkLoading, DrinkLoaded] states for'
      'successful drinks load',
      build: () => drinkCubit,
      act: (cubit) => cubit.getDrinksByCategory(''),
      expect: () => [
        DrinkLoading(),
        const DrinkLoaded(drinks: mockDrinks),
      ],
    );

    blocTest<DrinkCubit, CacheDrinkState>(
      'emits [DrinkError] state if contract is null',
      build: () => DrinkCubit(null),
      act: (cubit) => cubit.getDrinksByCategory(''),
      expect: () => [
        DrinkError(),
      ],
    );

    tearDown(() {
      drinkCubit.close();
    });
  });
}
