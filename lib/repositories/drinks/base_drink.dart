import '../../model/drink_model.dart';

abstract class BaseDrinkRepository {
  Future<List<Drink>> getDrinksByCategory(String strDrink) async => [];

  Future<Drink?> getDrinkById(String idDrink) async => await null;
}
