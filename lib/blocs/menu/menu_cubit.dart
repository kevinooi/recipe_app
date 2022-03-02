import 'package:bloc/bloc.dart';

class MenuCubit extends Cubit<String> {
  MenuCubit() : super('Food');

  void selectFood() {
    emit('Food');
  }

  void selectDrink() {
    emit('Drink');
  }

  bool get foodMenu => state == 'Food';
}
