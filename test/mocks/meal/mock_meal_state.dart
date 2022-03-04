part of 'meal_cubit.dart';

abstract class MockMealState extends Equatable {
  const MockMealState();

  @override
  List<Object> get props => [];
}

class MealLoading extends MockMealState {}

class MealLoaded extends MockMealState {
  final List<Meal> meals;
  const MealLoaded({required this.meals});

  @override
  List<Object> get props => [meals];
}

class MealError extends MockMealState {}
