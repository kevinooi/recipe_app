import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/drink_category_model.dart';
import '../../repositories/repositories.dart';

part 'drink_category_event.dart';
part 'drink_category_state.dart';

class DrinkCategoryBloc extends Bloc<DrinkCategoryEvent, DrinkCategoryState> {
  final BaseCategoryRepository _categoryRepository;

  DrinkCategoryBloc({required BaseCategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(DrinkCategoryLoading()) {
    on<LoadDrinkCategories>(_onLoadDrinkCategories);
  }

  void _onLoadDrinkCategories(
    LoadDrinkCategories event,
    Emitter<DrinkCategoryState> emit,
  ) async {
    emit(DrinkCategoryLoading());
    try {
      List<DrinkCategory> drinkCategories =
          await _categoryRepository.getDrinkCategories(event.strDrink);
      emit(
        DrinkCategoryLoaded(drinkCategories: drinkCategories),
      );
    } catch (_) {
      emit(DrinkCategoryError());
    }
  }
}
