import 'package:astro_flutter/model/drink_model.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mock_drink_state.dart';

class DrinkCubit extends Cubit<MockDrinkState> {
  final MockDrinkRepository? mockDrinkRepository;
  DrinkCubit(this.mockDrinkRepository) : super(DrinkLoading());

  void getDrinksByCategory(String strDrink) async {
    if (mockDrinkRepository == null) return emit(DrinkError());

    try {
      emit(DrinkLoading());

      final drinks = await mockDrinkRepository!.getDrinksByCategory(strDrink);
      emit(DrinkLoaded(drinks: drinks));
    } catch (_) {
      emit(DrinkError());
    }
  }
}
