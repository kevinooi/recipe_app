import 'package:astro_flutter/blocs/blocs.dart';
import 'package:astro_flutter/model/meal_model.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'meal_detail_state.dart';

class MealDetailCubit extends Cubit<MealDetailState> {
  final MockMealRepository? mockMealRepository;
  final CacheMealCubit _cacheMealCubit;
  MealDetailCubit(this.mockMealRepository, this._cacheMealCubit)
      : super(MealDetailLoading());

  void getMealById(String idMeal) async {
    if (mockMealRepository == null) return emit(MealDetailError());
    if (_cacheMealCubit.state?.idMeal == idMeal) {
      return emit(
        MealDetailLoaded(meal: _cacheMealCubit.state!),
      );
    }
    emit(MealDetailLoading());
    try {
      Meal? meal = await mockMealRepository!.getMealById(idMeal);
      if (meal != null) {
        emit(
          MealDetailLoaded(meal: meal),
        );
        _cacheMealCubit.saveMealAsCache(meal);
      } else {
        emit(MealDetailError());
      }
    } catch (_) {
      emit(MealDetailError());
    }
  }
}
