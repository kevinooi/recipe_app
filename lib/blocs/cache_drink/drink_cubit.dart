import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/drink_model.dart';
import '../../repositories/drinks/mock_drink_repository.dart';

part 'cache_drink_state.dart';

class DrinkCubit extends Cubit<CacheDrinkState> {
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
