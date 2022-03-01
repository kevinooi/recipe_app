import '../../model/drink_model.dart';
import 'base_drink.dart';

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

class MockDrinkRepository extends BaseDrinkRepository {
  @override
  Future<List<Drink>> getDrinksByCategory(String strDrink) async =>
      Future.delayed(const Duration(seconds: 2), () => [...mockDrinks]);
}
