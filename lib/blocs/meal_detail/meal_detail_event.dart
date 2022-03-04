part of 'meal_detail_bloc.dart';

abstract class MealDetailEvent extends Equatable {
  const MealDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadMealDetail extends MealDetailEvent {
  final String id;

  const LoadMealDetail({this.id = ''});

  @override
  List<Object> get props => [id];
}
