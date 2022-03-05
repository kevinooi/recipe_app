import 'package:astro_flutter/blocs/cache/cache_drink_cubit.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('Drink Detail Cubit test', () {
    late DrinkDetailCubit drinkDetailCubit;
    MockDrinkRepository mockDrinkRepository;
    late CacheDrinkCubit cacheDrinkCubit;

    setUp(() {
      EquatableConfig.stringify = true;
      mockDrinkRepository = MockDrinkRepository();
      cacheDrinkCubit = CacheDrinkCubit();
      drinkDetailCubit = DrinkDetailCubit(mockDrinkRepository, cacheDrinkCubit);
    });

    test("expect [DrinkDetailLoading] for drink detail cubit initial state",
        () {
      expect(drinkDetailCubit.state.runtimeType, DrinkDetailLoading);
    });

    blocTest<DrinkDetailCubit, DrinkDetailState>(
      'emits [DrinkDetailLoading, DrinkDetailLoaded] states for'
      'successful drink detail load',
      build: () => drinkDetailCubit,
      act: (cubit) => cubit.getDrinkById('1'),
      expect: () => [
        DrinkDetailLoading(),
        DrinkDetailLoaded(drink: mockDrinks.first),
      ],
    );

    blocTest<DrinkDetailCubit, DrinkDetailState>(
      'emits [DrinkDetailLoaded] state with correct drink detail if '
      'user choose the same drink detail',
      build: () {
        cacheDrinkCubit.saveDrinkAsCache(mockDrinks.first);
        return drinkDetailCubit;
      },
      act: (cubit) => cubit.getDrinkById('1'),
      expect: () => [DrinkDetailLoaded(drink: mockDrinks.first)],
    );

    blocTest<DrinkDetailCubit, DrinkDetailState>(
      'emits [DrinkDetailError] state if contract is null',
      build: () => DrinkDetailCubit(null, cacheDrinkCubit),
      act: (cubit) => cubit.getDrinkById('1'),
      expect: () => [
        DrinkDetailError(),
      ],
    );

    tearDown(() {
      drinkDetailCubit.close();
      cacheDrinkCubit.close();
    });
  });
}
