part of 'drink_cubit.dart';

abstract class CacheDrinkState extends Equatable {
  const CacheDrinkState();

  @override
  List<Object> get props => [];
}

class DrinkLoading extends CacheDrinkState {}

class DrinkLoaded extends CacheDrinkState {
  final List<Drink> drinks;
  const DrinkLoaded({required this.drinks});

  @override
  List<Object> get props => [drinks];
}

class DrinkError extends CacheDrinkState {}
