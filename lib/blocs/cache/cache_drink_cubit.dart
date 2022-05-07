import '../../model/drink_model.dart';
import 'package:bloc/bloc.dart';

class CacheDrinkCubit extends Cubit<Drink?> {
  CacheDrinkCubit() : super(null);

  void saveDrinkAsCache(Drink drink) {
    emit(drink);
  }
}
