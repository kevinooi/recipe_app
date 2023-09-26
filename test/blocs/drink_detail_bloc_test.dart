import 'package:recipe_app/blocs/blocs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('Drink Detail Bloc test', () {
    late DrinkDetailBloc drinkDetailBloc;
    MockDrinkRepository drinkRepository;
    late CacheDrinkCubit cacheDrinkCubit;

    setUp(() {
      EquatableConfig.stringify = true;
      drinkRepository = MockDrinkRepository();
      cacheDrinkCubit = CacheDrinkCubit();
      drinkDetailBloc = DrinkDetailBloc(
        drinkRepository: drinkRepository,
        cacheDrinkCubit: cacheDrinkCubit,
      );
    });

    test(
      "expect [DrinkDetailLoading] for drink detail bloc initial state",
      () {
        expect(drinkDetailBloc.state.runtimeType, DrinkDetailLoading);
      },
    );

    blocTest<DrinkDetailBloc, DrinkDetailState>(
      'emits [DrinkDetailLoading, DrinkDetailLoaded] states for '
      'successful drink detail load',
      build: () => drinkDetailBloc,
      act: (bloc) => bloc.add(const LoadDrinkDetail(id: '1')),
      expect: () => [
        DrinkDetailLoading(),
        DrinkDetailLoaded(drink: mockDrinks.first),
      ],
    );

    blocTest<DrinkDetailBloc, DrinkDetailState>(
      'emits [DrinkDetailLoaded] state with correct drink detail if '
      'user choose the same drink detail',
      build: () {
        cacheDrinkCubit.saveDrinkAsCache(mockDrinks.first);
        return drinkDetailBloc;
      },
      act: (bloc) => bloc.add(const LoadDrinkDetail(id: '1')),
      expect: () => [DrinkDetailLoaded(drink: mockDrinks.first)],
    );

    // blocTest<DrinkDetailBloc, DrinkDetailState>(
    //   'emits [DrinkDetailError] state if contract is null',
    //   build: () => DrinkDetailBloc(
    //     drinkRepostory: null,
    //     cacheDrinkCubit: cacheDrinkCubit,
    //   ),
    //   act: (bloc) => bloc.add(const LoadDrinkDetail(id: '1')),
    //   expect: () => [
    //     DrinkDetailError(),
    //   ],
    // );

    tearDown(() {
      drinkDetailBloc.close();
      cacheDrinkCubit.close();
    });
  });
}
