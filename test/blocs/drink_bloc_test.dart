import 'package:astro_flutter/blocs/blocs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('DrinkBloc test', () {
    late DrinkBloc drinkBloc;
    MockDrinkRepository drinkRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      drinkRepository = MockDrinkRepository();
      drinkBloc = DrinkBloc(drinkRepository: drinkRepository);
    });

    test(
      "expect [DrinkLoading] for drink bloc initial state",
      () {
        expect(drinkBloc.state.runtimeType, DrinkLoading);
      },
    );

    blocTest<DrinkBloc, DrinkState>(
      'emits [DrinkLoading, DrinkLoaded] states for '
      'successful drinks load',
      build: () => drinkBloc,
      act: (bloc) => bloc.add(const LoadDrinks()),
      expect: () => [
        DrinkLoading(),
        const DrinkLoaded(drinks: mockDrinks),
      ],
    );

    // blocTest<DrinkBloc, DrinkState>(
    //   'emits [DrinkError] state if contract is null',
    //   build: () => DrinkBloc(drinkRepository: null),
    //   act: (bloc) => bloc.add(const LoadDrinks()),
    //   expect: () => [
    //     DrinkError(),
    //   ],
    // );

    tearDown(() {
      drinkBloc.close();
    });
  });
}
