part of 'meal_detail_cubit.dart';

abstract class MealDetailState extends Equatable {
  const MealDetailState();

  @override
  List<Object> get props => [];
}

class MealDetailLoading extends MealDetailState {}

class MealDetailLoaded extends MealDetailState {
  final Meal meal;

  const MealDetailLoaded({required this.meal});

  @override
  List<Object> get props => [meal];
}

class MealDetailError extends MealDetailState {}
