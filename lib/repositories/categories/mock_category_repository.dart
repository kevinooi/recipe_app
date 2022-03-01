import '../../model/category_model.dart';
import '../../model/drink_category_model.dart';
import 'base_category.dart';

const mockFoodCategories = [
  Category(
    idCategory: '1',
    strCategory: 'Food Category 1',
    strCategoryThumb: 'https://picsum.photos/id/488/80/80',
    strCategoryDescription: 'Food Category 1 description',
  ),
  Category(
    idCategory: '2',
    strCategory: 'Food Category 2',
    strCategoryThumb: 'https://picsum.photos/id/488/80/80',
    strCategoryDescription: 'Food Category 2 description',
  ),
  Category(
    idCategory: '3',
    strCategory: 'Food Category 3',
    strCategoryThumb: 'https://picsum.photos/id/488/80/80',
    strCategoryDescription: 'Food Category 3 description',
  ),
  Category(
    idCategory: '4',
    strCategory: 'Food Category 4',
    strCategoryThumb: 'https://picsum.photos/id/488/80/80',
    strCategoryDescription: 'Food Category 4 description',
  ),
];

const mockDrinkCategories = [
  DrinkCategory(
    idDrink: '1',
    strDrink: 'Drink Category 1',
    strDrinkThumb: 'https://picsum.photos/id/431/80/80',
  ),
  DrinkCategory(
    idDrink: '2',
    strDrink: 'Drink Category 2',
    strDrinkThumb: 'https://picsum.photos/id/431/80/80',
  ),
  DrinkCategory(
    idDrink: '3',
    strDrink: 'Drink Category 3',
    strDrinkThumb: 'https://picsum.photos/id/431/80/80',
  ),
  DrinkCategory(
    idDrink: '4',
    strDrink: 'Drink Category 4',
    strDrinkThumb: 'https://picsum.photos/id/431/80/80',
  ),
];

class MockCategoryRepository extends BaseCategoryRepository {
  @override
  Future<List<Category>> getFoodCategories() async =>
      Future.delayed(const Duration(seconds: 2), () => [...mockFoodCategories]);

  @override
  Future<List<DrinkCategory>> getDrinkCategories(String strCategory) async =>
      Future.delayed(
          const Duration(seconds: 2), () => [...mockDrinkCategories]);
}
