import 'package:astro_flutter/model/meal_model.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mock_meal_state.dart';

class MealCubit extends Cubit<MockMealState> {
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
