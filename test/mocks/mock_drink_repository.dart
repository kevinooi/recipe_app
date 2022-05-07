import 'package:astro_flutter/model/drink_model.dart';
import 'package:astro_flutter/repositories/repositories.dart';

class MockDrinkRepository extends BaseDrinkRepository {
  @override
  Future<List<Drink>> getDrinksByCategory(String strDrink) async =>
      await Future.value(mockDrinks);

  @override
  Future<Drink?> getDrinkById(String idDrink) async =>
      await Future.value(mockDrinks.first);
}

const mockDrinks = [
  Drink(
    idDrink: '1',
    strDrinkThumb: 'https://picsum.photos/id/488/80/80',
    strDrink: 'Drink 1',
    strCategory: 'Drink 1 Category',
    strAlcoholic: 'Alcoholic',
  ),
  Drink(
    idDrink: '2',
    strDrinkThumb: 'https://picsum.photos/id/431/80/80',
    strDrink: 'Drink 2',
    strCategory: 'Drink 2 Category',
    strAlcoholic: 'Non-alcoholic',
  ),
];
