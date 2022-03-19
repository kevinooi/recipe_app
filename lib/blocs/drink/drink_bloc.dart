import '../../model/drink_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/repositories.dart';

part 'drink_event.dart';
part 'drink_state.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  final BaseDrinkRepository _drinkRepository;
  DrinkBloc({required BaseDrinkRepository drinkRepository})
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
      if (event.strDrink.toLowerCase() == 'belgian blue') {
        emit(
          BelgianBlue(drinks: drinks),
        );
      }
      emit(
        DrinkLoaded(drinks: drinks),
      );
    } catch (_) {
      emit(DrinkError());
    }
  }
}
