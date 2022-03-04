import 'package:astro_flutter/model/category_model.dart';
import 'package:astro_flutter/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mock_category_state.dart';

class CategoryCubit extends Cubit<MockCategoryState> {
  CategoryCubit(this.mockCategoryRepository) : super(CategoryLoading());

  final MockCategoryRepository? mockCategoryRepository;

  void getCategories() async {
    if (mockCategoryRepository == null) return emit(CategoryError());
    try {
      emit(CategoryLoading());

      final categories = await mockCategoryRepository!.getFoodCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (_) {
      emit(CategoryError());
    }
  }
}
