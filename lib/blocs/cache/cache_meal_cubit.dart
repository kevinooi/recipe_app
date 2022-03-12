import 'package:bloc/bloc.dart';

import '../../model/meal_model.dart';

class CacheMealCubit extends Cubit<Meal?> {
  CacheMealCubit() : super(null);

  void saveMealAsCache(Meal meal) {
    emit(meal);
  }
}
