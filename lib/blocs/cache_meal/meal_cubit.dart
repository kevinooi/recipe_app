import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/meal_model.dart';
import '../../repositories/meals/mock_meal_repository.dart';

part 'cache_meal_state.dart';

class MealCubit extends Cubit<CacheMealState> {
  final MockMealRepository? mockMealRepository;
  MealCubit(this.mockMealRepository) : super(MealLoading());

  void getMealsByCategory(String strCategory) async {
    if (mockMealRepository == null) return emit(MealError());

    try {
      emit(MealLoading());

      final meals = await mockMealRepository!.getMealsByCategory(strCategory);
      emit(MealLoaded(meals: meals));
    } catch (_) {
      emit(MealError());
    }
  }
}
