import 'package:astro_flutter/model/drink_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/repositories.dart';

part 'drink_detail_event.dart';
part 'drink_detail_state.dart';

class DrinkDetailBloc extends Bloc<DrinkDetailEvent, DrinkDetailState> {
  final DrinkRepository _drinkRepository;
  DrinkDetailBloc({required DrinkRepository drinkRepository})
      : _drinkRepository = drinkRepository,
        super(DrinkDetailLoading()) {
    on<LoadDrinkDetail>(_onLoadDrinkDetail);
  }

  void _onLoadDrinkDetail(
    LoadDrinkDetail event,
    Emitter<DrinkDetailState> emit,
  ) async {
    emit(DrinkDetailLoading());
    try {
      Drink? drink = await _drinkRepository.getDrinkById(event.id);
      if (drink != null) {
        emit(
          DrinkDetailLoaded(drink: drink),
        );
      } else {
        emit(DrinkDetailError());
      }
    } catch (_) {
      emit(DrinkDetailError());
    }
  }
}
