import '../blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/meal_model.dart';
import '../../repositories/repositories.dart';

part 'meal_detail_event.dart';
part 'meal_detail_state.dart';

class MealDetailBloc extends Bloc<MealDetailEvent, MealDetailState> {
  final BaseMealRepository _mealRepository;
  final CacheMealCubit _cacheMealCubit;
  MealDetailBloc({
    required BaseMealRepository mealRepository,
    required CacheMealCubit cacheMealCubit,
  })  : _mealRepository = mealRepository,
        _cacheMealCubit = cacheMealCubit,
        super(MealDetailLoading()) {
    on<LoadMealDetail>(_onLoadMealDetail);
  }

  void _onLoadMealDetail(
    LoadMealDetail event,
    Emitter<MealDetailState> emit,
  ) async {
    if (_cacheMealCubit.state?.idMeal == event.id) {
      return emit(
        MealDetailLoaded(meal: _cacheMealCubit.state!),
      );
    }
    emit(MealDetailLoading());
    try {
      Meal? meal = await _mealRepository.getMealById(event.id);
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
