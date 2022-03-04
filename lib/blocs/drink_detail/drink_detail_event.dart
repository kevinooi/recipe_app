part of 'drink_detail_bloc.dart';

abstract class DrinkDetailEvent extends Equatable {
  const DrinkDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadDrinkDetail extends DrinkDetailEvent {
  final String id;

  const LoadDrinkDetail({this.id = ''});

  @override
  List<Object> get props => [id];
}
