import '../blocs.dart';
import '../../model/drink_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/repositories.dart';

part 'drink_detail_event.dart';
part 'drink_detail_state.dart';

class DrinkDetailBloc extends Bloc<DrinkDetailEvent, DrinkDetailState> {
  final BaseDrinkRepository _drinkRepository;
  final CacheDrinkCubit _cacheDrinkCubit;
  DrinkDetailBloc({
    required BaseDrinkRepository drinkRepository,
    required CacheDrinkCubit cacheDrinkCubit,
  })  : _drinkRepository = drinkRepository,
        _cacheDrinkCubit = cacheDrinkCubit,
        super(DrinkDetailLoading()) {
    on<LoadDrinkDetail>(_onLoadDrinkDetail);
  }

  void _onLoadDrinkDetail(
    LoadDrinkDetail event,
    Emitter<DrinkDetailState> emit,
  ) async {
    if (_cacheDrinkCubit.state?.idDrink == event.id) {
      return emit(
        DrinkDetailLoaded(drink: _cacheDrinkCubit.state!),
      );
    }
    emit(DrinkDetailLoading());
    try {
      Drink? drink = await _drinkRepository.getDrinkById(event.id);
      if (drink != null) {
        emit(
          DrinkDetailLoaded(drink: drink),
        );
        _cacheDrinkCubit.saveDrinkAsCache(drink);
      } else {
        emit(DrinkDetailError());
      }
    } catch (_) {
      emit(DrinkDetailError());
    }
  }
}
