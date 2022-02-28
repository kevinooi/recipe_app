import 'package:astro_flutter/model/meal_model.dart';

abstract class BaseMealRepository {
  Future<List<Meal>> getMealsByCategory(String strCategory) async => [];
}
