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
    on<LoadCategories>(_onLoadCategories);
  }

  void _onLoadCategories(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    try {
      final categories = await _categoryRepository.getAllCategories();
      if (categories != null) {
        emit(
          CategoryLoaded(categories: categories),
        );
      }
    } catch (_) {
      emit(CategoryError());
    }
  }
}
