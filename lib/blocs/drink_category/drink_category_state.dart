part of 'drink_category_bloc.dart';

abstract class DrinkCategoryState extends Equatable {
  const DrinkCategoryState();

  @override
  List<Object> get props => [];
}

class DrinkCategoryLoading extends DrinkCategoryState {}

class DrinkCategoryLoaded extends DrinkCategoryState {
  final List<DrinkCategory> drinkCategories;
  const DrinkCategoryLoaded({required this.drinkCategories});

  @override
  List<Object> get props => [drinkCategories];
}

class DrinkCategoryError extends DrinkCategoryState {}
