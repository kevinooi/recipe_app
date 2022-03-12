import '../../model/meal_model.dart';
import 'package:bloc/bloc.dart';

class CacheMealCubit extends Cubit<Meal?> {
  CacheMealCubit() : super(null);

  void saveMealAsCache(Meal meal) {
    emit(meal);
  }
}
