import 'package:astro_flutter/model/drink_category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/repositories.dart';

part 'cache_drink_category_state.dart';

class DrinkCategoryCubit extends Cubit<CacheDrinkCategoryState> {
  DrinkCategoryCubit(this.mockCategoryRepository)
      : super(DrinkCategoryLoading());

  final MockCategoryRepository? mockCategoryRepository;

  void getDrinkCategories() async {
    if (mockCategoryRepository == null) return emit(DrinkCategoryError());

    try {
      emit(DrinkCategoryLoading());

      final drinkCategories =
          await mockCategoryRepository!.getDrinkCategories('');
      emit(DrinkCategoryLoaded(drinkCategories: drinkCategories));
    } catch (_) {
      emit(DrinkCategoryError());
    }
  }
}
