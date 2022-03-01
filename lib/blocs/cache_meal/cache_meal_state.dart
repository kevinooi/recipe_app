part of 'meal_cubit.dart';

abstract class CacheMealState extends Equatable {
  const CacheMealState();

  @override
  List<Object> get props => [];
}

class MealLoading extends CacheMealState {}

class MealLoaded extends CacheMealState {
  final List<Meal> meals;
  const MealLoaded({required this.meals});

  @override
  List<Object> get props => [meals];
}

class MealError extends CacheMealState {}
