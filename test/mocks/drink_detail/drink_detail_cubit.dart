import 'package:astro_flutter/blocs/blocs.dart';
import 'package:astro_flutter/model/drink_model.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drink_detail_state.dart';

class DrinkDetailCubit extends Cubit<DrinkDetailState> {
  final MockDrinkRepository? mockDrinkRepository;
  final CacheDrinkCubit _cacheDrinkCubit;
  DrinkDetailCubit(this.mockDrinkRepository, this._cacheDrinkCubit)
      : super(DrinkDetailLoading());

  void getDrinkById(String idDrink) async {
    if (mockDrinkRepository == null) return emit(DrinkDetailError());
    if (_cacheDrinkCubit.state?.idDrink == idDrink) {
      return emit(
        DrinkDetailLoaded(drink: _cacheDrinkCubit.state!),
      );
    }
    emit(DrinkDetailLoading());
    try {
      Drink? drink = await mockDrinkRepository!.getDrinkById(idDrink);
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
