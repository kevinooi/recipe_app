import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/meal_model.dart';
import '../../repositories/repositories.dart';

part 'meal_detail_event.dart';
part 'meal_detail_state.dart';

class MealDetailBloc extends Bloc<MealDetailEvent, MealDetailState> {
  final MealRepository _mealRepository;
  MealDetailBloc({required MealRepository mealRepository})
      : _mealRepository = mealRepository,
        super(MealDetailLoading()) {
    on<LoadMealDetail>(_onLoadMealDetail);
  }

  void _onLoadMealDetail(
    LoadMealDetail event,
    Emitter<MealDetailState> emit,
  ) async {
    emit(MealDetailLoading());
    try {
      Meal? meal = await _mealRepository.getMealById(event.id);
      if (meal != null) {
        emit(
          MealDetailLoaded(meal: meal),
        );
      } else {
        emit(MealDetailError());
      }
    } catch (_) {
      emit(MealDetailError());
    }
  }
}
