import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/meal_model.dart';
import '../../repositories/repositories.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final BaseMealRepository _mealRepository;
  MealBloc({required BaseMealRepository mealRepository})
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
      List<Meal> meals =
          await _mealRepository.getMealsByCategory(event.strCategory);
      emit(
        MealLoaded(meals: meals),
      );
    } catch (_) {
      emit(MealError());
    }
  }
}
