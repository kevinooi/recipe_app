import 'package:astro_flutter/model/drink_model.dart';

abstract class BaseDrinkRepository {
  Future<List<Drink>> getDrinksByCategory(String strDrink) async => [];
}
