import 'package:astro_flutter/model/category_model.dart';
import 'package:astro_flutter/repositories/categories/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc({required CategoryRepository categoryRepository})
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
      List<Category>? categories =
          await _categoryRepository.getFoodCategories();
      emit(
        CategoryLoaded(categories: categories ?? []),
      );
    } catch (_) {
      emit(CategoryError());
    }
  }
}
