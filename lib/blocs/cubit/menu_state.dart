part of 'menu_cubit.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {
  final String menu;
  const MenuInitial({required this.menu});
  @override
  List<Object> get props => [menu];
}
