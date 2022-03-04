part of 'drink_detail_bloc.dart';

abstract class DrinkDetailState extends Equatable {
  const DrinkDetailState();

  @override
  List<Object> get props => [];
}

class DrinkDetailLoading extends DrinkDetailState {}

class DrinkDetailLoaded extends DrinkDetailState {
  final Drink drink;

  const DrinkDetailLoaded({required this.drink});

  @override
  List<Object> get props => [drink];
}

class DrinkDetailError extends DrinkDetailState {}
