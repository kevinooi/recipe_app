part of 'drink_category_bloc.dart';

abstract class DrinkCategoryEvent extends Equatable {
  const DrinkCategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadDrinkCategories extends DrinkCategoryEvent {
  final String strDrink;

  const LoadDrinkCategories({this.strDrink = 'Soft Drink'});

  @override
  List<Object> get props => [strDrink];
}
