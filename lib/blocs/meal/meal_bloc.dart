import 'package:astro_flutter/model/meal_model.dart';
import 'package:astro_flutter/repositories/meals/meal_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final MealRepository _mealRepository;
  MealBloc({required MealRepository mealRepository})
      : _mealRepository = mealRepository,
        super(MealLoading()) {
    on<LoadMeals>(_onLoadMeals);
  }

  void _onLoadMeals(
    LoadMeals event,
    Emitter<MealState> emit,
  ) async {
    emit(MealLoading());
    try {
      List<Meal>? meals =
          await _mealRepository.getMealsByCategory(event.strCategory);
      emit(
        MealLoaded(meals: meals),
      );
    } catch (_) {
      emit(MealError());
    }
  }
}
