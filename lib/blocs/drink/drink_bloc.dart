import 'package:astro_flutter/model/drink_model.dart';
import 'package:astro_flutter/repositories/drinks/drink_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drink_event.dart';
part 'drink_state.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  final DrinkRepository _drinkRepository;
  DrinkBloc({required DrinkRepository drinkRepository})
      : _drinkRepository = drinkRepository,
        super(DrinkLoading()) {
    on<LoadDrinks>(_onLoadDrinks);
  }

  void _onLoadDrinks(
    LoadDrinks event,
    Emitter<DrinkState> emit,
  ) async {
    emit(DrinkLoading());
    try {
      List<Drink>? drinks =
          await _drinkRepository.getDrinksByCategory(event.strDrink);
      emit(
        DrinkLoaded(drinks: drinks ?? []),
      );
    } catch (_) {
      emit(DrinkError());
    }
  }
}
