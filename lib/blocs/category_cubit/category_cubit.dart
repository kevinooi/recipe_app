import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/category_model.dart';
import '../../../repositories/repositories.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.mockCategoryRepository) : super(CategoryLoading());

  final MockCategoryRepository mockCategoryRepository;

  void getCategories() async {
    try {
      emit(CategoryLoading());

      final categories = await mockCategoryRepository.getFoodCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (_) {
      emit(CategoryError());
    }
  }
}
