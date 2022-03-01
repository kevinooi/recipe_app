import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/category_model.dart';
import '../../../repositories/repositories.dart';

part 'cache_category_state.dart';

class CategoryCubit extends Cubit<CacheCategoryState> {
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
