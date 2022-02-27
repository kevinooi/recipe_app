part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class LoadMeals extends MealEvent {
  final String strCategory;

  const LoadMeals({this.strCategory = ''});

  @override
  List<Object> get props => [strCategory];
}
