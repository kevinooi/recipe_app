import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuInitial(menu: 'Food'));

  void selectFood() {
    emit(const MenuInitial(menu: 'Food'));
  }

  void selectDrink() {
    emit(const MenuInitial(menu: 'Drink'));
  }
}
