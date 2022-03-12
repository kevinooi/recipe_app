import '../../model/category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/repositories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final BaseCategoryRepository _categoryRepository;

  CategoryBloc({required BaseCategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadFoodCategories>(_onLoadFoodCategories);
  }

  void _onLoadFoodCategories(
    LoadFoodCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    try {
      List<Category> categories = await _categoryRepository.getFoodCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (_) {
      emit(CategoryError());
    }
  }
}
