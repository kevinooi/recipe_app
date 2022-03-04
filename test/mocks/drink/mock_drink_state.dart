part of 'drink_cubit.dart';

abstract class MockDrinkState extends Equatable {
  const MockDrinkState();

  @override
  List<Object> get props => [];
}

class DrinkLoading extends MockDrinkState {}

class DrinkLoaded extends MockDrinkState {
  final List<Drink> drinks;
  const DrinkLoaded({required this.drinks});

  @override
  List<Object> get props => [drinks];
}

class DrinkError extends MockDrinkState {}
