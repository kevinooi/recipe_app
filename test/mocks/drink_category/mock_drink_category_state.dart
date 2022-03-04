part of 'drink_category_cubit.dart';

abstract class MockDrinkCategoryState extends Equatable {
  const MockDrinkCategoryState();

  @override
  List<Object> get props => [];
}

class DrinkCategoryLoading extends MockDrinkCategoryState {}

class DrinkCategoryLoaded extends MockDrinkCategoryState {
  final List<DrinkCategory> drinkCategories;
  const DrinkCategoryLoaded({required this.drinkCategories});

  @override
  List<Object> get props => [drinkCategories];
}

class DrinkCategoryError extends MockDrinkCategoryState {}
