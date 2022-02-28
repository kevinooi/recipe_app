import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/drink_category_model.dart';
import '../../repositories/categories/category_repository.dart';

part 'drink_category_event.dart';
part 'drink_category_state.dart';

class DrinkCategoryBloc extends Bloc<DrinkCategoryEvent, DrinkCategoryState> {
  final CategoryRepository _categoryRepository;

  DrinkCategoryBloc({required CategoryRepository categoryRepository})
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
      List<DrinkCategory>? drinkCategories =
          await _categoryRepository.getDrinkCategories(event.strDrink);
      emit(
        DrinkCategoryLoaded(drinkCategories: drinkCategories),
      );
    } catch (_) {
      emit(DrinkCategoryError());
    }
  }
}
