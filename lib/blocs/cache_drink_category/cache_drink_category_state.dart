part of 'drink_category_cubit.dart';

abstract class CacheDrinkCategoryState extends Equatable {
  const CacheDrinkCategoryState();

  @override
  List<Object> get props => [];
}

class DrinkCategoryLoading extends CacheDrinkCategoryState {}

class DrinkCategoryLoaded extends CacheDrinkCategoryState {
  final List<DrinkCategory> drinkCategories;
  const DrinkCategoryLoaded({required this.drinkCategories});

  @override
  List<Object> get props => [drinkCategories];
}

class DrinkCategoryError extends CacheDrinkCategoryState {}
